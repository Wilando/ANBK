const alert_container = document.getElementById('showAlertContainer');
const alert_session = document.getElementById('alertSession');
const my_alert = document.getElementById('myAlert');
const alert_title = document.getElementById('alert_title');
const alert_text = document.getElementById('alert_text');

function resetAlert() {
    if (alert_container) {
        alert_container.style.display = 'none';
        alert_container.parentElement.querySelector('.alert').classList.remove('alert-danger');
        alert_container.parentElement.querySelector('.alert').classList.remove('alert-success');


        my_alert.classList.remove('show');
        alert_title.innerHTML = '';
        alert_text.innerHTML = '';
    }


    if (alert_session) {
        alert_session.style.display = 'none';
        alert_session.parentElement.querySelector('.alert').classList.remove('alert-danger');
        alert_session.parentElement.querySelector('.alert').classList.remove('alert-success');
    }
}

function resetAlertId(alertId = 'showAlertContainer') {
    const alert_container = document.getElementById(alertId);
    if (alert_container) {
        alert_container.innerHTML = '';
        alert_container.style.display = 'none';
    }
}

function resetAlertspesific(color) {
    alert_container.style.display = 'none';
    alert_container.classList.remove('alert-' + color);
    my_alert.classList.remove('show');
    alert_title.innerHTML = '';
    alert_text.innerHTML = '';
}

function displayAlert(color, title, message) {

    alert_container.style.display = 'block';
    my_alert.classList.add('show');
    alert_container.parentElement.querySelector('.alert').classList.add('alert-' + color);
    alert_title.innerHTML = title;
    alert_text.innerHTML = message;

    window.scrollTo(0, 0);
}

function displayAlertId(color, title, message, alertId = 'showAlertContainer') {
    const alert_container = document.getElementById(alertId);
    if (alert_container) {
        const alertnya = document.createElement('div');
        alertnya.className = 'alert alert-' + color + ' alert-dismissible fade show'

        const titlealert = document.createElement('strong');
        titlealert.className = 'me-2';
        titlealert.textContent = title;
        const messagealert = document.createElement('span');
        messagealert.textContent = message;
        const btndismiss = document.createElement('button');
        btndismiss.type = 'button';
        btndismiss.className = 'btn-close';
        btndismiss.setAttribute('data-bs-dismiss', "alert");
        btndismiss.setAttribute('aria-label', "Close");

        alertnya.appendChild(titlealert);
        alertnya.appendChild(messagealert);
        alertnya.appendChild(btndismiss);


        alert_container.appendChild(alertnya);
        alert_container.style.display = 'block';
        window.scrollTo(0, 0);
    }
}

const xinputs = document.querySelectorAll('input');
xinputs.forEach(input => {
    input.addEventListener('input', () => {
        input.classList.remove('is-invalid');
        input.querySelectorAll('.invalid-feedback').innerText = '';


    });
});

const xselects = document.querySelectorAll('select');
xselects.forEach(select => {
    select.addEventListener('change', () => {
        select.classList.remove('is-invalid');
        select.querySelectorAll('.invalid-feedback').innerText = '';
    });
});


const xtextareas = document.querySelectorAll('textarea');
xtextareas.forEach(textarea => {
    textarea.addEventListener('input', () => {
        textarea.classList.remove('is-invalid');
        textarea.querySelectorAll('.invalid-feedback').innerText = '';


    });
});


function date_time_indo(dateTime) {
    if (dateTime) {
        const dateObj = new Date(dateTime);
        const formattedDate = dateObj.toLocaleDateString('id-ID', {
            day: '2-digit',
            month: '2-digit',
            year: 'numeric'
        });


        const formattedTime = dateObj.toLocaleTimeString('id-ID', {
            hour: '2-digit',
            minute: '2-digit',
            second: '2-digit',
            hour12: false,
            hourCycle: 'h23',
            separator: ' - '
        });

        return formattedDate + ' ' + formattedTime;
    }
    return '';

}

function date_indo(dateTime) {
    const dateObj = new Date(dateTime);
    return dateObj.toLocaleDateString('id-ID', {
        day: '2-digit',
        month: '2-digit',
        year: 'numeric'
    });
}


