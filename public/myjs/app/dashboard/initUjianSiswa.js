// Mendapatkan path dari URL
const path = window.location.pathname;
const parts = path.split("/");
const id_ujian = parts[parts.length - 1];

document.addEventListener("DOMContentLoaded", async function () {
    await initLoad();
});

async function initLoad() {
    await populateSoal();
}

function getAnswerLabel(correctAnswer, questionId) {
    const answerLabels = {
        question1: { a: "Jakarta", b: "Surabaya", c: "Bandung" },
        question2: { a: "Jakarta", b: "Surabaya", c: "Bandung" },
        question3: { a: "Surabaya", b: "Jakarta", c: "Bandung" },
    };

    return answerLabels[questionId][correctAnswer];
}

function formatDate(validFrom) {
    const months = [
        "Januari",
        "Februari",
        "Maret",
        "April",
        "Mei",
        "Juni",
        "Juli",
        "Agustus",
        "September",
        "Oktober",
        "November",
        "Desember",
    ];

    const date = new Date(validFrom);
    const day = date.getDate();
    const month = months[date.getMonth()];
    const year = date.getFullYear();
    const hours = date.getHours();
    const minutes = date.getMinutes();

    return `${day} ${month} ${year}, ${hours}:${minutes.toString().padStart(2, "0")}`;
}

async function populateSoal() {
    const now = new Date();
    let ujianData = await axios.get(base_url + `/app/ujian/show/${id_ujian}`);
    ujianData = ujianData.data.data;
    const tanggalUjian = new Date(ujianData.valid_upto.replace(" ", "T"));

    const isAttempts = ujianData.attempts.length > 0 ? true : false;

    // Jika tidak ada attempts dan waktu sudah melewati valid_upto, nonaktifkan jawaban
    const isReadonly = !isAttempts && tanggalUjian < now ? "disabled" : "";

    // Cek jika ujian sedang berlangsung, sembunyikan tabel Nilai
    if (tanggalUjian > now && !isAttempts) {
        $("#result").closest("tr").hide(); // Sembunyikan baris tabel Nilai jika ujian sedang berlangsung
    }

    const waktuMulai = formatDate(ujianData.valid_from);
    const waktuSelesai = formatDate(ujianData.valid_upto);

    $("#nama_ujian").text(": " + ujianData.name);
    $("#waktu_mulai").text(`: ${waktuMulai}`);
    $("#waktu_selesai").text(`: ${waktuSelesai}`);
    $("#topik").text(": " + ujianData.topics[0].name);

    const $questionContainer = $("#quizForm");
    ujianData.questions.forEach((data, index) => {
        const soalElement = $(`
            <div class="question-container">
                <p>${index + 1}. ${data.question.name}</p>
                <div class="answer"></div>
            </div>
        `);

        const $answerContainer = soalElement.find(".answer");
        data.question.options.forEach((element) => {
            const optionElement = $(`
                <div>
                    <input type="radio" name="${data.id}" value="${element.id}" ${isReadonly}>
                    ${element.name}
                </div>
            `);
            $answerContainer.append(optionElement);
        });
        $questionContainer.append(soalElement);
    });

    var result = 0;
    var score = 0;

    if (isAttempts) {
        let jawabanUjian = await axios.get(
            base_url + `/app/ujian/render-jawaban/${ujianData.attempts[0].id}`,
        );
        jawabanUjian = jawabanUjian.data.data;
        const jumlahKunci = Object.keys(jawabanUjian).length;
        for (let key in jawabanUjian) {
            const valueToSelect = `${jawabanUjian[key].user_answer}`;
            const correctAnswer = `${jawabanUjian[key].correct_answer}`;
            const radio = $(`input[type="radio"][name="${key}"]`).filter(
                function () {
                    return $(this).parent().text().trim() === valueToSelect;
                },
            );
            if (radio.length > 0) {
                radio.prop("checked", true);
            }
            const questionContainer = $(
                `input[type="radio"][name="${key}"]`,
            ).closest(".question-container");
            if (valueToSelect === correctAnswer) {
                questionContainer.append(
                    `<p class="text-success">Jawaban Benar</p>`,
                );
                score++;
            } else {
                questionContainer.append(
                    `<p class="text-danger">Jawaban Salah. Jawaban yang benar adalah : <strong>${correctAnswer}</strong></p>`,
                );
            }
        }
        result = (score / jumlahKunci) * 100;
        if (result % 1 === 0) {
            // Jika result adalah bilangan bulat, tampilkan tanpa desimal
            $("#result").text(": " + result.toFixed(0)); // .toFixed(0) untuk membulatkan ke bilangan bulat
        } else {
            // Jika result adalah desimal, tampilkan dengan 2 angka desimal
            $("#result").text(": " + result.toFixed(2)); // .toFixed(2) untuk 2 angka desimal
        }
    } else if (tanggalUjian < now) {
        // Jika waktu sudah lewat dan tidak ada attempts, tampilkan halaman detail dengan radio dinonaktifkan
        result = 0;
        $("#result").text(": " + result + " ( Tidak Mengerjakan )");
        $("#quizForm").append(
            `<p class="text-danger">Waktu ujian telah selesai. Anda tidak bisa mengisi jawaban lagi.</p>`,
        );
    } else {
        // Untuk ujian yang belum selesai
        await radioSelect();
        startTimer(tanggalUjian);
        $questionContainer.append(
            `<button type="button" onclick="submitJawaban()" class="btn btn-primary my-3">Submit</button>`,
        );
    }
}

