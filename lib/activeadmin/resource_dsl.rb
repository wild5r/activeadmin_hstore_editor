#-*- encoding: utf-8; tab-width: 2 -*-
require 'activeadmin'

module ActiveAdmin
  class ResourceDSL
    def hstore_editor
      before_save do |object,args|
        request_namespace = object.class.name.underscore.gsub('/', '_')
        if params.key? request_namespace
          object.class.columns_hash.select {|key,attr| attr.type == :hstore}.keys.each do |key|
            if params[request_namespace].key? key
              json_data = params[request_namespace][key]
              data = if json_data == 'null' or json_data.blank?
                {}
              else
                JSON.parse(json_data)
              end
              object.attributes = {key => data}
            end
          end
        else
          raise ActionController::ParameterMissing, request_namespace
        end
      end
    end
  end
end
