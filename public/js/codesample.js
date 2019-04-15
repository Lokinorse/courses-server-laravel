function tinymce_setup_callback(editor) {
    editor.settings.external_plugins = {
        'codesample': '/lib/tinymce/plugins/codesample/plugin.min.js',
    }
    editor.settings.toolbar = editor.settings.toolbar + " codesample code" 
}