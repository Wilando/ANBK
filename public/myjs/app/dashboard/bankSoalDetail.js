const pathParts = window.location.pathname.split('/');
const id = pathParts[pathParts.length - 1];  

document.addEventListener("DOMContentLoaded", async function () {
    await initLoad();
});

async function initLoad() {
    await populateSoal();
}

async function populateSoal() {
    let soal = await axios.get(base_url + `/app/misi-pemda/bank-soal-detail/${id}`);
    soal = soal.data;
    console.log(soal);
    $("#judul-topic").text(soal.name);
    
    soal.questions.forEach((element,index) => {
        let options = "";
        element.options.forEach(pilihan => {
            options += `<div class="${pilihan.is_correct ? "bg-success" : ""}">${pilihan.name}</div>`
        });

        $("#soal-container").append(`
            <div class="question-container">
                <p>${index + 1}. ${element.name}</p>
                <div class="answer">
                    ${options}
                </div>
            </div>
        `)
    });
}
