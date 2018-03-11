<cfprocessingdirective pageencoding="utf-8" />
<ul class="footernav">
	<cfoutput query="getFooterNav">
	<li>
		<a href="#trim(application.com.nav.rewriteLinkById(id=id,lang=lang))#">
			#navtitel#
		</a>
	 </li>
	</cfoutput>
</ul>