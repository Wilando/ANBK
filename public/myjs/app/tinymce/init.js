async function load_tinymce() {
    tinymce.init({
        selector: 'textarea#editor',
        plugins: 'autoresize link image code table',
        toolbar: 'undo redo | formatselect | bold italic | alignleft aligncenter alignright alignjustify | link',
        // image_uploadtab: false,
        autoresize_bottom_margin: 16,
        paste_data_images: true,
        branding: false,
        promotion: false,
        menubar: 'file edit view insert format table help',
        apiKey: apiKeyTinyMce,
        // skin : 'oxide',
        content_css: false,
        skin: false,
        // Paste configuration
        // paste_auto_cleanup_on_paste: false,
        // paste_convert_headers_to_strong: false,
        // paste_remove_styles_if_webkit: false,
        // paste_strip_class_attributes: 'all',
        //  paste_text_linebreaktype: 'default',
        images_file_types: 'jpg,png,jpeg',
        images_upload_handler: image_upload_handler,
        // Specify to reuse the filename in edit mode
        images_reuse_filename: true,
        min_height: 300,
    });
}


const image_upload_handler = (blobInfo, progress) => new Promise((resolve, reject) => {
    const xhr = new XMLHttpRequest();
    xhr.withCredentials = true;

    xhr.open('POST', app_url + '/upload-editor');
    xhr.setRequestHeader("x-csrf-token", document.querySelector('meta[name="csrf-token"]').getAttribute('content'))
    xhr.upload.onprogress = (e) => {
        progress(e.loaded / e.total * 100);
    };

    xhr.onload = () => {
        if (xhr.status === 403) {
            reject({message: 'HTTP Error: ' + xhr.status, remove: true});
            return;
        }

        if (xhr.status < 200 || xhr.status >= 300) {
            reject('HTTP Error: ' + xhr.status);
            return;
        }

        const json = JSON.parse(xhr.responseText);

        if (!json || typeof json.location != 'string') {
            reject('Invalid JSON: ' + xhr.responseText);
            return;
        }

        resolve(json.location);
    };

    xhr.onerror = () => {
        reject('Image upload failed due to a XHR Transport error. Code: ' + xhr.status);
    };

    const formData = new FormData();
    formData.append('file', blobInfo.blob(), blobInfo.filename());

    xhr.send(formData);
});
