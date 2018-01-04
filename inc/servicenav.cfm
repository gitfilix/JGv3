<cfprocessingdirective pageencoding="utf-8" />
<nav class="servicenav">
	<ul class="list-inline">
		<cfoutput query="getServiceNav">
		<li <cfif id EQ url.id>class="active"</cfif>>
			<a href="#trim(application.com.nav.rewriteLinkById(id=id,lang=lang))#">
				#navtitel#
			</a>
		</li>
		</cfoutput>
	</ul>
</nav>