function getTimeAgo(datetime) {
    var currentDate = new Date();
    var pastDate = new Date(datetime);
    var timeDifference = currentDate.getTime() - pastDate.getTime();
    var seconds = Math.floor(timeDifference / 1000);


    var interval = Math.floor(seconds / 31536000);
    if (interval > 0) {
        return interval + " tahun yang lalu";
    }
    interval = Math.floor(seconds / 2592000);
    if (interval > 0) {
        return interval + " bulan yang lalu";
    }
    interval = Math.floor(seconds / 86400);
    if (interval > 0) {
        return interval + " hari yang lalu";
    }
    interval = Math.floor(seconds / 3600);
    if (interval > 0) {
        return interval + " jam yang lalu";
    }
    interval = Math.floor(seconds / 60);
    if (interval > 0) {
        return interval + " menit yang lalu";
    }
    return Math.floor(seconds) + " detik yang lalu";
}


function dateNow() {
    var tanggalSekarang = new Date();
    var tanggal = tanggalSekarang.getDate();
    var bulan = tanggalSekarang.getMonth() + 1;
    var tahun = tanggalSekarang.getFullYear();
    return tahun + '-' + (bulan < 10 ? '0' : '') + bulan + '-' + (tanggal < 10 ? '0' : '') + tanggal;

}


function rangePicker(fDate, tDate) {
    var fDateInput = document.getElementById(fDate);
    var tDateInput = document.getElementById(tDate);
    var fDateValue = fDateInput.value;
    tDateInput.setAttribute("min", fDateValue);
}


function getCurrentDateTime() {
    var currentDate = new Date();
    var day = currentDate.getDate();
    var month = currentDate.getMonth() + 1;
    var year = currentDate.getFullYear();
    var hours = currentDate.getHours();
    var minutes = currentDate.getMinutes();
    var seconds = currentDate.getSeconds();


    day = (day < 10) ? '0' + day : day;
    month = (month < 10) ? '0' + month : month;
    hours = (hours < 10) ? '0' + hours : hours;
    minutes = (minutes < 10) ? '0' + minutes : minutes;
    seconds = (seconds < 10) ? '0' + seconds : seconds;

    return year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;
}

function getFirstofmonth(bulan) {
    var today = new Date();
    var firstDayOfMonth = new Date(today.getFullYear(), bulan ?? today.getMonth(), 1);
    var day = firstDayOfMonth.getDate();
    var month = firstDayOfMonth.getMonth() + 1;
    var year = firstDayOfMonth.getFullYear();
    var hours = firstDayOfMonth.getHours();
    var minutes = firstDayOfMonth.getMinutes();
    var seconds = firstDayOfMonth.getSeconds();


    day = (day < 10) ? '0' + day : day;
    month = (month < 10) ? '0' + month : month;
    hours = (hours < 10) ? '0' + hours : hours;
    minutes = (minutes < 10) ? '0' + minutes : minutes;
    seconds = (seconds < 10) ? '0' + seconds : seconds;

    return year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;
}

function getLastofmonth(bulan) {
    var today = new Date();
    var lastDayOfMonth = new Date(today.getFullYear(), bulan ?? today.getMonth() + 1, 0);
    var day = lastDayOfMonth.getDate();
    var month = lastDayOfMonth.getMonth() + 1;
    var year = lastDayOfMonth.getFullYear();
    var hours = 23;
    var minutes = 59;
    var seconds = 59;


    day = (day < 10) ? '0' + day : day;
    month = (month < 10) ? '0' + month : month;
    hours = (hours < 10) ? '0' + hours : hours;
    minutes = (minutes < 10) ? '0' + minutes : minutes;
    seconds = (seconds < 10) ? '0' + seconds : seconds;

    return year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;
}


function getFirstEndofMonth() {

    var today = new Date();


    var firstDayOfMonth = new Date(today.getFullYear(), today.getMonth(), 1);

    var lastDayOfMonth = new Date(today.getFullYear(), today.getMonth() + 1, 0);


    var startTime = firstDayOfMonth.getFullYear() + '-' + firstDayOfMonth.getMonth() + '-' + firstDayOfMonth.getDate() + ' 00:00:00';

    var endTime = lastDayOfMonth.getFullYear() + '-' + lastDayOfMonth.getMonth() + '-' + lastDayOfMonth.getDate() + ' ' + 23 + ':' + 59 + ':' + 59;


    return [startTime, endTime];
}


