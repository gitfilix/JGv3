<cfprocessingdirective pageencoding="utf-8" />
<cfoutput query="getFooter">
	<div class="row">
		<div class="col-sm-0  col-md-2 col-lg-2">
			&copy; #copyright#
		</div>
		<div class="col-md-4 col-lg-4">
		   	<address class="footertext">#adresse# | Tel: <a href="tel:0522137171" > #telnummer# | e-Mail: <a href="mailto:#e_mail#">gasser-mail</a></address>
		</div>
		<div class="col-md-4 col-lg-4">
			<quote>Qualitätslabor in Winterthur</quote>
			<cfinclude template="footernav.cfm">
		</div>	
		<div class="col-sm-0 col-md-2 col-lg-2">
			<span class="author">
				Design & Code:
				<br /> 
				<a target="_blank" href="http://www.web-kanal.ch">&harr; web-kanal</a>
			</span>
		</div>
   </div>
</cfoutput>