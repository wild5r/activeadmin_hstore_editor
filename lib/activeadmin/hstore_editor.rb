#-*- encoding: utf-8; tab-width: 2 -*-
require "activeadmin/hstore_editor/version"
require "activeadmin/resource_dsl"

module ActiveAdmin
  module HstoreEditor
    class Engine < ::Rails::Engine
      config.assets.precompile += %w[img/jsoneditor-icons.png]

      rake_tasks do
        task 'assets:precompile' do
          fingerprint = /\-[0-9a-f]{32}\./
          Dir['public/assets/img/jsoneditor-icons-*'].each do |file|
            next unless file =~ fingerprint
            nondigest = file.sub fingerprint, '.'
            FileUtils.cp file, nondigest, verbose: true
          end
        end
      end
    end
  end
end
