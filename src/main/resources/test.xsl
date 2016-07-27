<?xml version="1.0" encoding="iso-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- Page layout information -->

<xsl:template match="/">
  <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <fo:layout-master-set>
      <fo:simple-page-master master-name="main" page-height="29.7cm" page-width="21cm" font-family="sans-serif" margin-top="0.5cm" margin-bottom="1cm" margin-left="1.5cm" margin-right="1.5cm">
        <fo:region-body margin-top="1.5cm" margin-bottom="1cm" />
        <fo:region-before extent="2.25in"
                               display-align="before" />
        <fo:region-after extent="1.5in" display-align="after"/>
      </fo:simple-page-master>
    </fo:layout-master-set>
    <fo:page-sequence master-reference="main">
        <fo:static-content flow-name="xsl-region-before">
           <!--<fo:block>Hello, world! Example</fo:block>-->
           <fo:block text-align="left">
             <fo:external-graphic src="url('http://www.bgcgw.org/alexandria/files/2012/11/Ross-Store-Logo.jpg')"
               content-height="20%" content-width="20%"/>
           </fo:block>
           <fo:block border-top-color="black"
                     border-top-style="solid"
                     border-top-width="thin"
                     text-align="center">
             <!--Thick black border at the top-->
           </fo:block>
        </fo:static-content>
        <fo:static-content flow-name="xsl-region-after">
              <fo:block>Hello, world! Example</fo:block>
        </fo:static-content>
        <fo:flow flow-name="xsl-region-body" >
            <xsl:apply-templates select="persons" />
            <xsl:apply-templates select="persons/person" />
        </fo:flow>
    </fo:page-sequence>
  </fo:root>
</xsl:template>

<xsl:template match="persons">
<fo:block keep-with-next.within-page="always">
  <fo:table border="solid" border-collapse="collapse" break-after="page">
  <fo:table-column width="100pt"/>
  <fo:table-body>
    <xsl:for-each select="person">
      <fo:table-row>
        <fo:table-cell border-width="1pt" border-color="black" border-style="solid" padding="2pt">
            <fo:block><xsl:value-of select="name" /></fo:block>
        </fo:table-cell>
      </fo:table-row>
    </xsl:for-each>
  </fo:table-body>
  </fo:table>
</fo:block>
</xsl:template>

<xsl:template match="persons/person">
  <fo:block keep-with-next.within-page="always" space-after="10mm">
    <fo:table border="solid" border-collapse="collapse" >
    <fo:table-column width="100pt"/>
    <fo:table-body>
      <xsl:for-each select="assets/item">
        <fo:table-row>
          <fo:table-cell border-width="1pt" border-color="black" border-style="solid" padding="2pt">
              <fo:block><xsl:value-of select="text()"/></fo:block>
          </fo:table-cell>
        </fo:table-row>
      </xsl:for-each>
    </fo:table-body>
    </fo:table>
  </fo:block>

  <fo:block linefeed-treatment="preserve"/>

  <fo:block keep-with-next.within-page="always">
    Hello <xsl:value-of select="name" />
    <fo:table border="solid" border-collapse="collapse">
      <fo:table-column column-width="100pt"/>
      <fo:table-column column-width="125pt"/>
      <fo:table-body font-size="10pt" font-family="sans-serif">
      <fo:table-row keep-with-previous="always" line-height="12pt">
          <fo:table-cell border-width="1pt" border-color="black" border-style="solid" padding="2pt">
          <fo:block><xsl:value-of select="name" /></fo:block>
          </fo:table-cell>
          <fo:table-cell border-width="1pt" border-color="black" border-style="solid" padding="2pt">
            <fo:block><xsl:value-of select="address" /></fo:block>
          </fo:table-cell>
      </fo:table-row>
      <fo:table-row keep-with-previous="always" line-height="12pt">
          1999-2001 The Apache Software Foundation
          <fo:table-cell border-width="1pt" border-color="black" border-style="solid" padding="2pt">
          <fo:block>text</fo:block>
          </fo:table-cell>
          <fo:table-cell border-width="1pt" border-color="black" border-style="solid" padding="2pt">
          <fo:block>text</fo:block>
          </fo:table-cell>
      </fo:table-row>
      <fo:table-row keep-with-previous="always" line-height="12pt">
          <fo:table-cell border-width="1pt" border-color="black" border-style="solid" padding="2pt">
          <fo:block>text</fo:block>
          </fo:table-cell>
          <fo:table-cell border-width="1pt" border-color="black" border-style="solid" padding="2pt">
          <fo:block>text</fo:block>
          </fo:table-cell>
      </fo:table-row>
      </fo:table-body>
    </fo:table>
  </fo:block>

  <fo:block font-size="14pt" padding="10px" font-family="Verdana" keep-with-next.within-page="always">Department Phone Extensions</fo:block>
   <fo:block font-size="10pt">
       <fo:table border="solid" border-collapse="collapse" break-after="page">
           <fo:table-header>
               <fo:table-row space-after="10px" line-height="12pt">
                 <fo:table-cell border-width="1pt" border-color="black" border-style="solid" padding="2pt">
                       <fo:block font-weight="bold">Name</fo:block>
                   </fo:table-cell>
                   <fo:table-cell>
                       <fo:block font-weight="bold">Extension</fo:block>
                   </fo:table-cell>
               </fo:table-row>
           </fo:table-header>
           <fo:table-body>
               <fo:table-row keep-with-previous="always" line-height="12pt">
                   <fo:table-cell>
                       <fo:block>John Doe</fo:block>
                   </fo:table-cell>
                   <fo:table-cell>
                       <fo:block>1234</fo:block>
                   </fo:table-cell>
               </fo:table-row>
               <fo:table-row line-height="12pt">
                   <fo:table-cell>
                       <fo:block>John Doe</fo:block>
                   </fo:table-cell>
                   <fo:table-cell>
                       <fo:block>1234</fo:block>
                   </fo:table-cell>
               </fo:table-row>
               <fo:table-row line-height="12pt">
                   <fo:table-cell>
                       <fo:block>John Doe</fo:block>
                   </fo:table-cell>
                   <fo:table-cell>
                       <fo:block>1234</fo:block>
                   </fo:table-cell>
               </fo:table-row>
           </fo:table-body>
       </fo:table>

   </fo:block>
</xsl:template>

</xsl:stylesheet>
