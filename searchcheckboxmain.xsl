<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
<xsl:template match="database">
<tr><td colspan="2"><h3>Number of Image Results: <xsl:value-of select="count(
image[@c=$checkbox1] | image[@c=$checkbox2])"/></h3></td></tr>
<xsl:apply-templates select="image[@c=$checkbox1] | image[@c=$checkbox2]">		
<xsl:sort select="@h" data-type="number"/>
<xsl:sort select="@a"/>
</xsl:apply-templates>
<tr><td colspan="2"><p>Not what you were looking for? Please <a href="javascript:history.go(-1)">return to the form</a> or try a <a href="">new search</a>.</p></td></tr>
</xsl:template>

<xsl:template match="image">
<xsl:variable name="thumbfile" select="concat('yourpath', @g)"/>
<xsl:if test="(position() mod $cellsPerRow) = 1">
<xsl:text disable-output-escaping="yes">&lt;tr&gt;</xsl:text>
</xsl:if>

<td>
<a href="yourpath/{@g}"><img src="{$thumbfile}" alt="{@a}" title="{@a}"/></a><br/><xsl:value-of select="@a"/><br/>Radio button 1 parameter 1 title: <xsl:value-of select="@e"/>&#xa0;(<xsl:value-of select="@i"/>)<br/>Radio button 1 parameter 2 title: <xsl:value-of select="@f"/>&#xa0;(<xsl:value-of select="@j"/>)<br/><xsl:value-of select="@d"/></td>

<xsl:if test="(position() mod $cellsPerRow) = 0">
<xsl:text disable-output-escaping="yes">&lt;/tr&gt;</xsl:text>
</xsl:if>

<xsl:if test="(position() = last()) and (position() &lt; $cellsPerRow)">
<xsl:call-template name="FillerCells">
<xsl:with-param name="cellCount" select="$cellsPerRow - position()"/>
</xsl:call-template>
</xsl:if>

</xsl:template>

</xsl:stylesheet>