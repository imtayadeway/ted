module Ted
  class XmlDoc
    attr_accessor :xml

    def initialize
      @xml = Builder::XmlMarkup.new(indent: 0)
      xml.instruct! :xml, encoding: 'UTF-8'
    end

    def content
      raise NotImplementedError, 'You must implement #content'
    end
    
    def name
      raise NotImplementedError, 'You must implement #name'
    end
    
    def compose
      raise NotImplementedError, 'You must implement #compose'
    end
    
    def file
      @file ||= Tempfile.new([name, '.xml'])
    end
    
    def write
      file.write(content)
      file.rewind
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