async function radioSelect() {
    $(".answer div").click(function () {
        const radio = $(this).find('input[type="radio"]');
        if (radio.length) {
            radio.prop("checked", true); // Menandai radio button
        }
    });
}

function startTimer(tanggalUjian) {
    const interval = setInterval(() => {
        const now = new Date();
        if (now >= tanggalUjian) {
            clearInterval(interval);
            // Submit otomatis saat waktu habis
            submitJawaban(true); // True untuk menandai submit otomatis
        }
    }, 1000); // Periksa setiap detik
}

function checkJawaban(jawaban) {
    const isAnyAnswerUndefined = jawaban.some(
        (item) => item.id_jawaban === undefined,
    );

    if (isAnyAnswerUndefined) {
        Swal.fire({
            icon: "error",
            title: "Semua soal harus dijawab terlebih dahulu!",
        });
        return false;
    }

    return true; // Jika semua soal terisi, kembalikan true
}

async function submitJawaban(isAutoSubmit = false) {
    let ujianData = await axios.get(base_url + `/app/ujian/show/${id_ujian}`);
    ujianData = ujianData.data.data;
    const tanggalUjian = new Date(ujianData.valid_upto.replace(" ", "T"));
    const now = new Date();

    let reqData = {
        id_quiz: ujianData.id,
        jawaban: [],
    };

    // Ambil semua jawaban dari form
    ujianData.questions.forEach((data) => {
        let jawab = {
            id_pertanyaan: data.id,
            id_jawaban: $(`input[name="${data.id}"]:checked`).val(),
        };
        reqData.jawaban.push(jawab);
    });

    if (tanggalUjian > now) {
        // Waktu belum habis, periksa jawaban kosong
        if (!checkJawaban(reqData.jawaban)) {
            return; // Jika ada jawaban kosong, hentikan pengiriman
        }
    } else {
        // Waktu sudah habis, isi jawaban kosong dengan nilai 0
        reqData.jawaban.forEach((item) => {
            if (item.id_jawaban === undefined) {
                item.id_jawaban = 0;
            }
        });

        if (isAutoSubmit) {
            Swal.fire({
                icon: "info",
                title: "Waktu ujian habis. Jawaban tersubmit otomatis.",
            }).then(() => {
                // Callback setelah alert ditutup
                window.location.href = app_url + "/list-ujian-siswa";
            });
        }
    }
    try {
        // Kirim jawaban ke server
        const response_form = await axios.post(
            app_url + "/ujian/input-jawaban",
            reqData,
        );
        window.location.href = app_url + "/list-ujian-siswa";
    } catch (error) {
        console.log(error);
    }
}
