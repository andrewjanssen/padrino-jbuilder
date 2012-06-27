require "padrino-jbuilder/version"

module Padrino
  module Jbuilder
      
  end
end

# Register
throw "Padrino not defined" unless defined? Padrino
throw "Tilt not defined" unless defined? Tilt
require 'padrino-core'

Padrino.after_load {  
  class JbuilderTiltTemplate < Tilt::Template
    self.default_mime_type = "application/json"

    def initialize_engine
      return if defined? Jbuilder
      require_template_library "jbuilder"
    end

    def prepare
      options = @options.merge(:format => @options[:format], :source_location => file)
      @jbuilder = ::Jbuilder.new
    end

    def evaluate(scope, locals)
      filename = self.file
      Jbuilder.encode do |json|
        scope.instance_eval File.open(filename).read
      end
    end
  end

  Tilt.register 'jbuilder', JbuilderTiltTemplate
}