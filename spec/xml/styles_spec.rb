require 'spec_helper'

module Xml
  describe Styles do
    it_behaves_like "an xml doc"

    describe "#content" do
      let(:content) { subject.content }

      specify { content.should =~ /<office:styles>/ }
      specify { content.should =~ /<office:automatic-styles>/ }
      specify { content.should =~ /<office:master-styles>/ }
      specify { content.should =~ /<style:font-face style:name="Arial"/ }
      specify { content.should =~ /svg:font-family="Arial"/ }
      specify { content.should =~ /<style:font-face style:name="DejaVu Sans"/ }
      specify { content.should =~ /<style:font-face style:name="Lohit Hindi"/ }
      specify { content.should =~ /<style:font-face style:name="WenQuanYi Zen Hei"/ }
      specify { content.should =~ /<style:default-style style:family="table-cell">/ }
      specify { content.should =~ /<style:paragraph-properties style:tab-stop-distance="0.5in"\/>/ }
      specify { content.should =~ /<style:text-properties style:font-name="Arial" / }
      specify { content.should =~ /fo:language="en" fo:country="US"/ }
      specify { content.should =~ /style:font-name-asian="DejaVu Sans"/ }
      specify { content.should =~ /style:language-asian="zh" style:country-asian="CN"/ }
      specify { content.should =~ /style:font-name-complex="DejaVu Sans"/ }
      specify { content.should =~ /style:language-complex="hi" style:country-complex="IN"\/>/ }
      specify { content.should =~ /<number:number-style style:name="N0">/ }
      specify { content.should =~ /<number:number number:min-integer-digits="1"\/>/ }
      specify { content.should =~ /<number:currency-style style:name="N104P0" style:volatile="true">/ }
      specify { content.should =~ /<number:currency-symbol number:language="en" number:country="US">\$<\/number:currency-symbol>/ }
      specify { content.should =~ /<number:number number:decimal-places="2" number:min-integer-digits="1" number:grouping="true"\/>/ }
      specify { content.should =~ /<number:currency-style style:name="N104">/ }
      specify { content.should =~ /<style:text-properties fo:color="#ff0000"\/>/ }
      specify { content.should =~ /<number:text>-<\/number:text>/ }
      specify { content.should =~ /<style:style style:name="Default" style:family="table-cell">/ }
      specify { content.should =~ /<style:style style:name="Result" style:family="table-cell" style:parent-style-name="Default">/ }
      specify { content.should =~ /<style:style style:name="Result2" style:family="table-cell" style:parent-style-name="Result" style:data-style-name="N104"\/>/ }
      specify { content.should =~ /<style:style style:name="Heading" style:family="table-cell" style:parent-style-name="Default">/ }
      specify { content.should =~ /<style:style style:name="Heading1" style:family="table-cell" style:parent-style-name="Heading">/ }
      specify { content.should =~ /<style:text-properties style:font-name-asian="WenQuanYi Zen Hei"/ }
      specify { content.should =~ /style:font-family-generic-complex="system" style:font-pitch-complex="variable"\/>/ }
      specify { content.should =~ /<style:text-properties fo:font-style="italic" style:text-underline-style="solid" style:text-underline-width="auto" style:text-underline-color="font-color" fo:font-weight="bold"\/>/ }
      specify { content.should =~ /<style:table-cell-properties style:text-align-source="fix" style:repeat-content="false"\/>/ }
      specify { content.should =~ /<style:paragraph-properties fo:text-align="center"\/>/ }
      specify { content.should =~ /<style:text-properties fo:font-size="16pt" fo:font-style="italic" fo:font-weight="bold"\/>/ }
      specify { content.should =~ /<style:table-cell-properties style:rotation-angle="90"\/>/ }
      specify { content.should =~ /<style:page-layout style:name="Mpm1">/ }
      specify { content.should =~ /<style:page-layout style:name="Mpm2">/ }
      specify { content.should =~ /<style:master-page style:name="Default" style:page-layout-name="Mpm1">/ }
      specify { content.should =~ /<style:master-page style:name="Report" style:page-layout-name="Mpm2">/ }
      specify { content.should =~ /<style:page-layout-properties style:writing-mode="lr-tb"\/>/ }
      specify { content.should =~ /<style:header-style>/ }
      specify { content.should =~ /<style:header-footer-properties fo:min-height="0.2953in" fo:margin-left="0in" fo:margin-right="0in" fo:margin-bottom="0.0984in"\/>/ }
      specify { content.should =~ /<style:header-footer-properties fo:min-height="0.2953in" fo:margin-left="0in" fo:margin-right="0in" fo:margin-top="0.0984in"\/>/ }
      specify { content.should =~ /<style:page-layout-properties style:writing-mode="lr-tb"\/>/ }
      specify { content.should =~ /<style:header-footer-properties fo:min-height="0.2953in" fo:margin-left="0in" fo:margin-right="0in" fo:margin-bottom="0.0984in" fo:border="2.49pt solid #000000" fo:padding="0.0071in" fo:background-color="#c0c0c0">/ }
      specify { content.should =~ /<style:background-image\/>/ }
      specify { content.should =~ /<style:footer-style>/ }
      specify { content.should =~ /<style:header-footer-properties fo:min-height="0.2953in" fo:margin-left="0in" fo:margin-right="0in" fo:margin-top="0.0984in" fo:border="2.49pt solid #000000" fo:padding="0.0071in" fo:background-color="#c0c0c0">/ }
      specify { content.should =~ /<style:header>/ }
      specify { content.should =~ /<text:p><text:sheet-name>\?\?\?<\/text:sheet-name><\/text:p>/ }
      specify { content.should =~ /<style:header-left style:display="false"\/>/ }
      specify { content.should =~ /<style:footer>/ }
      specify { content.should =~ /<text:p>Page <text:page-number>1<\/text:page-number><\/text:p>/ }
      specify { content.should =~ /<style:footer-left style:display="false"\/>/ }
      specify { content.should =~ /<style:region-left>/ }
      specify { content.should =~ /<text:p><text:sheet-name>\?\?\?<\/text:sheet-name> \(<text:title>\?\?\?<\/text:title>\)<\/text:p>/ }
      specify { content.should =~ /<style:region-right>/ }
      specify { content.should =~ /<text:p><text:date style:data-style-name="N2" text:date-value="2013-11-03">00\/00\/0000<\/text:date>, <text:time>00:00:00<\/text:time><\/text:p>/ }
      specify { content.should =~ /<text:p>Page <text:page-number>1<\/text:page-number> \/ <text:page-count>99<\/text:page-count><\/text:p>/ }
    end
  end
end
