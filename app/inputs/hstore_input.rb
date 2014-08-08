#-*- encoding: utf-8; tab-width: 2 -*-

class HstoreInput < Formtastic::Inputs::TextInput
  def to_html
    html = '<div class="jsoneditor-wrap">'
    current_value = @object.public_send method
    html << builder.text_area(method, input_html_options.merge(
                                      value: (current_value.respond_to?(:to_json) ? current_value.to_json : '')))
    html << '</div>'
    html << '<div style="clear: both"></div>'
    input_wrapping do
      label_html << html.html_safe
    end
  end
end
