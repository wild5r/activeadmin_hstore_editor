# ActiveAdmin::HstoreEditor

"hstore_input" field type to active_admin that allow to edit Postgresql hstore values as json tree.
Data shown by using jsoneditor.js from http://jsoneditoronline.org

## Installation

Add this line to your application's Gemfile:

    gem 'activeadmin_hstore_editor'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activeadmin_hstore_editor

Include styles in "active_admin" initializer

    config.register_stylesheet 'active_admin/hstore_editor.css'

Include javascripts in "active_admin" initializer

    config.register_javascript 'active_admin/hstore_editor.js'

## Usage

This Gem provides you formtastic input called :hstore to edit hstore data and parse form data for store it


```ruby
ActiveAdmin.register User do
  permit_params :settings

  hstore_editor

  # specify the type does not necessarily
  form do |f|
    f.inputs do
      f.input :settings, as: :hstore
    end

    f.actions
  end
end
```

## Contributing

1. Fork it ( http://github.com/wild-ex/activeadmin_hstore_editor/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
