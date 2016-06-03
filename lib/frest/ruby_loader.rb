require_relative "ruby_loader/version"

module Frest
  module RubyLoader
    def load content:, id:, **others
      eval content
      module_function id
      method id
    end

    module_function :load
  end
end

Frest::Core::Loaders.register_loader loader: Frest::RubyLoader, file_types: ['rb'], type_name: 'rb'