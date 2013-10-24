module Ted
  class Content
    attr_accessor :attributes, :xml

    include XmlDoc

    def initialize
      @attributes = XmlDoc::ATTRIBUTES
      @xml = Builder::XmlMarkup.new(indent: 0)
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
      content.style(:'font-face', font_face_attrs[index])
    end

    def style(content, index)
      content.style(:style, style_attrs[index]) { |ss| style_table(ss, index) }
    end

    def style_table(content, index)
      content.style(style_table_tags[index], style_table_attrs[index])
    end

    def add_font_faces_to(content)
      font_face_attrs.size.times { |i| font_face(content, i) }
    end

    def add_styles_to(content)
      style_attrs.size.times { |i| style(content, i) }
    end

    def add_spreadsheet_to(content)
      content.office(:spreadsheet) { |s| add_table_to(s) }
    end

    def add_table_to(content)
      content.table(:table)
    end

    def generate
      document_content do |dc|
        dc.office(:scripts)
        dc.office(:'font-face-decls') { |ffd| add_font_faces_to(ffd) }
        dc.office(:'automatic-styles') { |as| add_styles_to(as) }
        dc.office(:body) { |body| add_spreadsheet_to(body) }
      end
    end
  end
end
