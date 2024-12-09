let eventSource;
let dataSekarang = [];

document.addEventListener("DOMContentLoaded", async function () {
    await initLoad();
});

async function initLoad() {
    startSSE(base_url + "/app/ujian/list-ujian-siswa/sekarang");
    await filterUjian();
}

function areArraysIdentical(arr1, arr2) {
    return arr1 === arr2;
}

// Fungsi untuk memulai koneksi SSE
function startSSE(url) {
    if (eventSource) {
        eventSource.close();
        console.log("SSE connection closed.");
    }

    // Membuat koneksi baru
    eventSource = new EventSource(url);

    // Event saat menerima data
    eventSource.onmessage = function (event) {
        let jsonObj = JSON.parse(event.data);
        
        if (!areArraysIdentical(dataSekarang, jsonObj)) {
            dataSekarang = jsonObj;
            $("#ujian-cards").empty();
            jsonObj.forEach((ujian) => {
                let status = getUjianStatus(ujian.valid_upto);
                let sudah_dikerjakan = ujian.attempts.length > 0 ? true : false;
                let buttonHtml =
                    status === "sekarang"
                        ? 
                        `<a href="/app/ujian-siswa/${ujian.id}" class="btn ${sudah_dikerjakan ? "btn-success" : "btn-primary"} waves-effect waves-light btn-kerjakan">
                            ${sudah_dikerjakan ? "Sudah Dikerjakan" : "Kerjakan"}
                        </a>`
                        : `<a href="/app/ujian-siswa/${ujian.id}" class="btn btn-secondary waves-effect waves-light btn-detail">Detail</a>`;
                $("#ujian-cards").append(`
                    <div class="col-md-4 card-item">
                        <div class="card">
                            <div class="card-body d-flex flex-column text-center">
                                <h4 class="card-title">
                                ${ujian.name}
                                </h4>
                                <p class="card-text">${ujian.topics[0].name}</p>
                            </div>
                            <ul class="list-group list-group-flush text-center">
                            <li class="list-group-item">Mulai : ${ujian.valid_from}</li>
                            <li class="list-group-item">Selesai : ${ujian.valid_upto}</li>
                            </ul>
                            <div class="card-body d-flex flex-column justify-content-center align-items-center">
                                ${buttonHtml}
                            </div>
                        </div>
                    </div>
                `);
            });
        } else {
            console.log(areArraysIdentical(dataSekarang, jsonObj));
        }
    };

    // Event jika terjadi error
    eventSource.onerror = function (error) {
        console.error("SSE error:", error);
    };

    console.log(`SSE connected to ${url}`);
}

function getUjianStatus(validUpto) {
    let today = new Date().toISOString().split("T")[0]; // Format YYYY-MM-DD
    let validUptoDate = new Date(validUpto);
    let todayDate = new Date(today);

    // Mengembalikan 'sekarang' jika ujian masih dalam rentang waktu, 'lewat' jika sudah selesai
    if (todayDate <= validUptoDate) {
        return "sekarang"; // Ujian masih aktif
    } else {
        return "lewat"; // Ujian sudah lewat
    }
}

async function filterUjian() {
    $("#statusFilter").on("change", function () {
        const selectedValue = $(this).val();
        startSSE(base_url + "/app/ujian/list-ujian-siswa/" + selectedValue);
    });
}
