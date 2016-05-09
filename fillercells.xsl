<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!-- http://www.jameshbyrd.com/building-html-tables-with-xsl/ -->
<xsl:template name="FillerCells">
	<xsl:param name="cellCount"/>
	<td>&#160;</td>
	<xsl:if test="$cellCount > 1">
		<xsl:call-template name="FillerCells">
			<xsl:with-param name="cellCount" select="$cellCount - 1"/>
		</xsl:call-template>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>