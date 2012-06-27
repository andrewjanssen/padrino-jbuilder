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
      template = self.file.sub(scope.settings.views, "").sub(/^\//, "")
      preamble = locals.map { |k,v| "#{k} = locals[#{k.inspect}]" }.join("\n") + "\n"
      Jbuilder.encode do |json|
        scope.instance_eval(preamble + File.open(self.file).read)
      end
    end
  end

  Tilt.register 'jbuilder', JbuilderTiltTemplate
}