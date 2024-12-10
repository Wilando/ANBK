// function validateAndCalculate(event) {
//     var questions = document.querySelectorAll('.question');

//     for (var i = 0; i < questions.length; i++) {
//         if (!questions[i].querySelector('input[type="radio"]:checked')) {
//             alert('Semua soal harus dijawab terlebih dahulu!');
//             event.preventDefault();
//             return false;
//         }
//     }

//     let correctAnswers = {
//         question1: 'a',
//         question2: 'a',
//         question3: 'b'
//     };

//     let score = 0;
//     let formData = new FormData(event.target);

//     formData.forEach((value, key) => {
//         if (correctAnswers[key] === value) {
//             score++;
//         }
//     });

//     alert('Anda mendapatkan nilai ' + score + ' dari ' + Object.keys(correctAnswers).length + ' soal.');

//     event.preventDefault(); // Menghentikan submit (untuk demo)
//     return false;
// }

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

function validateAndCalculate(event) {
    var questions = document.querySelectorAll(".question");
    for (var i = 0; i < questions.length; i++) {
        if (!questions[i].querySelector('input[type="radio"]:checked')) {
            alert("Semua soal harus dijawab terlebih dahulu!");
            event.preventDefault();
            return false;
        }
    }
    var correctAnswers = {
        question1: "a", // Jakarta
        question2: "a", // Jakarta
        question3: "b", // Jakarta
    };
    var userAnswers = {};
    var score = 0;
    var resultHTML = "<h4>Hasil Ujian:</h4><ul>";

    // Ambil jawaban dari form
    var formData = new FormData(event.target);
    formData.forEach((value, key) => {
        userAnswers[key] = value;
    });

    // Periksa jawaban
    for (var i = 0; i < questions.length; i++) {
        var questionId = "question" + (i + 1);
        var userAnswer = userAnswers[questionId];

        // Cek jika jawaban benar
        if (userAnswer === correctAnswers[questionId]) {
            score++;
            resultHTML += `<li>Soal ${i + 1}: Benar</li>`;
        } else {
            resultHTML += `<li>Soal ${i + 1}: Salah, Jawaban yang benar: ${getAnswerLabel(correctAnswers[questionId], questionId)}</li>`;
        }
    }

    resultHTML += `</ul><h5>Anda mendapatkan nilai ${score} dari ${Object.keys(correctAnswers).length} soal.</h5>`;

    // Tampilkan hasil di bawah form
    document.getElementById("result").innerHTML = resultHTML;

    event.preventDefault(); // Menghentikan submit (untuk demo)
    return false;
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

    const isReadonly = isAttempts ? "disabled" : "";
    if (!isAttempts) {
        $("#result").closest("tr").hide();
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
        $("#result").text(": " + result.toFixed(2));
    } else if (tanggalUjian < now) {
        result = 0;
    } else {
        await radioSelect();
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

async function submitJawaban() {
    let ujianData = await axios.get(base_url + `/app/ujian/show/${id_ujian}`);
    ujianData = ujianData.data.data;

    let reqData = {
        id_quiz: null,
        jawaban: [],
    };

    ujianData.questions.forEach((data, index) => {
        reqData.id_quiz = ujianData.id;

        let jawab = {
            id_pertanyaan: data.id,
            id_jawaban: $(`input[name="${data.id}"]:checked`).val(),
        };
        reqData.jawaban.push(jawab);
    });

    if (!checkJawaban(reqData.jawaban)) {
        return;
    }

    try {
        response_form = await axios.post(
            app_url + "/ujian/input-jawaban",
            reqData,
        );
        window.location.href = app_url + "/list-ujian-siswa";
    } catch (error) {
        console.log(error);
    }
}
