require_relative "ruby_loader/version"

module Frest
  module RubyLoader
    def load content:, id:, **others
      @returns = nil

      eval content
      module_function id
      result = method id

      Frest::RichFunction.enrich(fn: result)
    end

    module_function :load
  end
end

Frest::Core::Loaders.register_loader loader: Frest::RubyLoader, file_types: ['rb'], type_name: 'rb'