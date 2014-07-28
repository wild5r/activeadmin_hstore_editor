#-*- encoding: utf-8; tab-width: 2 -*-
require 'activeadmin'

module ActiveAdmin
  class ResourceDSL
    def hstore_editor
      before_save do |object,args|
        request_namespace = object.class.name.underscore
        if params.key? request_namespace
          object.class.columns_hash.select {|key,attr| attr.type == :hstore}.keys.each do |key|
            object.attributes = {key => JSON.parse(params[request_namespace][key])} if params[request_namespace].key? key
          end
        else
          raise ActionController::ParameterMissing, request_namespace
        end
      end
    end
  end
end
