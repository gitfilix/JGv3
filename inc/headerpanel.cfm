<cfif pageProperties.headerbild NEQ "" OR getHeaderPanels.recordcount GT 0>
<div>
	<cfif pageProperties.headerbild NEQ "">
		<cfoutput><img src="/#session.serverpath#/upload/img/#pageProperties.headerbild#" alt="" /></cfoutput>
	<cfelse>
		 <div class="flexslider">
		     <div class="slides">
			  	<cfoutput query="getHeaderPanels">
			  <div class="slide">
			  	<img src="/#session.serverpath#/upload/img/headerpanel/#image#" alt="gasser zahntechnik: #TITEL#" />
			   	<div class="headerpannelbox">
					<h3>#TITEL#</h3>
					<div class="slidertext">#FLIESSTEXT#</div>
					<div class="button">
						<a href="#HREF#">#HREFLABEL#</a>
					</div>
				</div>
			  </div>
			</cfoutput>
		  </div>
		</div>
	</cfif>
</div>
</cfif>
