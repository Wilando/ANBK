document.addEventListener('DOMContentLoaded', function () {

    initLoad();

});
var selectRole;
var control;
function initLoad() {

    initRole();
    fetchRole();

}



function initRole() {
    selectRole = new TomSelect('#select_role', {
        plugins: ['dropdown_input','clear_button'],
        valueField: 'id',
        labelField: 'name',
        searchField: 'name',
        options: [],
        create: false
    });
}

async function fetchRole() {
    const parameter = {
        params: {
            page: 1,
            per_page: 100,
            sort: 'name',
            order: 'asc',
            search: null,
            column_search: 'name',
        }
    }

    axios.get(app_url + '/role/select-data', parameter)
        .then(response => {
            // selectRole.clearOptions();
            // selectRole.clear();
            const datarole = response.data.data.data;
            selectRole.addOption(datarole);

        })
        .catch(error => {
            console.error('Error :', error);
        });
}




