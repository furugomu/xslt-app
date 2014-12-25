<?xml version="1.0"?>
<xsl:stylesheet
 version="2.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns="http://www.w3.org/1999/xhtml"
>

 <xsl:template match="/">
  <html>
   <head>
    <title>Unko</title>
   </head>
   <body>
    <h1>Unko</h1>
    <xsl:apply-templates select="unkos" />
   </body>
  </html>
 </xsl:template>

 <xsl:template match="unkos">
  <section class="unkos">
   <xsl:apply-templates select="unko" />
  </section>
 </xsl:template>

 <xsl:template match="unko">
  <a>
   <xsl:attribute name="href">/unkos/<xsl:value-of select="id" /></xsl:attribute>
   <article class="unko">
    <p class="unko-name">
     <xsl:value-of select="name" />
    </p>
    <p class="unko-greeting">
     <xsl:value-of select="greeting" />
    </p>
   </article>
  </a>
 </xsl:template>
 
</xsl:stylesheet>
