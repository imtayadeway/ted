module Ted
  class Content
    attr_accessor :attributes, :xml

    include XmlDoc

    def initialize
      @attributes = XmlDoc::ATTRIBUTES
      @xml = Builder::XmlMarkup.new(indent: 2)
      @xml.instruct! :xml, encoding: 'UTF-8'
    end

    def document_content
      xml.office(:'document-content', attributes)
    end
  end
end
