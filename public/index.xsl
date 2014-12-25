<?xml version="1.0"?>
<xsl:stylesheet
 version="2.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns="http://www.w3.org/1999/xhtml"
>

 <xsl:output method="html" doctype-public="" />

 <xsl:template match="/">
  <html>
   <head>
    <title>Unko</title>
    <script src="/index.js"></script>
    <link rel="stylesheet" href="/index.css" />
   </head>
   <body>
    <h1>Unko</h1>
    <xsl:call-template name="form" />
    <xsl:apply-templates select="/response/unkos" />
   </body>
  </html>
 </xsl:template>

 <xsl:template name="form">
  <form action="/unkos" method="post">
   <xsl:call-template name="csrf-token" />
   <p>
    <label>name
     <input name="unko[name]" size="10" placeholder="うんこ" />
    </label>
   </p>
   <p>
    <label>greeting
     <input name="unko[greeting]" size="20" placeholder="Hello!" />
    </label>
   </p>
   <p>
    <button>add</button>
   </p>
  </form>
 </xsl:template>

 <xsl:template name="csrf-token">
  <input type="hidden">
   <xsl:attribute name="name">
    <xsl:value-of select="//meta[@name='csrf-param']/@content" />
   </xsl:attribute>
   <xsl:attribute name="value">
    <xsl:value-of select="//meta[@name='csrf-token']/@content" />
   </xsl:attribute>
  </input>
 </xsl:template>

 <xsl:template match="unkos">
  <section class="unkos">
   <xsl:apply-templates select="unko" />
  </section>
 </xsl:template>

 <xsl:template match="unko">
  <article class="unko">
   <p class="unko-name">
    <xsl:value-of select="name" />
   </p>
   <p class="unko-greeting">
    <xsl:value-of select="greeting" />
   </p>
  </article>
 </xsl:template>

</xsl:stylesheet>
