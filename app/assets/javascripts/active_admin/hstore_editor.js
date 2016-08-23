//= require jsoneditor/jsoneditor.js
//= require jsoneditor/asset/jsonlint/jsonlint.js

;(function(window, $) {
  $(function() {

    /**
     * Adds a JSON editor to all :hstore input elements in the DOM that were not already styled.
     */
    var styleHStoreComponents = function() {
      $('div.jsoneditor-wrap:not(:has(.jsoneditor))').each(function(i, wrap){
        var container = $(wrap)[0];
        var textarea = $($(wrap).find('textarea'));
        var editor;
        var options = {
          mode: 'tree',
          change: function(ev){
            textarea.text(JSON.stringify(editor.get()));
          }
        };

        editor = new JSONEditor(container, options, JSON.parse(textarea.val()));
      });
    };

    /**
     * Style :hstore inputs when DOM is ready.
     */
    styleHStoreComponents();

    /**
     * When a has_many association includes a :hstore input type, this will
     *  style that input to show the correct JSON component.
     */
    $(document).on('has_many_add:after', function() {
      styleHStoreComponents();
    });

  });
})(window, jQuery);
