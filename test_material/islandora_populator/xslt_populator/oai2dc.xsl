<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:oai_dc='http://www.openarchives.org/OAI/2.0/oai_dc/' xmlns:dc="http://purl.org/dc/elements/1.1/" version="1.0" xmlns="http://www.loc.gov/mods/v3">

  <!-- This stylesheet processes standard dublin core fields from standard oai_dc OAI feeds.
       -->

  <xsl:output omit-xml-declaration="yes" indent="yes"/>

<xsl:template match="oai_dc:dc">
<mods xmlns="http://www.loc.gov/mods/v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="3.4" xsi:schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-4.xsd">
<xsl:call-template name="dcMain"/>
</mods>
</xsl:template>
<xsl:template name="dcMain">
<xsl:apply-templates select="dc:title"/>
<xsl:apply-templates select="dc:creator"/>
<xsl:apply-templates select="dc:contributor"/>
<xsl:apply-templates select="dc:type"/>
<xsl:apply-templates select="dc:subject | dc:coverage"/>
<xsl:apply-templates select="dc:description"/>
<xsl:apply-templates select="dc:publisher"/>
<xsl:apply-templates select="dc:date"/>
<xsl:apply-templates select="dc:format"/>
<xsl:apply-templates select="dc:identifier"/>
<xsl:apply-templates select="dc:source | dc:relation"/>
<xsl:apply-templates select="dc:language"/>
<xsl:apply-templates select="dc:rights"/>
</xsl:template>


      <xsl:template match="dc:title">
        <xsl:if test="normalize-space(.)!=''">
          <titleInfo><title><xsl:value-of select="normalize-space(.)"/></title></titleInfo> <!--title-->
        </xsl:if>
      </xsl:template>

      <xsl:template match="dc:contributor">
        <xsl:variable name="contributorvalue" select="normalize-space(.)"/>
          <xsl:if test="normalize-space(.)!=''">
          <name>
             <namePart>
               <xsl:value-of select="normalize-space(.)"/> <!--contributor-->
             </namePart>
             <role><roleTerm>contributor</roleTerm></role>
          </name>
          </xsl:if>
      </xsl:template>

      <xsl:template match="dc:coverage">
          <xsl:if test="normalize-space(.)!=''">
            <xsl:choose>
              <!-- check to see if there are any numbers in this coverage value -->
              <xsl:when test='matches(.,"\d+")'>
                <xsl:choose>
                  <!-- if numbers follow a coordinate pattern, it's probably geo data -->
                  <xsl:when test='matches(.,"\d+\.\d+")'>
                    <subject><geographic><xsl:value-of select="normalize-space(.)"/></geographic></subject> <!--coverage-->
                  </xsl:when>
                  <!-- if there's no coordinate pattern, it's probably temporal data; put it in <subject><topic> -->
                  <xsl:otherwise>
                    <subject><topic><xsl:value-of select="normalize-space(.)"/></topic></subject>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <!-- if there are no numbers, it's probably geo data -->
              <xsl:otherwise>
                <subject><geographic><xsl:value-of select="normalize-space(.)"/></geographic></subject> <!--coverage-->
              </xsl:otherwise>
            </xsl:choose>
          </xsl:if>
      </xsl:template>

      <xsl:template match="dc:creator">
        <xsl:variable name="creatorvalue" select="normalize-space(.)"/>
          <xsl:if test="normalize-space(.)!=''">
          <name>
            <namePart>
              <xsl:value-of select="normalize-space(.)"/> <!--creator-->
            </namePart>
            <role><roleTerm>creator</roleTerm></role>
          </name>
          </xsl:if>
      </xsl:template>

        <xsl:template match="dc:date">
          <xsl:variable name="datevalue" select="normalize-space(.)"/>
            <xsl:if test="normalize-space(.)!=''">
            <dateCreated keyDate="yes"><xsl:value-of select="normalize-space(.)"/></dateCreated> <!--date-->
            </xsl:if>
        </xsl:template>

        <xsl:template match="dc:publisher">
          <xsl:variable name="publishervalue" select="normalize-space(.)"/>
            <xsl:if test="normalize-space(.)!=''">
            <publisher><xsl:value-of select="normalize-space(.)"/></publisher> <!--publisher-->
            </xsl:if>
        </xsl:template>


      <xsl:template match="dc:relation">
        <xsl:variable name="relationvalue" select="normalize-space(.)"/>
          <xsl:if test="normalize-space(.)!=''">
            <xsl:choose>
              <xsl:when test="contains(.,'http')">
                <relatedItem><location><url><xsl:value-of select="normalize-space(.)"/></url></location></relatedItem> <!--relation-->
              </xsl:when>
              <xsl:otherwise>
                <relatedItem><titleInfo><title><xsl:value-of select="normalize-space(.)"/></title></titleInfo></relatedItem> <!--relation-->
              </xsl:otherwise>
            </xsl:choose>
          </xsl:if>
      </xsl:template>

      <xsl:template match="dc:description">
        <xsl:if test="normalize-space(.)!=''">
          <note type="content"><xsl:value-of select="normalize-space(.)"/></note> <!--description-->
        </xsl:if>
      </xsl:template>

      <xsl:template match="dc:format">
          <xsl:variable name="formatvalue" select="normalize-space(.)"/>
            <xsl:if test="normalize-space(.)!=''">
            <form><xsl:value-of select="normalize-space(.)"/></form> <!--format-->
            </xsl:if>
      </xsl:template>

      <xsl:template match="dc:identifier" mode="identifier">
        <xsl:variable name="idvalue" select="normalize-space(.)"/>
          <xsl:if test="normalize-space(.)!=''">
            <identifier><xsl:value-of select="normalize-space(.)"/></identifier> <!--identifier-->
          </xsl:if>
      </xsl:template>

        <xsl:template match="dc:language">
          <xsl:variable name="languagevalue" select="normalize-space(.)"/>
            <xsl:if test="normalize-space(.)!=''">
            <language><languageTerm><xsl:value-of select="normalize-space(.)"/></languageTerm></language><!--language-->
            </xsl:if>
        </xsl:template>

      <xsl:template match="dc:rights">
        <xsl:variable name="rightsvalue" select="normalize-space(.)"/>
         <xsl:choose>
           <xsl:when test="matches(normalize-space(.),'^Public domain\.$') or matches(normalize-space(.),'^Public Domain$') or matches(normalize-space(.),'^Public Domain\.$')">
              <accessCondition>Public domain</accessCondition> <!--rights-->
           </xsl:when>
           <xsl:otherwise>
             <xsl:if test="normalize-space(.)!=''">
               <accessCondition><xsl:value-of select="normalize-space(.)"/></accessCondition> <!--rights-->
             </xsl:if>
           </xsl:otherwise>
         </xsl:choose>
      </xsl:template>

        <xsl:template match="dc:subject">
          <xsl:variable name="subjectvalue" select="normalize-space(.)"/>
            <xsl:if test="normalize-space(.)!=''">
            <subject><topic><xsl:value-of select="normalize-space(.)"/></topic></subject> <!--subject-->
            </xsl:if>
        </xsl:template>

      <xsl:template match="dc:type">
        <xsl:variable name="typevalue" select="normalize-space(.)"/>
          <xsl:if test="normalize-space(.)!=''">
          <genre><xsl:value-of select="normalize-space(.)"/></genre> <!--type-->
          </xsl:if>
      </xsl:template>

</xsl:stylesheet>
