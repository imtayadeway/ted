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

  private
    def add_font_faces
      font_face_attrs.each { |attrs| font_face(attrs) }
    end

    def font_face(attrs)
      xml.style(:'font-face', attrs)
    end

    def font_face_attrs
      [
        {
          :'style:name'                => "Arial",
          :'svg:font-family'           => "Arial",
          :'style:font-family-generic' => "swiss",
          :'style:font-pitch'          => "variable"
        },

        {
          :'style:name'                => "DejaVu Sans",
          :'svg:font-family'           => "DejaVu Sans",
          :'style:font-family-generic' => "system",
          :'style:font-pitch'          => "variable"
        },

        {
          :'style:name'                => "Lohit Hindi",
          :'svg:font-family'           => "'Lohit Hindi'",
          :'style:font-family-generic' => "system",
          :'style:font-pitch'          => "variable"
        },

        {
          :'style:name'                => "WenQuanYi Zen Hei",
          :'svg:font-family'           => "'WenQuanYi Zen Hei'",
          :'style:font-family-generic' => "system",
          :'style:font-pitch'          => "variable"
        }
      ]
    end
  end
end
