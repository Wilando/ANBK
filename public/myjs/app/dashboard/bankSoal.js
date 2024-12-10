

document.addEventListener("DOMContentLoaded", async function () {
    await initLoad();
});

async function initLoad() {
    await populateTopic();
}

async function populateTopic() {
    let topics = await axios.get(base_url + `/app/misi-pemda/list-topic`);
    topics = topics.data;
    console.log(topics);
    topics.forEach(element => {
        $("#topic-container").append(`
        <div class="option-box">
            <a href="/app/bank-soal/${element.id}" class="option-main" >
            <i class="fas fa-book-reader"></i>
            <p>${element.name}</p>
            </a>
        </div>
        `)
    });
}
