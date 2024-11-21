$("input").change(function () {


  $(this).removeClass('is-invalid');
  $(this).find('div.invalid-feedback').text('');
});
$("select").change(function () {
  $(this).removeClass('is-invalid');
  $(this).find('div.invalid-feedback').text('');
});


async function remove_validation_on_input(formSelector = '') {
  const targetSelector = formSelector ? `${formSelector} input, ${formSelector} select` : 'input, select';

  $(targetSelector).change(function () {
    $(this).removeClass('is-invalid');
    $(this).siblings('div.invalid-feedback').text(''); // Perbaikan untuk mencari invalid-feedback yang bersaudara
  });
}
async function angka_indo_format_on_input(formSelector = '') {
  const targetSelector = formSelector ? `${formSelector} .angka_indo_format` : '.angka_indo_format';

  $(targetSelector).on('keyup', function () {
    // let angka = $(this).val().replace(/\./g, '').replace(/,/g, '.');
    let angka = $(this).val();
    let prefix = "";

    // console.log(angka);

    // Jika value adalah angka, format ke dalam format angka Indonesia
    if (!isNaN(angka)) {
      // let formattedValue = new Intl.NumberFormat('id-ID').format(value).replace(/\./g, ',');
      // $(this).val(formattedValue);
      var number_string = angka.replace(/[^,\d]/g, "").toString(),
        split = number_string.split(","),
        sisa = split[0].length % 3,
        rupiah = split[0].substr(0, sisa),
        ribuan = split[0].substr(sisa).match(/\d{3}/gi);



      if (ribuan) {
        separator = sisa ? "." : "";
        rupiah += separator + ribuan.join(".");
      }

      rupiah = split[1] != undefined ? rupiah + "," + split[1] : rupiah;
      $(this).val(prefix == undefined ? rupiah : rupiah ? "" + rupiah : "");
    } else {
      $(this).val('');
    }

    // if (angka == null) {
    //     return 0;
    // }


  });
}

function formatRupiah(angka, prefix) {

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

  rupiah = split[1] != undefined ? rupiah + "," + split[1] : rupiah;
  return prefix == undefined ? rupiah : rupiah ? "" + rupiah : "";
}


async function catch_error_form_submit(error) {
  if (error.message) {
    await displayAlertId('danger', 'Error', error.message, 'alertForm');
  }

  const error_response_data = error.response.data;
  if (error_response_data) {
    const error_message = error_response_data.message;
    const error_field = error_response_data.errors;

    if (error_message) {
      await displayAlertId('danger', 'Error', error_message, 'alertForm')
    }

    if (error_field) {
      var size = Object.keys(error_field).length;
      if (size > 0) {
        var isian = Object.keys(error_field);
        for (var i = 0; i < size; i++) {
          var nameField = isian[i];
          if (i == 0) {
            $('[name="' + nameField + '"]').focus();
          }
          $('#' + nameField + '').addClass('is-invalid');
          var errMessagefield = error_field[nameField].toString();
          $('#feedback_error_' + nameField + '').text(errMessagefield);
        }
      }

    }
  }
}

async function catch_error_form_modal(error) {
  // console.log(error);
  if (error.message) {
    await displayAlertId('danger', 'Error', error.message, 'alertModal');
  }

  if (error.response) {
    const error_response_data = error.response.data;
    if (error_response_data) {
      const error_message = error_response_data.message;
      const error_field = error_response_data.errors;

      if (error_message) {
        await displayAlertId('danger', 'Error', error_message, 'alertModal')
      }

      if (error_field) {
        var size = Object.keys(error_field).length;
        if (size > 0) {
          var isian = Object.keys(error_field);
          for (var i = 0; i < size; i++) {
            var nameField = isian[i];
            if (i == 0) {
              $('[name="' + nameField + '"]').focus();
            }

            let id_element = $(`#${nameField}`);
            if (id_element.length > 0) {
              id_element.addClass('is-invalid');
            } else {
              $(`[name="${nameField}"]`).addClass('is-invalid');
            }

            var errMessagefield = error_field[nameField].toString();
            $(`#feedback_error_${nameField}`).text(errMessagefield);
          }
        }

      }
    }
  }

}