function limitString(string, maxLength) {
    if (string.length > maxLength) {
        return string.slice(0, maxLength) + '...';
    }
    return string;
}


function getFirstCharacters(fullName) {
    const nameArray = fullName.split(' ');
    // Extract the first character of each name
    const firstNameInitial = nameArray[0].charAt(0);
    const lastNameInitial = nameArray[nameArray.length - 1].charAt(0) ?? 'X';
    return firstNameInitial + lastNameInitial;
}


function removeTrailingZeros(number) {
    const numberString = number.toString();
    const trimmedNumberString = numberString.replace(/(\.\d*?[1-9])0+$/, '$1');
    return parseFloat(trimmedNumberString);
}


function changeBackgroundImage(fileInput, elementId) {

    // Check if a file is selected
    if (fileInput.files && fileInput.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            elementId.style.backgroundImage = "url('" + e.target.result + "')";
        };

        reader.readAsDataURL(fileInput.files[0]);
    }
}

function func_format_separator_input(angka, prefix = "") {

    if (angka == null) {
        return 0;
    }

    var number_string = angka.replace(/[^,\d]/g, "").toString(),
        split = number_string.split(","),
        sisa = split[0].length % 3,
        rupiah = split[0].substr(0, sisa),
        ribuan = split[0].substr(sisa).match(/\d{3}/gi);


    if (ribuan) {
        separator = sisa ? "." : "";
        rupiah += separator + ribuan.join(".");
    }

    return split[1] != undefined ? rupiah + "," + split[1] : rupiah;
}


function formatNumberWithCommas(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.');
}


var format_separator_input = document.querySelectorAll('.format_separator');
format_separator_input.forEach(function (input) {
    input.addEventListener('input', function (event) {
        const currentValue = event.target.value;
        event.target.value = func_format_separator_input(currentValue, "");
    });
});


async function render_format_separator_input() {
    var format_separator_input = document.querySelectorAll('.format_separator');
    format_separator_input.forEach(function (input) {
        input.addEventListener('input', function (event) {
            const currentValue = event.target.value;
            event.target.value = func_format_separator_input(currentValue, "");
        });
    });
}

function delete_character_non_numeric(input) {
    return input.replace(/[^0-9]/g, '');
}


const submitButton = document.getElementById('submitButton');
let submitHTML = null;
if (submitButton) {
    submitHTML = submitButton.innerHTML;
}
const disSubmit = '<i class="fa-solid fa-ban"></i> Disabled';
const loadingSubmit = '<i class="fa-solid fa-spinner fa-spin"></i> Loading...';

function disabledSubmit() {
    if (submitButton) {
        submitButton.disabled = true;
        submitButton.innerHTML = disSubmit;
    }

}

function processSubmit() {
    if (submitButton) {
        submitButton.disabled = true;
        submitButton.innerHTML = loadingSubmit;
    }
}

function enabledSubmit() {
    if (submitButton) {
        submitButton.disabled = false;
        submitButton.innerHTML = submitHTML;
    }
}


function disabledSubmitId(id = 'submitButton') {
    const btnid = document.getElementById(id);
    if (btnid) {
        btnid.disabled = true;
        btnid.innerHTML = disSubmit;
    }

}

function processSubmitId(id = 'submitButton') {
    const btnid = document.getElementById(id);
    if (btnid) {
        btnid.disabled = true;
        btnid.innerHTML = loadingSubmit;
    }
}

function enabledSubmitId(id = 'submitButton') {
    const btnid = document.getElementById(id);
    if (btnid) {
        const submitHtmlid = btnid.innerHTML;
        btnid.disabled = false;
        btnid.innerHTML = submitHtmlid;
    }
}


function swShow(icon, title, text) {
    Swal.fire(
        {
            toast: true,
            position: 'center',
            showConfirmButton: false,
            icon: icon,
            title: title,
            text: text,
            timer: 3000,
            timerProgressBar: true,
        }
    );
}

