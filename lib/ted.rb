require 'ted/book'
require 'ted/sheet'
require 'builder'
require 'tempfile'
require 'date'
require 'zip'
require 'yaml'

module Xml
  class XmlDoc
    extend Forwardable

    attr_accessor :xml, :config

    def_delegators :@file, :close, :path

    def initialize
      @xml = Builder::XmlMarkup.new(indent: 0)
      xml.instruct! :xml, encoding: 'UTF-8'
      conf = File.join(File.dirname(__FILE__), 'xml', 'xml_attributes.yml')
      @config = YAML.load(File.open(conf))
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

    def full_name
      name + '.xml'
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
      config[:font_face_attrs]
    end
  end
end

require 'xml/content'
require 'xml/meta'
require 'xml/manifest'
require 'xml/settings'
require 'xml/styles'

module Ted
  VERSION = '0.0.0'

  def self.version
    VERSION
  end
end
