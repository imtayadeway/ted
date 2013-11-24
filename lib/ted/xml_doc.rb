module Ted
  class XmlDoc
    attr_accessor :xml

    def initialize
      @xml = Builder::XmlMarkup.new(indent: 0)
      xml.instruct! :xml, encoding: 'UTF-8'
    end

    def generate
      raise NotImplementedError, 'You must implement #generate'
    end
  end
end
