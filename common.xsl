<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="link">
	<a href="{@h}"><xsl:apply-templates/></a>
</xsl:template>
    
</xsl:stylesheet>