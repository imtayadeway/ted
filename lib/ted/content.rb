module Ted
  class Content
    attr_accessor :attributes, :xml

    include XmlDoc

    def initialize
      @attributes = XmlDoc::ATTRIBUTES
      @xml = Builder::XmlMarkup.new(indent: 2)
      @xml.instruct! :xml, encoding: 'UTF-8'
    end

    def document_content(&block)
      if block
        xml.office(:'document-content', attributes) { |dc| yield dc }
      else
        xml.office(:'document-content', attributes)
      end
    end

    def font_face(content, index)
      content.style(:'font-face', font_face_attributes[index])
    end

    def font_face_attributes
      [
        {
          'style:name' => "Arial",
          'svg:font-family' => "Arial",
          'style:font-family-generic' => "swiss",
          'style:font-pitch' => "variable"
        },
        {
          'style:name' => "DejaVu Sans",
          'svg:font-family' => "&apos;DejaVu Sans&apos;",
          'style:font-family-generic' => "system",
          'style:font-pitch' => "variable"
        },
        {
          'style:name' => "Lohit Hindi",
          'svg:font-family' => "&apos;Lohit Hindi&apos;",
          'style:font-family-generic' => "system",
          'style:font-pitch' => "variable"
        },
        {
          'style:name' => "WenQuanYi Zen Hei",
          'svg:font-family' => "&apos;WenQuanYi Zen Hei&apos;",
          'style:font-family-generic' => "system",
          'style:font-pitch' => "variable"
        }
      ]
    end

    def generate
      document_content do |dc|
        dc.office(:scripts)
        dc.office(:'font-face-decls') { |ffd| font_face_attributes.size.times { |i| font_face(ffd, i) } }
        dc.office(:'automatic-styles')
        dc.office(:body)
      end
    end
  end
end
