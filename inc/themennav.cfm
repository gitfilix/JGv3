<cfprocessingdirective pageencoding="utf-8" />
<nav class="themennav">
	<ul>
		<cfoutput query="getThemenNav">
		<li <cfif id EQ url.id>class="active"</cfif> >
			<a href="#trim(application.com.nav.rewriteLinkById(id=id,lang=lang))#">
				#navtitel#
			</a>
		</li>
		</cfoutput>
	</ul>
</nav>