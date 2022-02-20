<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Манастири</title>
                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            <body>
                <h1>Манастири в България</h1>
                <xsl:for-each select="//Monastery">
                    <xsl:sort
                    select="@name"
                    data-type="text"
                    order="ascending"
                    lang="bg">
                    </xsl:sort>
                    <xsl:variable name="color">
                        <xsl:choose>
                            <xsl:when test="count(.//Estates)=1">pink</xsl:when>
                            <xsl:when test="count(.//Estates)>1">green</xsl:when>
                            <xsl:otherwise>black</xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <div>
                        <img>
                            <xsl:attribute name="src">
                                <xsl:value-of select=".//Pic/@src"/>
                            </xsl:attribute>
                            <xsl:attribute name="height">
                                300px
                            </xsl:attribute>
                            <xsl:attribute name="width">
                                350px
                            </xsl:attribute>
                        </img>
                    </div>
                    <h3 style="color:{$color}">
                        <xsl:value-of select="@name"/>
                    </h3>
                    <p>
                        Регион:
                        <xsl:value-of select="@region"/>
                        <span>
                            <xsl:if test="@region='C'">
                                (централен регион)
                            </xsl:if>
                            <xsl:if test="@region='W'">
                                (западен регион)
                            </xsl:if>
                            <xsl:if test="@region='E'">
                                (източен регион)
                            </xsl:if>
                            <xsl:if test="@region='N'">
                                (северен регион)
                            </xsl:if>
                            <xsl:if test="@region='S'">
                                (южен регион)
                            </xsl:if>
                        </span>
                    </p>
                    <p>
                        <xsl:if test="@area">
                            Площ:
                            <xsl:value-of select="@area"/>
                            кв.м.
                        </xsl:if>
                    </p>
                    <p>
                        <xsl:if test="@year">
                            Година на създаване:
                            <xsl:value-of select="@year"/>
                        </xsl:if>
                    </p>
                    <p>
                        <xsl:if test="@century">
                            Век, през който е създаден:
                            <xsl:value-of select="@century"/>
                        </xsl:if>
                    </p>
                    <xsl:if test="count(.//Estates)!=0">
                        <p class="estatesP">Имоти, принадлежащи на <xsl:value-of select="@name"/>:
                        </p>
                    </xsl:if>
                    <ul>
                        <xsl:for-each select="node()">
                            <xsl:if test="name()='Estates'">
                                <li>
                                    <xsl:value-of select="@name"/>
                                    <xsl:if test="@area">
                                        с площ
                                        <xsl:value-of select="@area"/>
                                    </xsl:if>
                                </li>
                            </xsl:if>
                        </xsl:for-each>
                    </ul>
                    <xsl:if test="count(.//Abbots)!=0">
                        <p class="estatesP">Игумени на манастира:</p>
                    </xsl:if>
                    <ul>
                        <xsl:for-each select="node()">
                            <xsl:if test="name()='Abbots'">
                                <li>
                                    <xsl:value-of select="@name"/>
                                    <xsl:if test="@year">, който/която е започнал/а през
                                        <xsl:value-of select="@year"/> година.
                                    </xsl:if>
                                    <xsl:if test="@age">; Години:
                                        <xsl:value-of select="@age"/>.
                                    </xsl:if>
                                </li>
                            </xsl:if>
                        </xsl:for-each>
                    </ul>
                    <p class="cleanFloat"></p>
                    <hr/>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>