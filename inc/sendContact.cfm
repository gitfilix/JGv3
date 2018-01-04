<cfprocessingdirective pageencoding="utf-8" />

<!--- send contactform --->
<cfif isDefined("url.formSubmited") AND trim(form.iAmNotAbot) CONTAINS "itSeemsIamAhuman">
	<!--- Check if ContactLONG FORM --->
	<!--- Serverseitige checks: is Valid and ischecked agbs  --->
	<cfif isValid('email',form.contactmail)>

		
		<cfif form.contactsubject EQ "">
			<cfset x = "Kontakt von der Website">
		<cfelse>
			<cfset x = form.contactsubject />
		</cfif>
	<!--- 	#contactReciever# ist empfänger, 	Sender  is: #contactsender# subject ist hier von dem Formular übernommen
	--->
		
		<cfmail type="html" from="#form.contactsender#" to="#form.contactReciever#" subject="#form.contactsubject#" replyto="kuenstlername@gmail.com" wraptext="120">
<strong>Lieber Jan,</strong> ein Formular wurde von deiner neuen schönen Website übermittelt:<br/>
Folgende Felder waren im POST Request:<br/>
<br/>
<table width="400">
<tr>
	<td>Name:</td>
	<td>#form.contactname#</td>
</tr>
<tr>
	<td>Kontaktadresse Email:</td>
	<td>#form.contactmail#</td>
</tr>

<tr>
	<td>Nachricht:</td>
	<td>#form.contactmessage#</td>
</tr>
<!--- <tr>
	<td colspan="2">
		<img src="http://www.webkanal.ch/webdesign/upload/img/blume_400_blue.jpg" />
	</td>
</tr> --->
</table>
<br />
<p>
<!--- Embed image via the local file system. 


 <cfmailparam
file="#ExpandPath('/photography/img/logo-fx-blue4.png')#"
contentid="logo"
disposition="inline"
/> 
--->
<!---<img src="cid:girl" width="350" height="261" alt="" /><br />--->
</p>
  

<br/>
<br/>
-------------------------------------------------------------------------------------<br/>
webkanal service #year(now())# - <a href="http://www.web-kanal.ch">ww.webkanal.ch</a><br/>
<br/>
<br/>

	</cfmail>
		
<!--- <cfoutput query="getcontent">
		#contactThanks#<br>
</cfoutput>	 --->
	<br /><br />
	<h2>Danke für Ihre Kontaktaufnahme.</h2>	
	<br /><br /><br />
	ich werde mich bei Ihnen zurückmelden. <br />
	Freundliche Grüsse <br />
	<h3>Jan Gasser</h3>
	
	
	<cfelse>
	<h2>Es ist ein Fehler aufgetreten.</h2> <br/>
	<p>Bitte akzeptieren Sie die AGB's	</p>.
		
	</cfif>	
</cfif>