function swDialog(title, getFunction, param) {
    Swal.fire({
        title: title,
        icon: 'warning',
        showCancelButton: true,
        reverseButtons: true,
        confirmButtonText: 'Ya',
        cancelButtonText: 'Tidak',
    }).then((result) => {
        if (result.value) {
            callFunction(getFunction(param))
        } else if (result.dismiss == "cancel") {
            swShow('info', 'cancel', title)
        }
    });
}

function togglePasswordVisibility(id, classid) {
    var passwordInput = document.getElementById(id);
    var toggleButton = document.querySelector("." + classid);

    if (passwordInput.type == "password") {
        passwordInput.type = "text";
        toggleButton.innerHTML = '<i class="fas fa-eye-slash"></i>';
    } else {
        passwordInput.type = "password";
        toggleButton.innerHTML = '<i class="fas fa-eye"></i>';
    }
}

function isActivehtml(value, teks = 'Aktif', teksnon = 'Non Aktif') {
    if (value == 1) {
        return '<span class="badge bg-success">' + teks + '</span>';
    }
    return '<span class="badge bg-danger">' + teksnon + '</span>';
}

function isJawaban(value, teks = 'Ya', teksnon = 'Tidak') {
    if (value == 1) {
        return '<span class="badge bg-info">' + teks + '</span>';
    }
    return '<span class="badge bg-warning text-dark">' + teksnon + '</span>';
}

function isJawabanText(value, teks = 'Ya', teksnon = 'Tidak') {
    if (value == 1) {
        return '<span class="fw-medium font-monospace text-success">' + teks + '</span>';
    }
    return '<span class="fw-medium font-monospace text-danger">' + teksnon + '</span>';
}

function isStatusAduan(value) {
    if (value == "belum dibaca") {
        return '<span class="fw-bold font-monospace text-danger">' + value.toUpperCase();
        +'</span>';
    } else if (value == "telah dibaca") {
        return '<span class="fw-bold font-monospace text-warning">' + value.toUpperCase();
        +'</span>';
    } else if (value == "proses") {
        return '<span class="fw-bold font-monospace text-primary">' + value.toUpperCase();
        +'</span>';
    } else if (value == "selesai") {
        return '<span class="fw-bold font-monospace text-success">' + value.toUpperCase();
        +'</span>';
    }
    return '';
}

function isStatusPengajuan(value) {
    if (value == 'Diterima') {
        return '<span class="badge bg-success">DITERIMA</span>';
    } else if (value == 'Diproses') {
        return '<span class="badge bg-primary">DIPROSES</span>';
    } else if (value == 'Ditolak') {
        return '<span class="badge bg-danger">DITOLAK</span>';
    }
    return '<span class="badge bg-warning">MENUNGGU</span>';
}

function isPicturehtml(value, defclass = 'img-fluid rounded-circle', defstyle = 'max-height: 25px; max-width: 25px', alt = 'user_picture') {
    if (value) {
        return '<a data-fslightbox="gallery" href="' + value + '"><img class="' + defclass + '" style="' + defstyle + '" src="' + addThumbPrefix(value) + '" alt="' + alt + '"></a>';
    }
    return '-';


}

function isPicturenothumbhtml(value, defclass = 'img-fluid rounded-circle', defstyle = 'max-height: 25px; max-width: 25px', alt = 'user_picture') {
    if (value) {
        return '<a data-fslightbox="gallery" href="' + value + '"><img class="' + defclass + '" style="' + defstyle + '" src="' + (value) + '" alt="' + alt + '"></a>';
    }
    return '-';


}

function isYoutubehtml(url, value, defclass = 'img-fluid rounded-circle', defstyle = 'max-height: 25px; max-width: 25px', alt = 'user_picture') {
    if (value) {
        return '<a data-fslightbox="gallery" href="' + url + '"><img class="' + defclass + '" style="' + defstyle + '" src="' + value + '" alt="' + alt + '"></a>';
    }
    return '-';


}

