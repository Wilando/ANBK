

document.addEventListener('DOMContentLoaded', async function () {
    await initLoad();
});

async function initLoad() {
    await resetFilter();
}


async function resetFilter() {

    currentPage = 1;
    rowsPerPage = 25;
    sort = 'id';
    order = 'DESC';
    search = null;
    column_search = 'nama';


    const parameter = {
        params: {
            page: currentPage,
            per_page: rowsPerPage,
            sort: sort,
            order: order,
            search: search,
            column_search: column_search,
        }
    }
    await fetchData(parameter);


}

async function parameter_with_fetch_now() {
    const parameter = {
        params: {
            page: currentPage,
            per_page: rowsPerPage,
            sort: sort,
            order: order,
            search: search,
            column_search: column_search,
        }
    }
    await fetchData(parameter);
}

async function handleFiltered() {
    currentPage = 1;
    rowsPerPage = _per_page.value;
    if (_per_page.value == '') {
        rowsPerPage = totalRows;
    }

    await parameter_with_fetch_now();
}

const shimmerPlaceholder = document.getElementById('shimmerPlaceholder');
const divList = document.getElementById('divList');


async function fetchData(parameter) {
    shimmerPlaceholder.style.display = 'block';
    const response = await axios.get(app_url + '/my-render-activity-data', parameter);
    try {
        divList.innerHTML = response.data;
        shimmerPlaceholder.style.display = 'none';
    } catch
    (error) {
        console.error(error);
    }

}

document.addEventListener('click', async function (event) {
    if (event.target.matches('.pagination a')) {
        event.preventDefault();
        var page = event.target.getAttribute('href').split('page=')[1];
        currentPage = page;
        await parameter_with_fetch_now();
    }
});





