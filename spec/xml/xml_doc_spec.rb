require 'spec_helper'

module Xml
  describe XmlDoc do
    it { should respond_to(:xml) }
    it { should respond_to(:content) }
    it { should respond_to(:name) }
  end
end
