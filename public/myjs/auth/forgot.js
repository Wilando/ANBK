window.onload = async function () {
    alert_container.style.display = 'none';
};

const input_email = document.getElementById('email');
const feedback_email = document.getElementById('feedback_error_email');

async function submitForgot(event) {
    event.preventDefault();
    resetAlert();
    processSubmit();
    const dataSent = {
        email: input_email.value,
    };


    try {

        const response_form = await axios.post(api_url + '/forgot-password', dataSent,
            // {
            //     headers: {
            //         'X-CSRF-TOKEN': window.csrf
            //     }
            // }
        );
        // console.log(response_form);
        if (response_form.data.error) {
            displayAlert('danger', 'Error', response_form.data.error);
        }
        if (response_form.data.success == true) {
            displayAlert('success', 'Sukses', response_form.data.message);
        }
        enabledSubmit();

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
            input_email.classList.remove('is-invalid');
            document.querySelectorAll('.invalid-feedback').forEach(function (el) {
                el.innerHTML = '';
            });
            if (error_email) {
                input_email.parentElement.querySelector('.form-control').classList.add('is-invalid');
                feedback_email.innerHTML = error_email;
            }
        }

        enabledSubmit();
    }
}


input_email.addEventListener('input', function () {
    feedback_email.innerHTML = '';
    input_email.parentElement.querySelector('.form-control').classList.remove('is-invalid');
});

document.getElementById('formForgot').addEventListener('submit', submitForgot);