async function catch_error_form_submit_array(error, alertForm = 'alertForm') {
  if (error.message) {
    await displayAlertId('danger', 'Error', error.message, alertForm);
  }

  const error_response_data = error.response.data;
  if (error_response_data) {
    const error_message = error_response_data.message;
    const error_field = error_response_data.errors;

    if (error_message) {
      await displayAlertId('danger', 'Error', error_message, alertForm);
    }

    if (error_field) {
      const size = Object.keys(error_field).length;
      if (size > 0) {
        const fields = Object.keys(error_field);
        for (let i = 0; i < size; i++) {
          const fieldName = fields[i]; // Misalnya: "peternak_id.0"
          const fieldParts = fieldName.split('.'); // Pisahkan nama field dan indeks array
          const baseName = fieldParts[0]; // Nama dasar field, misalnya: "peternak_id"
          const index = fieldParts[1]; // Indeks array, misalnya: "0"

          console.log(fieldName, baseName, index);

          if (index == 0) {
            $(`[name="${baseName}[]"]`).eq(index).focus();
            // Tambahkan kelas 'is-invalid' pada input yang sesuai
            $(`[name="${baseName}[]"]`).eq(index).addClass('is-invalid');

            // Tampilkan pesan error yang sesuai
            const errMessagefield = error_field[fieldName].toString();
            // console.log(`#feedback_error_${baseName}`);
            $(`#feedback_error_${baseName}`).text(errMessagefield);
          }

          else {
            // Tambahkan kelas 'is-invalid' pada input yang sesuai
            $(`[name="${baseName}[]"]`).eq(index).addClass('is-invalid');

            // Tampilkan pesan error yang sesuai
            const errMessagefield = error_field[fieldName].toString();

            console.log(`#feedback_error_${baseName}_${index}`);
            $(`#feedback_error_${baseName}_${index}`).text(errMessagefield);
          }


        }
      }
    }
  }

}

function previewImg(input, previewContainerId) {
  const previewContainer = document.getElementById(previewContainerId);

  // Mengosongkan container sebelum menambahkan preview baru
  previewContainer.innerHTML = '';

  // Mengambil file dari input
  const files = input.files;

  // Iterasi semua file yang diunggah
  Array.from(files).forEach((file, index) => {
    const reader = new FileReader();

    reader.onload = function (e) {
      // Membuat elemen img untuk menampilkan preview
      const imgElement = document.createElement('img');
      imgElement.src = e.target.result;
      imgElement.alt = `Preview ${index + 1}`;
      imgElement.style.maxWidth = '200px'; // Atur ukuran sesuai kebutuhan
      imgElement.style.margin = '10px'; // Menambahkan margin

      // Menambahkan img ke dalam container
      previewContainer.appendChild(imgElement);
    };

    // Membaca file sebagai URL
    reader.readAsDataURL(file);
  });
}

function adjustInputWidth(formSelector = '') {
  // Tentukan selektor target, jika formSelector diberikan, gunakan itu
  const targetSelector = formSelector ? `${formSelector} input, ${formSelector} textarea, ${formSelector} .form-select` : 'input, textarea, .form-select';

  document.querySelectorAll(targetSelector).forEach(element => {
    // Tambahkan event listener untuk menjalankan fungsi saat ada perubahan
    element.addEventListener('input', () => {
      element.style.width = 'auto'; // Reset ke auto untuk mengukur konten
      element.style.width = `${element.scrollWidth}px`; // Atur lebar berdasarkan konten
    });

    // Jalankan fungsi untuk mengatur lebar saat halaman pertama kali dimuat
    element.style.width = 'auto'; // Reset ke auto untuk mengukur konten
    element.style.width = `${element.scrollWidth}px`; // Atur lebar berdasarkan konten
  });
}