function addThumbPrefix(filePath) {
    // Membagi path menjadi direktori dan nama file
    var lastIndex = filePath.lastIndexOf("/");
    var directory = filePath.substring(0, lastIndex);
    var filename = filePath.substring(lastIndex + 1);

    // Membagi direktori menjadi direktori induk dan nama folder terakhir
    lastIndex = directory.lastIndexOf("/");
    var parentDir = directory.substring(0, lastIndex);
    var folderName = directory.substring(lastIndex + 1);

    // Menambahkan awalan 'thumb_' ke nama file
    var newFilename = "thumb_" + filename;

    // Menggabungkan direktori induk, nama folder, dan nama file baru
    return parentDir + "/" + folderName + "/" + newFilename;
}


function filterAndSortArray(input, keysToKeep, sortKeys) {
    if (Array.isArray(input)) {
        return input.map(function (item) {
            var filteredItem = {};
            keysToKeep.forEach(function (key) {
                filteredItem[key] = item[key];
            });
            return filteredItem;
        }).sort(function (a, b) {
            return sortKeys.indexOf(Object.keys(a)[0]) - sortKeys.indexOf(Object.keys(b)[0]);
        });
    } else if (typeof input == 'object' && input != null) {

        var filteredItem = {};
        keysToKeep.forEach(function (key) {
            filteredItem[key] = input[key];
        });

        return [filteredItem];
    }
    return [];
}

function isButtonIcon(colorText, colorBG, icon, text)
{
    return '<div style="font-size:1rem;"><span class="badge text-'+colorText+'" style="background-color: '+colorBG+'">'+icon+' '+text+'</span></div>';
}
function getLuminance(hex) {
    hex = hex.replace('#', '');

    // Convert to RGB
    let r = parseInt(hex.substring(0, 2), 16) / 255;
    let g = parseInt(hex.substring(2, 4), 16) / 255;
    let b = parseInt(hex.substring(4, 6), 16) / 255;

    // Convert to luminance
    r = r <= 0.03928 ? r / 12.92 : Math.pow((r + 0.055) / 1.055, 2.4);
    g = g <= 0.03928 ? g / 12.92 : Math.pow((g + 0.055) / 1.055, 2.4);
    b = b <= 0.03928 ? b / 12.92 : Math.pow((b + 0.055) / 1.055, 2.4);

    return 0.2126 * r + 0.7152 * g + 0.0722 * b;
}

function adjustTextColorBasedOnBackground(bgColor) {

    // const hexColor = rgbToHex(bgColor);
    // const luminance = getLuminance(hexColor);
    const luminance = getLuminance(bgColor);

    const textColor = luminance > 0.5 ? '#000' : '#fff';
    return textColor;
}

function rgbToHex(rgb) {
    rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
    return "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);
}

function hex(x) {
    const hexDigits = '0123456789abcdef';
    return isNaN(x) ? '00' : hexDigits[(x - x % 16) / 16] + hexDigits[x % 16];
}


const textareas = document.querySelectorAll('textarea');

function autoResize() {
    this.style.height = 'auto'; // Reset the height
    this.style.height = (this.scrollHeight) + 'px'; // Set the height based on the scroll height
}

textareas.forEach(textarea => {
    textarea.addEventListener('input', autoResize);

    // Optional: adjust the height on page load
    if (textarea.value) {
        textarea.style.height = 'auto';
        textarea.style.height = (textarea.scrollHeight) + 'px';
    }
});


function escapeDoubleQuotes(str) {
    return str.replace(/"/g, '\\"');
}
function decodeHTMLEntities(text) {
    var textArea = document.createElement('textarea');
    textArea.innerHTML = text;
    return textArea.value;
}
function encodeAndEscapeJSON(row) {
    // Convert the row object to a JSON string
    let rowData = JSON.stringify(row);

    // Escape double quotes in the JSON string
    rowData = rowData.replace(/"/g, '\\"');

    // Encode the JSON string to avoid issues with special characters
    return encodeURIComponent(rowData);
}
// Fungsi untuk mengganti tanda kutip ganda dalam nilai string JSON
function fixJsonString(jsonStr) {

    jsonStr = jsonStr.replace(/:\s*"(.*?)"/g, function(match, p1) {
        return ': "' + p1.replace(/"/g, '\\"') + '"';
    });
    return jsonStr;
}
