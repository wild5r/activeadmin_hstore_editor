#-*- encoding: utf-8; tab-width: 2 -*-
require 'activeadmin'

module ActiveAdmin
  class ResourceDSL
    def hstore_editor
      before_save do |object,args|
        object.class.columns_hash.select {|key,attr| attr.type == :hstore}.keys.each do |key|
          object.attributes = {key => JSON.parse(params[object.class.name.underscore][key])} if params[object.class.name.underscore].key? key
        end
        Rails.logger.error [resource, object.inspect, params]
      end
    end
  end
end
