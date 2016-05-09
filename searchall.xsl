<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="searchallmain.xsl"/>
<xsl:import href="common.xsl"/>
<xsl:import href="fillercells.xsl"/>

<xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" doctype-system="about:legacy-compat"/>

<xsl:variable name="cellsPerRow" select="2"/>

<xsl:param name="checkbox1"/>
<xsl:param name="checkbox2"/>
<xsl:param name="radio1high"/>
<xsl:param name="radio1low"/>
<xsl:param name="radio1ahigh"/>
<xsl:param name="radio1alow"/>
<xsl:param name="radio2high"/>
<xsl:param name="radio2low"/>

<xsl:template match="root">
<html>
	<head>
		<title><xsl:value-of select="@title"/> Search Results</title>	
	 	<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
  </head>      
  <body>
		<h1><xsl:value-of select="@title"/> Search Results</h1>
		<table>
			<xsl:apply-templates select="database"/>
		</table>
  </body>
</html>
</xsl:template>
</xsl:stylesheet>