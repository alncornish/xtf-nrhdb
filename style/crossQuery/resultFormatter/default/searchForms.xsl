<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
   xmlns="http://www.w3.org/1999/xhtml"
   version="2.0">
   
   
   
   <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
   <!-- Search forms stylesheet                                                -->
   <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
   
   <!--
      Copyright (c) 2008, Regents of the University of California
      All rights reserved.
      
      Redistribution and use in source and binary forms, with or without 
      modification, are permitted provided that the following conditions are 
      met:
      
      - Redistributions of source code must retain the above copyright notice, 
      this list of conditions and the following disclaimer.
      - Redistributions in binary form must reproduce the above copyright 
      notice, this list of conditions and the following disclaimer in the 
      documentation and/or other materials provided with the distribution.
      - Neither the name of the University of California nor the names of its
      contributors may be used to endorse or promote products derived from 
      this software without specific prior written permission.
      
      THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
      AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
      IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
      ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE 
      LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
      CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
      SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
      INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
      CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
      ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
      POSSIBILITY OF SUCH DAMAGE.
   -->
   
   <!-- ====================================================================== -->
   <!-- Global parameters                                                      -->
   <!-- ====================================================================== -->
   
   <xsl:param name="freeformQuery"/>
   
   <!-- ====================================================================== -->
   <!-- Form Templates                                                         -->
   <!-- ====================================================================== -->
   
   <!-- main form page -->
   <xsl:template match="crossQueryResult" mode="form" exclude-result-prefixes="#all">
      <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
         <head>
            <title>Naval Reactors History Database</title>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
         
         <xsl:copy-of select="$brand.links"/>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-63819790-1', 'auto');
  ga('send', 'pageview');

</script>




<link rel="icon" href="favicon.ico" type="image/x-icon"/>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
         </head>
         <body>
     
<xsl:copy-of select="$brand.header"/>
            <div class="searchPage">
               <div class="forms">
                  <table>
                     <tr>
                        <td class="{if(matches($smode,'simple')) then 'tab-select' else 'tab'}"><a href="search?smode=simple">Keyword</a></td>
                        <td class="{if(matches($smode,'advanced')) then 'tab-select' else 'tab'}"><a href="search?smode=advanced">Advanced</a></td> 
                       <!-- <td class="{if(matches($smode,'freeform')) then 'tab-select' else 'tab'}"><a href="search?smode=freeform">Freeform</a></td> -->
                       <!-- <td class="{if(matches($smode,'browse')) then 'tab-select' else 'tab'}"><a href="search?smode=browse">Browse</a></td> -->
                     </tr>
                     <tr>
                        <td colspan="4">
                           <div class="form">
                              <xsl:choose>
                                 <xsl:when test="matches($smode,'simple')">
                                    <xsl:call-template name="simpleForm"/>
                                 </xsl:when>
                                 <xsl:when test="matches($smode,'advanced')">
                                    <xsl:call-template name="advancedForm"/>
                                 </xsl:when>
                                 <xsl:when test="matches($smode,'freeform')">
                                    <xsl:call-template name="freeformForm"/>
                                 </xsl:when>
                                 <xsl:when test="matches($smode,'browse')">
                                    <table>
                                       <tr>
                                          <td>
                                             <p>Browse all items by the available facets (subject, date, and material type), or by title:</p>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <xsl:call-template name="browseLinks"/>
                                          </td>
                                       </tr>
                                    </table>
                                 </xsl:when>
                              </xsl:choose>
                           </div>
                        </td>
                     </tr>
                  </table>
               </div>
            </div>
            <xsl:copy-of select="$brand.footer"/>
         </body>
      </html>
   </xsl:template>
   
   <!-- simple form -->
   <xsl:template name="simpleForm" exclude-result-prefixes="#all">
      <form method="get" action="{$xtfURL}{$crossqueryPath}">
         <table>
            <tr>
               <td>
                  <input type="text" name="keyword" size="40" value="{$keyword}"/>
                  <xsl:text>&#160;</xsl:text>
                  <input type="submit" value="Search"/>
                  <input type="reset" onclick="location.href='{$xtfURL}{$crossqueryPath}'" value="Clear"/>
               </td>
            </tr>
            <tr>
               <td>
                  <table class="sampleTable">
                     <tr>
                        <td colspan="2">Examples:</td>                  
                     </tr>
                     <tr>
                        <td class="sampleQuery">nautilus</td>
                        <td class="sampleDescrip">Search keywords (full text and metadata) for 'nautilus'</td>
                     </tr>
                     <tr>
                        <td class="sampleQuery">s1w prototype</td>
                        <td class="sampleDescrip">Search keywords for 's1w' AND 'prototype'</td>
                     </tr>
                     <tr>
		<td class="sampleQuery">"los angeles"</td>
				<td class="sampleDescrip">Search keywords for the phrase 'los angeles'</td>
                     </tr>
                     <tr>
                <td class="sampleQuery">shippingport shield*</td>
                                <td class="sampleDescrip">Search keywords for 'shippingport' and 'shield' (with 'shield' followed by zero or more characters)</td>
                     </tr>
                     <tr>
                        <td class="sampleQuery">space reactor material</td>
                        <td class="sampleDescrip">Search keywords for the words 'space,' 'reactor,' and 'material'; items with 'materials' also returned</td>
                     </tr>
                  </table>
               </td>
            </tr>
	<tr>
        <td>
