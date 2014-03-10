require 'spec_helper'

module Xml
  describe Meta do
    it_behaves_like "an xml doc"

    describe "#content" do
      let(:content) { subject.content }

      specify { content.should =~ /<office:meta>/ }
      specify { content.should =~ /<meta:initial-creator>#{ ENV['USER'] }/ }
      specify { content.should =~ /<meta:creation-date>#{ DateTime.now.to_s }/ }
      specify { content.should =~ /<meta:document-statistic meta:table-count=/ }
      specify { content.should =~ /<meta:generator>Ted/ }
    end
  end
end
