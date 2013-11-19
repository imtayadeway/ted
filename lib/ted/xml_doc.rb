module Ted
  class XmlDoc
    attr_accessor :markup

    def initialize
      @markup = Builder::XmlMarkup.new(indent: 0)
      markup.instruct! :xml, encoding: 'UTF-8'
    end

    def generate
      raise NotImplementedError, 'You must implement #generate'
    end
  end
end
