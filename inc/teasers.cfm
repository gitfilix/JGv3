<section class="works grid-wrap">
	<!--- <header class="grid col-full">
		<hr>
		<p class="fleft">Works</p>
		<a class="arrow fright" href="works.html">see more works</a>
	</header> --->
	
	
	<cfloop from="1" to="#ceiling(getTeasers.recordcount/4)#" index="i">
		<cfset startrow = "1" />
		<cfset maxrows = "4" />
		<cfoutput query="getTeasers" startrow="#startrow#" maxrows="#maxrows#">
			<figure class="teaser">
				<cfif href NEQ "">
					<a href="<cfif href NEQ "">#href#<cfelse>javascript:void(0);</cfif>" title="#hreflabel#">
						<img alt="" src="/mirza-in-progress/upload/img/#image#" >
					</a>
				<cfelse>
					<img alt="" src="/mirza-in-progress/upload/img/#image#" >
				</cfif>
				<strong>#titel#</strong><br/>
				<div>#fliesstext#</div>
				<figcaption>
					<a class="arrow" href="<cfif href NEQ "">#href#<cfelse>javascript:void(0);</cfif>" title="#hreflabel#">#titel#</a>	
				</figcaption>
			</figure>
		</cfoutput>
	</cfloop>
</section>