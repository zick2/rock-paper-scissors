<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" />
    <xsl:template match="/">
        <FileSet>
            <FileSetFiles>
                <FileSetFile>
                    <RelativePath>../../../README-02-Chinese.md</RelativePath>
                    <FileContents>
                        <xsl:text># </xsl:text>
                        <xsl:value-of select="*/name"/>
                        <xsl:text>
精灵们开始在海滩上安营扎寨。为了决定谁的帐篷可以靠近零食储存，巨大的</xsl:text>
                        <xsl:value-of select="*/name"/>
                        <xsl:text>比赛正在进行中。

</xsl:text>
                        <xsl:value-of select="*/name"/>
                        <xsl:text>是两个玩家之间的比赛。每场比赛包含许多回合；在每个回合中，玩家们同时选择一种手势：</xsl:text>
                        <xsl:for-each select="//shapes">
                            <xsl:if test="position() > 1">
                                <xsl:text>，</xsl:text>
                            </xsl:if>
                            <xsl:value-of select="name"/>
                        </xsl:for-each>
                        <xsl:text>&#32;。然后，选择该回合的获胜者：</xsl:text>
                        <xsl:for-each select="//shapes">
                            <xsl:if test="position() > 1">
                                <xsl:text>，</xsl:text>
                            </xsl:if>
                            <xsl:value-of select="name"/>
                            <xsl:text>&#32;胜利对 </xsl:text>
                            <xsl:value-of select="//shapes[opp_code=current()/wins_against]/name"/>
                        </xsl:for-each>
                        <xsl:text>。如果两个玩家选择相同的形状，则该回合以平局结束。</xsl:text>
                        <xsl:apply-templates select="*/rules"/>
                    </FileContents>
                    <OverwriteMode>Always</OverwriteMode>
                </FileSetFile>
            </FileSetFiles>
        </FileSet>
    </xsl:template>


    <xsl:template match="rules">
        <xsl:text>
</xsl:text>
<xsl:text>## 形状和结果

有</xsl:text>
<xsl:value-of select="count(shapes)"/>
<xsl:text> 个形状。它们是：
</xsl:text>
    <xsl:apply-templates select="shapes"/>
    <xsl:apply-templates select="outcomes"/>
    <xsl:text>
规则
对你昨天的帮助表示感谢，一个精灵给你一个加密的策略指南（你的谜题输入），他们说这将确保帮助你获胜。“第一列是你的对手将要玩的：</xsl:text>
<xsl:for-each select="//shapes">
<xsl:if test="position() > 1">
<xsl:text>，</xsl:text>
</xsl:if>
<xsl:text> </xsl:text>
<xsl:value-of select="opp_code"/>
<xsl:text> 代表</xsl:text>
<xsl:value-of select="name"/>
</xsl:for-each>
<xsl:text> 第二列是你应该回应的：</xsl:text>
<xsl:for-each select="//shapes">
<xsl:text> </xsl:text>
<xsl:value-of select="player_code"/>
<xsl:text> 代表</xsl:text>
<xsl:value-of select="name"/>
<xsl:text>，</xsl:text>
</xsl:for-each>
<xsl:text> 每次都胜利可能会有嫌疑，因此回应必须经过仔细选择。

整个锦标赛的赢家是得分最高的选手。你的总分数是每轮得分的总和。单轮得分是你选择的形状（</xsl:text>
<xsl:for-each select="shapes">
<xsl:if test="position() > 1">
                <xsl:text>,</xsl:text>
            </xsl:if>
            <xsl:value-of select="name()"/>
            <xsl:text>&#32;=&#32;</xsl:text>
            <xsl:value-of select="."/>
        </xsl:for-each>
        <xsl:text>).
            
由于您不能确定精灵是在帮助您还是在欺骗您，因此您应该计算如果按照策略指南行事时会获得的得分。

</xsl:text>
        <xsl:apply-templates select="games"/>
    </xsl:template>



    <xsl:template match="shapes">
        <xsl:text> - </xsl:text>
        <xsl:value-of select="name"/>
        <xsl:text>（opp 编码：`</xsl:text>
        <xsl:value-of select="opp_code"/>
        <xsl:text>`，玩家编码：`</xsl:text>
        <xsl:value-of select="player_code"/>
        <xsl:text>`，胜利于：`</xsl:text>
        <xsl:value-of select="//shapes[opp_code = current()/wins_against]/name"/>
        <xsl:text>`，分数：</xsl:text>
        <xsl:value-of select="score"/>
        <xsl:text>），</xsl:text>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>


    <xsl:template match="outcomes">
        <xsl:text>&#10;&#10;结果分数：</xsl:text>
        <xsl:text>&#10; - 胜：</xsl:text>
        <xsl:value-of select="win"/>
        <xsl:text>&#10; - 负：</xsl:text>
        <xsl:value-of select="loss"/>
        <xsl:text>&#10; - 平：</xsl:text>
        <xsl:value-of select="draw"/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>


    <xsl:template match="games">
        <xsl:text>&#10;### </xsl:text>
        <xsl:value-of select="name"/>
        <xsl:text>

因为你不能确定精灵是在帮助你还是在欺骗你，所以你应该计算如果你遵循策略指南的话你会得到的分数。

例如，假设你得到了以下策略指南：

</xsl:text>
        <xsl:text>```
</xsl:text>
        <xsl:for-each select="//rounds">
            <xsl:value-of select="opp_code"/>
            <xsl:text>&#32;</xsl:text>
            <xsl:value-of select="player_code"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
        <xsl:text>```
</xsl:text>
        <xsl:for-each select="rounds">
            <xsl:text>- 对手选择了</xsl:text>
            <xsl:value-of select="//shapes[opp_code=current()/opp_code]/name"/>
            <xsl:text> (代码 </xsl:text>
            <xsl:value-of select="opp_code"/>
            <xsl:text>)，玩家选择了</xsl:text>
            <xsl:value-of select="//shapes[player_code=current()/player_code]/name"/>
            <xsl:text> (代码 </xsl:text>
            <xsl:value-of select="player_code"/>
            <xsl:text>)&#10;</xsl:text>
            <xsl:text>这一轮是</xsl:text>
            <xsl:value-of select="result"/>
            <xsl:text>，得分为</xsl:text>
            <xsl:value-of select="score"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>      选择得分：</xsl:text>
            <xsl:value-of select="choice_score"/>
            <xsl:text>，结果得分：</xsl:text>
            <xsl:value-of select="outcome_score"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
        <xsl:text>最终得分是：</xsl:text>
        <xsl:value-of select="sum(//games/rounds/score)"/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>


</xsl:stylesheet>
