window.onload = async function () {
    alert_container.style.display = 'none';
};
const linkLogin = document.getElementById('linkLogin');
const input_token = document.getElementById('token');
const feedback_token = document.getElementById('feedback_error_token');
const input_email = document.getElementById('email');
const feedback_email = document.getElementById('feedback_error_email');
const input_password = document.getElementById('password');
const feedback_password = document.getElementById('feedback_error_password');
const input_password_confirmation = document.getElementById('password_confirmation');
const feedback_password_confirmation = document.getElementById('feedback_error_password_confirmation');

async function submitReset(event) {
    event.preventDefault();
    processSubmit();
    resetAlert();
    const dataSent = {
        token: input_token.value,
        email: input_email.value,
        password: input_password.value,
        password_confirmation: input_password_confirmation.value,
    };
    try {
        const response_form = await axios.post(api_url + '/reset-password', dataSent);

        if (response_form.data.error) {
            displayAlert('danger', 'Error', response_form.data.error);
            enabledSubmit();
        }
        if (response_form.data.success == true) {
            displayAlert('success', 'Sukses', response_form.data.message);
            input_token.disabled = true;
            input_email.disabled = true;
            input_password.disabled = true;
            input_password_confirmation.disabled = true;
            linkLogin.classList.remove('d-none');
            disabledSubmit();
        }


    } catch
        (error) {
        // console.error('Error:', error.response.data);
        const error_response_data = error.response.data;
        const error_message = error_response_data.message;
        if (error_message) {
            displayAlert('danger', 'Error', error_message)
        }
        const error_field = error_response_data.errors;
        if (error_field) {
            const error_email = error_field.email;
            const error_token = error_field.token;
            const error_password = error_field.password;
            const error_password_confirmation = error_field.password_confirmation;

            // Reset pesan error sebelum validasi
            input_email.classList.remove('is-invalid');
            input_token.classList.remove('is-invalid');
            input_password.classList.remove('is-invalid');
            input_password_confirmation.classList.remove('is-invalid');
            document.querySelectorAll('.invalid-feedback').forEach(function (el) {
                el.innerHTML = '';
            });

            if (error_email) {
                input_email.parentElement.querySelector('.form-control').classList.add('is-invalid');
                feedback_email.innerHTML = error_email.toString();
            }
            if (error_token) {
                input_token.parentElement.querySelector('.form-control').classList.add('is-invalid');
                feedback_token.innerHTML = error_token.toString();
            }
            if (error_password) {
                input_password.parentElement.querySelector('.form-control').classList.add('is-invalid');
                feedback_password.innerHTML = error_password.toString();
            }
            if (error_password_confirmation) {
                input_password_confirmation.parentElement.querySelector('.form-control').classList.add('is-invalid');
                feedback_password_confirmation.innerHTML = error_password_confirmation.toString();
            }

        }


    }
    enabledSubmit();
}


input_email.addEventListener('input', function () {
    feedback_email.innerHTML = '';
    input_email.parentElement.querySelector('.form-control').classList.remove('is-invalid');
});

input_token.addEventListener('input', function () {
    feedback_token.innerHTML = '';
    input_token.parentElement.querySelector('.form-control').classList.remove('is-invalid');
});

input_password.addEventListener('input', function () {
    feedback_password.innerHTML = '';
    input_password.parentElement.querySelector('.form-control').classList.remove('is-invalid');
});

input_password_confirmation.addEventListener('input', function () {
    feedback_password_confirmation.innerHTML = '';
    input_password_confirmation.parentElement.querySelector('.form-control').classList.remove('is-invalid');
});

document.getElementById('formReset').addEventListener('submit', submitReset);