<br/>
 <div style="float: center; font-size: 90%;margin-top: 6em; background-color: #F9F9F9;
border: 1px solid #CCCCCC; padding: 3px; text-align:center;"><a href="../xtf/search?expand=subject;f1-subject=USS Los Angeles (SSN-688)"><img src="../xtf/icons/default/losangeles.jpg" width="556" height="245" alt="USS Los Angeles (SSN-688)"
 /></a><br /><i>USS Los Angeles</i> (SSN-688)</div>
</td>
	</tr>
         </table>
      </form>
   </xsl:template>
   
   <!-- advanced form -->
   <xsl:template name="advancedForm" exclude-result-prefixes="#all">
      <form method="get" action="{$xtfURL}{$crossqueryPath}">
         <table class="top_table">
            <tr>
               <td>
                  <table class="left_table">
                     <tr>
                        <td colspan="3">
                           <h4>Entire Text</h4>
                        </td>
                     </tr>
                     <tr>
                        <td class="indent">&#160;</td>
                        <td colspan="2">
                           <input type="text" name="text" size="30" value="{$text}"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="indent">&#160;</td>
                        <td colspan="2">
                           <xsl:choose>
                              <xsl:when test="$text-join = 'or'">
                                 <input type="radio" name="text-join" value=""/>
                                 <xsl:text> all of </xsl:text>
                                 <input type="radio" name="text-join" value="or" checked="checked"/>
                                 <xsl:text> any of </xsl:text>
                              </xsl:when>
                              <xsl:otherwise>
                                 <input type="radio" name="text-join" value="" checked="checked"/>
                                 <xsl:text> all of </xsl:text>
                                 <input type="radio" name="text-join" value="or"/>
                                 <xsl:text> any of </xsl:text>
                              </xsl:otherwise>
                           </xsl:choose>
                           <xsl:text>these words</xsl:text>
                        </td>
                     </tr>
                     <tr>
                        <td class="indent">&#160;</td>
                        <td><b>Exclude</b></td>
                        <td>
                           <input type="text" name="text-exclude" size="20" value="{$text-exclude}"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="indent">&#160;</td>
                        <td><b>Proximity</b></td>
                        <td>
                           <select size="1" name="text-prox">
                              <xsl:choose>
                                 <xsl:when test="$text-prox = '1'">
                                    <option value=""></option>
                                    <option value="1" selected="selected">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="10">10</option>
                                    <option value="20">20</option>
                                 </xsl:when>
                                 <xsl:when test="$text-prox = '2'">
                                    <option value=""></option>
                                    <option value="1">1</option>
                                    <option value="2" selected="selected">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="10">10</option>
                                    <option value="20">20</option>
                                 </xsl:when>
                                 <xsl:when test="$text-prox = '3'">
                                    <option value=""></option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3" selected="selected">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="10">10</option>
                                    <option value="20">20</option>
                                 </xsl:when>
                                 <xsl:when test="$text-prox = '4'">
                                    <option value=""></option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4" selected="selected">4</option>
                                    <option value="5">5</option>
                                    <option value="10">10</option>
                                    <option value="20">20</option>
                                 </xsl:when>
                                 <xsl:when test="$text-prox = '5'">
                                    <option value=""></option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5" selected="selected">5</option>
                                    <option value="10">10</option>
                                    <option value="20">20</option>
                                 </xsl:when>
                                 <xsl:when test="$text-prox = '10'">
                                    <option value=""></option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="10" selected="selected">10</option>
                                    <option value="20">20</option>
                                 </xsl:when>
                                 <xsl:when test="$text-prox = '20'">
                                    <option value=""></option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="10">10</option>
                                    <option value="20" selected="selected">20</option>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <option value="" selected="selected"></option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="10">10</option>
                                    <option value="20">20</option>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </select>
                           <xsl:text> word(s)</xsl:text>
                        </td>
                     </tr>           
                  </table>
               </td>
               <td>
                  <table class="right_table">
                     <tr>
                        <td colspan="3"><h4>Metadata</h4></td>
                     </tr>
                     <tr>
                        <td class="indent">&#160;</td>
                        <td><b>Title</b></td>
                        <td>
                           <input type="text" name="title" size="30" value="{$title}"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="indent">&#160;</td>
                        <td><b>Summary</b></td>
                        <td>
                         <input type="text" name="description" size="30" value="{$description}"/>
			</td>
                     </tr>
                     <tr>
                        <td class="indent">&#160;</td>
                        <td><b>Year(s)</b></td>
                        <td>
                           <xsl:text>From&#160;&#160;&#160;</xsl:text>
                           <input type="text" name="year" size="4" value="{$year}"/>
                           <xsl:text>&#160;&#160;to&#160;&#160;</xsl:text>
                           <input type="text" name="year-max" size="4" value="{$year-max}"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="indent">&#160;</td>
                        <td><b>Type</b></td>
                        <td>
                        <select name="type">
                        <option value="" selected="selected">All</option>
                        <option value="Image">Image</option>
                        <option value="Text">Text</option>
                        </select>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="3">&#160;</td>
                     </tr>
                     <tr>
                        <td class="indent">&#160;</td>
                        <td>&#160;</td>
                        <td>
                           <input type="hidden" name="smode" value="advanced"/>
                           <input type="submit" value="Search"/>
                           <input type="reset" onclick="location.href='{$xtfURL}{$crossqueryPath}?smode=advanced'" value="Clear"/>
                        </td>
                     </tr>
                  </table>
               </td>
            </tr>
            <tr>
               <td colspan="2">
                  <table class="sampleTable">
                     <tr>
                        <td colspan="3">Examples:</td>                  
                     </tr>
                     <tr>
                        <td/>
                        <td class="sampleQuery">submarine</td>
                        <td class="sampleDescrip">Search full text for 'submarine'</td>
                     </tr>
                     <tr>
                        <td>Exclude</td>
                        <td class="sampleQuery">s5w</td>
                        <td class="sampleDescrip">Exclude results which contain the term 's5w'</td>
                     </tr>
                     <tr>
                        <td>Proximity</td>
                        <td><form action=""><select><option>5</option></select></form></td>
                        <td class="sampleDescrip">Match the full text terms, only if they are 5 or fewer words apart</td>
                     </tr>
                     <tr>
                        <td>Title</td>
                        <td class="sampleQuery">"s1w prototype"</td>
                        <td class="sampleDescrip">Search for the phrase 's1w prototype' in the 'title' field</td>
                     </tr>
                  </table>
               </td>
            </tr>
	</table>
      </form>
   </xsl:template>
   
   <!-- free-form form -->
   <xsl:template name="freeformForm" exclude-result-prefixes="#all">
      <form method="get" action="{$xtfURL}{$crossqueryPath}">
         <table>
            <tr>
               <td>
                  <p><i>Experimental feature:</i> "Freeform" complex query supporting -/NOT, |/OR, &amp;/AND, field names, and parentheses.</p>
                  <input type="text" name="freeformQuery" size="40" value="{$freeformQuery}"/>
                  <xsl:text>&#160;</xsl:text>
                  <input type="submit" value="Search"/>
                  <input type="reset" onclick="location.href='{$xtfURL}{$crossqueryPath}'" value="Clear"/>
               </td>
            </tr>
            <tr>
               <td>
                  <table class="sampleTable">
                     <tr>
                        <td colspan="2">Examples:</td>                  
                     </tr>
                     <tr>
                        <td class="sampleQuery">enterprise</td>
                        <td class="sampleDescrip">Search keywords (full text and metadata) for 'enterprise'</td>
                     </tr>
                     <tr>
                        <td class="sampleQuery">s1w prototype</td>
                        <td class="sampleDescrip">Search keywords for 's1w' AND 'prototype'</td>
                     </tr>
                     <tr>
                        <td class="sampleQuery">s1w &amp; prototype</td>
                        <td class="sampleDescrip">(same)</td>
                     </tr>
                     <tr>
                        <td class="sampleQuery">s1w AND prototype</td>
                        <td class="sampleDescrip">(same; note 'AND' must be capitalized)</td>
                     </tr>
                     <tr>
                        <td class="sampleQuery">title:george washington</td>
                        <td class="sampleDescrip">Search title for 'george' and 'washington'</td>
                     </tr>
                     <tr>
                        <td class="sampleQuery">subject:s5g</td>
                        <td class="sampleDescrip">Search subject field for 's5g'</td>
                     </tr>
		 <tr>
                        <td class="sampleQuery">s1w | shippingport</td>
                        <td class="sampleDescrip">Search for the terms "s1w" or 'shippingport'</td>
                     </tr>
                  </table>
               </td>
            </tr>
         </table>
      </form>
   </xsl:template>
   
</xsl:stylesheet>
