require 'ted/book'
require 'ted/sheet'
require 'ted/xml_doc'
require 'ted/content'
require 'ted/meta'
require 'ted/manifest'
require 'ted/settings'
require 'ted/styles'
require 'builder'
require 'tempfile'
require 'date'
require 'zip'
require 'yaml'

module Ted
  VERSION = '0.0.0'
  CONFIG_PATH = File.join(File.dirname(__FILE__), '..', 'config')

  def self.version
    VERSION
  end
end
