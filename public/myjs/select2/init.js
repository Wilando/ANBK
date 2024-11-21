async function initSelect2() {
    $(".select2").select2({
        theme: 'bootstrap-5'
    });
}


async function remoteList(link, selector, placeholder) {
    $(selector).select2({
        placeholder: placeholder,
        allowClear: true,
        theme: 'bootstrap-5',

        ajax: {
            url: link,
            type: "get",
            dataType: 'json',
            delay: 250,
            data: function (params) {
                return {
                    search: params.term,
                };
            },
            processResults: function (data) {
                return {
                    results: $.map(data, function (item) {
                        return {
                            text: item.text,
                            id: item.id
                        }
                    })
                };
            },
            cache: true
        },
        templateResult: formatRepoDefault,
        templateSelection: formatRepoSelectionDefault

    });
}
async function remoteListmodal(link, selector, placeholder, dropdownelement) {
    $(selector).select2({
        placeholder: placeholder,
        allowClear: true,
        theme: 'bootstrap-5',

        ajax: {
            url: link,
            type: "get",
            dataType: 'json',
            delay: 250,
            data: function (params) {
                return {
                    search: params.term,
                };
            },
            processResults: function (data) {
                return {
                    results: $.map(data, function (item) {
                        return {
                            text: item.text,
                            id: item.id
                        }
                    })
                };
            },
            cache: true
        },
        dropdownParent: dropdownelement,
        templateResult: formatRepoDefault,
        templateSelection: formatRepoSelectionDefault

    });
}
async function remoteListParameter(link, selector, placeholder, valueparameter, add = false) {
    $(selector).select2({
        placeholder: placeholder,
        allowClear: true,
        theme: 'bootstrap-5',
        tags: add,
        selectOnBlur: add,
        // dropdownAutoWidth : true,
        width: 'auto', // Enable auto width for Select2

        ajax: {
            url: link,
            type: "get",
            dataType: 'json',
            delay: 250,
            data: function (params) {
                return {
                    search: params.term,
                    parameter: valueparameter,
                };
            },
            processResults: function (data) {
                return {
                    results: $.map(data, function (item) {
                        return {
                            text: item.text,
                            id: item.id
                        }
                    })
                };
            },
            cache: true
        },

        templateResult: formatRepoDefault,
        templateSelection: formatRepoSelectionDefault

    });
}

async function remoteListModalParameter(link, selector, placeholder, withParameter, dropdownelement) {
    $(selector).select2({
        placeholder: placeholder,
        allowClear: true,
        theme: 'bootstrap-5',

        ajax: {
            url: link,
            type: "get",
            dataType: 'json',
            delay: 250,
            data: function (params) {
                return {
                    search: params.term,
                    parameter: withParameter,
                };
            },
            processResults: function (data) {
                return {
                    results: $.map(data, function (item) {
                        return {
                            text: item.text,
                            id: item.id
                        }
                    })
                };
            },
            cache: true
        },
        dropdownParent: dropdownelement,
        templateResult: formatRepoDefault,
        templateSelection: formatRepoSelectionDefault

    });
}



function formatRepoDefault(repo) {
    return repo.text;
}

function formatRepoSelectionDefault(repo) {
    return repo.text;
}
