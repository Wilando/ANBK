const form_submit = document.getElementById('formSubmit');
const input_current_password = document.getElementById('current_password');
const input_new_password = document.getElementById('new_password');
const input_new_password_confirmation = document.getElementById('new_password_confirmation');
const feedback_current_password = document.getElementById('feedback_error_current_password');
const feedback_new_password = document.getElementById('feedback_error_new_password');
const feedback_new_password_confirmation = document.getElementById('feedback_error_new_password_confirmation');


function resetForm() {
    // resetAlert();
    document.querySelectorAll('.form-control').forEach(function (el) {
        el.classList.remove('is-invalid');
    });
    document.querySelectorAll('.invalid-feedback').forEach(function (el) {
        el.innerHTML = '';
    });
    form_submit.reset();
    input_current_password.focus();
}


async function submitForm(event) {
    event.preventDefault();
    resetAlert();
    processSubmit();
    const dataSent = {
        current_password: input_current_password.value,
        new_password: input_new_password.value,
        new_password_confirmation: input_new_password_confirmation.value,
    };
    try {
        let response_form;

        var newData = {
            _method: 'put'
        };
        var requestData = Object.assign({}, dataSent, newData);
        response_form = await axios.post(app_url + '/update-password', requestData);


        if (response_form.data.success == true) {
            swShow('success', 'success', response_form.data.message);
            displayAlert('success', 'Success', response_form.data.message);
            resetForm();
            // loadingPage.classList.remove('d-none');
            // contentPage.classList.add('d-none');
        } else {
            if (response_form.data.error) {
                displayAlert('danger', 'Error', response_form.data.message);
            }
        }

    } catch
        (error) {
        // console.log(error);
        if(error)
        {
            // console.log(error);
            if(error.message)
            {
                displayAlert('danger', 'Error', error.message)
            }
            const error_response_data = error.response.data;
            if (error_response_data) {
                const error_message = error_response_data.message;
                const error_field = error_response_data.errors;
                if (error_message) {
                    displayAlert('danger', 'Error', error_message)
                }

                if (error_field) {
                    const error_current_password = error_field.current_password;
                    const error_new_password = error_field.new_password;
                    const error_new_password_confirmation = error_field.new_password_confirmation;
                    document.querySelectorAll('.is-invalid').forEach(function (el) {
                        el.innerHTML = '';
                    });
                    document.querySelectorAll('.invalid-feedback').forEach(function (el) {
                        el.innerHTML = '';
                    });
                    if (error_current_password) {
                        input_current_password.parentElement.querySelector('.form-control').classList.add('is-invalid');
                        feedback_current_password.innerHTML = error_current_password;
                    }
                    if (error_new_password) {
                        input_new_password.parentElement.querySelector('.form-control').classList.add('is-invalid');
                        feedback_new_password.innerHTML = error_new_password;
                    }
                    if (error_new_password_confirmation) {
                        input_new_password_confirmation.parentElement.querySelector('.form-control').classList.add('is-invalid');
                        feedback_new_password_confirmation.innerHTML = error_new_password_confirmation;

                    }
                }

            }
        }


    }
    enabledSubmit();
}


input_current_password.addEventListener('input', function () {
    feedback_current_password.innerHTML = '';
    input_current_password.parentElement.querySelector('.form-control').classList.remove('is-invalid');
    resetAlert();
});

input_new_password.addEventListener('input', function () {
    feedback_new_password.innerHTML = '';
    input_new_password.parentElement.querySelector('.form-control').classList.remove('is-invalid');
    resetAlert();
});

input_new_password_confirmation.addEventListener('input', function () {
    feedback_new_password_confirmation.innerHTML = '';
    input_new_password_confirmation.parentElement.querySelector('.form-control').classList.remove('is-invalid');
    resetAlert();
});
document.getElementById('formSubmit').addEventListener('submit', submitForm);




