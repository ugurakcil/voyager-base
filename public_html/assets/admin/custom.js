// ugurakcil

function tinymce_init_callback(editor) {
    editor.remove();
    editor = null;

    tinymce.init({
        menubar: true,
        selector: 'textarea.richTextBox',
        base_url: $('meta[name="assets-path"]').attr('content')+'?path=js/',
        min_height: 700,
        skin: "oxide-dark",
        content_css: "dark",
        resize: 'vertical',
        plugins: 'link image code table lists bootstrap4grid codesample',
        codesample_languages: [
            {text: 'Bash', value: 'bash'},
            {text: 'JavaScript', value: 'javascript'},
            {text: 'Rust', value: 'rust'},
            {text: 'GO', value: 'go'},
            {text: 'PHP', value: 'php'},
            {text: 'HTML/XML', value: 'markup'},
            {text: 'Sass (SCSS)', value: 'scss'},
            {text: 'CSS', value: 'css'},
            {text: 'SQL', value: 'sql'},
            {text: 'TypeScript', value: 'typescript'},
            {text: 'Python', value: 'python'},
            {text: 'MongoDB', value: 'mongodb'},
            {text: 'Regex', value: 'regex'},
            {text: 'Java', value: 'java'},
            {text: 'React JSX', value: 'jsx'},
            {text: 'React TSX', value: 'tsx'},
            {text: '6502 Assembly', value: 'asm6502'},
            {text: 'C++', value: 'cpp'},
            {text: 'C', value: 'c'},
            {text: 'Twig', value: 'twig'},
            {text: 'TOML', value: 'toml'},
            {text: 'Haml', value: 'Haml'},
            {text: 'GraphQL', value: 'graphql'},
            {text: '.ignore', value: 'gitignore'},
            {text: 'JSON', value: 'json'},
            {text: 'Kotlin', value: 'kotlin'},
            {text: 'Objective-C', value: 'objectivec'},
            {text: 'Perl', value: 'perl'},
            {text: 'Pug', value: 'pug'},
            {text: 'R', value: 'r'},
            {text: 'C#', value: 'csharp'},
            {text: 'Ruby', value: 'ruby'},
            {text: 'Scala', value: 'scala'},
            {text: 'Scheme', value: 'scheme'},
            {text: 'Shell session', value: 'shell-session'},
            {text: 'Solidity (Ethereum)', value: 'solidity'},
            {text: 'Swift', value: 'swift'},
            {text: 'TypoScript', value: 'typoscript'},
            {text: 'UnrealScript', value: 'unrealscript'},
            {text: 'WebAssembly', value: 'wasm'},
            {text: 'Wiki markup', value: 'wiki'},
            {text: 'Julia', value: 'julia'},
            {text: 'Log File', value: 'log'},
        ],
        //codesample_dialog_width: '400',
        //codesample_dialog_height: '400',
        extended_valid_elements : 'input[id|name|value|type|class|style|required|placeholder|autocomplete|onclick]',
        relative_urls: false, // Necessary so uploaded images don't get a relative path but an URL instead.
        remove_script_host: false,
        file_picker_types: 'image',

        file_picker_callback: (callback, value, meta) => {
            if (meta.filetype == 'image') {
                var input = document.createElement('input');
                input.setAttribute('type', 'file');
                input.setAttribute('accept', 'image/*');

                input.onchange = function () {
                    var formdata = new FormData();
                    formdata.append('image', this.files[0]);
                    formdata.append('type_slug', $('#upload_type_slug').val());
                    // Show loader
                    $('#voyager-loader').css('z-index', 10000);
                    $('#voyager-loader').fadeIn();
                    $.ajax({
                        type: 'post',
                        url: $('#upload_url').val(),
                        data: formdata,
                        enctype: 'multipart/form-data',
                        processData: false,
                        contentType: false,
                        cache: false,
                    })
                    .done((result) => {
                        callback(result);
                    })
                    .always(() => {
                        $('#voyager-loader').fadeOut();
                        $('#voyager-loader').css('z-index', 99);
                    });
                }

                input.click();
            }
        },
        toolbar: 'styleselect | bold italic underline | forecolor backcolor | alignleft aligncenter alignright | bullist numlist outdent indent | link image table | codesample | code bootstrap4grid',
        image_caption: true,
        image_title: true,
        content_css: [
            'https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css',
            window.location.origin + '/assets/admin/datasins.css',
            window.location.origin + '/assets/admin/tinymce/prism.css'
        ]
    });

}