// Fungsi untuk menyesuaikan lebar Select2 dengan konten
function adjustSelect2Width(formSelector = '') {
  // Tentukan selektor target, jika formSelector diberikan, gunakan itu
  const targetSelector = formSelector ? `${formSelector} .select2` : '.select2';

  $(targetSelector).each(function () {
    const select2Container = $(this).next('.select2-container');
    const selectedOption = $(this).find(':selected').text();

    // Buat elemen span sementara untuk mengukur lebar teks yang dipilih
    const tempSpan = $('<span>').text(selectedOption).css({
      'font-size': select2Container.css('font-size'),
      'visibility': 'hidden',
      'white-space': 'nowrap'
    }).appendTo('body');

    const width = tempSpan.width() + 20; // Tambahkan sedikit padding
    tempSpan.remove(); // Hapus elemen sementara

    // Atur lebar Select2 berdasarkan lebar teks yang dipilih
    select2Container.css('width', `${width}px`);
  });
}

function adjustSelect2WidthClass(selectElement) {
  const select2Container = $(selectElement).next('.select2-container');
  const selectedOption = $(selectElement).find(':selected').text();

  // Buat elemen span sementara untuk mengukur lebar teks yang dipilih
  const tempSpan = $('<span>').text(selectedOption).css({
    'font-size': select2Container.css('font-size'),
    'visibility': 'hidden',
    'white-space': 'nowrap'
  }).appendTo('body');

  const width = tempSpan.width() + 20; // Tambahkan sedikit padding
  tempSpan.remove(); // Hapus elemen sementara

  // Atur lebar Select2 berdasarkan lebar teks yang dipilih
  select2Container.css('width', `${width}px`);
}


// Function to dynamically adjust width for the specific element
function adjustWidth($select) {
  var selectedText = $select.select2('data')[0].text;
  var $element = $select.next('.select2-container');

  // Create a temporary element to calculate the width
  var $temp = $('<span>').text(selectedText).css({
    'font-size': $element.css('font-size'),
    'visibility': 'hidden',
    'position': 'absolute',
    'white-space': 'nowrap'
  }).appendTo('body');

  // Calculate and set new width
  var newWidth = Math.min(Math.max($temp.width() + 50, 200), 400); // Limit width between 100px and 200px
  $element.width(newWidth);

  // Remove the temporary element
  $temp.remove();
}

function mypreviewImg(input) {
  // Mendapatkan file gambar dari input
  let file = input.files[0];

  // Mendapatkan elemen-elemen terkait
  let $inputGroup = $(input).closest('.input-group');
  let $resetButton = $inputGroup.find('.reset-image');
  let $imgPreview = $inputGroup.closest('.input_gambar').next().find('.img-preview');
  // console.log($imgPreview);

  if (file) {
    let reader = new FileReader();

    reader.onload = function (e) {
      // Set preview gambar dan tampilkan
      $imgPreview.attr('src', e.target.result).removeClass('d-none');
      // Tampilkan tombol reset
      $resetButton.removeClass('d-none');
    };

    reader.readAsDataURL(file);
  }
}

function myresetImg(button) {
  let $button = $(button);
  let $inputGroup = $button.closest('.input-group');
  let $imgPreview = $inputGroup.closest('.input_gambar').next().find('.img-preview');
  let $input = $inputGroup.find('input[type="file"]');
  let $removeGambar = $inputGroup.closest('.input_gambar').next().find('#remove_gambar');
  // Reset input file
  $input.val('');
  $('#remove_gambar').prop('checked', true);
  // Sembunyikan tombol reset
  $button.addClass('d-none');

  // Hapus src gambar dan sembunyikan
  $imgPreview.attr('src', '').addClass('d-none');
}
