<cfoutput query="getcontent">
		<cfinclude template="sidebars.cfm">

	<article class="content">
		<header>
			<!--- Print a Title --->	
			<cfif titel NEQ "">
				content template 2
				<h1 class="h2 supertitle">#titel#</h1>
			</cfif>
			
			<!---  PRint the lead --->
			<cfif lead NEQ "">
				 	<h2 class="h3">#lead#</h2>
			<cfelse>
				
			</cfif>
		</header>
		<div class="row">
			<div class="col-sm-12 col-md-6 col-lg-6">
				<!--- Print out Fliesstext --->
				<cfif fliesstext NEQ "" AND fliesstext NEQ "<br>">
						<section class="content-text">#fliesstext#</section>
				</cfif>
				<cfif href NEQ "">
					<br/>
					<a href="#href#" target="_blank">
						#hreflabel#
					</a>
				</cfif>
				<!--- doc link --->
				<cfif doc NEQ "">			
					<a href="/#session.serverpath#/upload/doc/#doc#" target="_blank">
						Pdf: #doclabel#
					</a>
				</cfif> 
			</div>
			<div class="col-sm-12 col-md-6 col-lg-6">
				<!--- Show Content Image --->
				 <cfif bildname NEQ "">
					<figure class="content-image">
						<img src="/#session.serverpath#/upload/img/#bildname#" alt="alt tag" class="img-fluid" >
						<div class="content-caption"><caption >#IMAGECAPTION#</caption></div>
					</figure> 
				</cfif>
			</div>
		</div>
		<cfif HASCONTACT EQ 1>
			<cfinclude template="contactform.cfm">
		<cfelse>
		<!---	kronen special--->
		<cfif PAGEID EQ 362	>
			<cfinclude template="custom/content_crown.cfm" >	
		</cfif>
		<!---bridge special --->
		<cfif PAGEID EQ 363 >
			<cfinclude template="custom/content_bridge.cfm" >	
		</cfif>
		<!---content protheses--->
		<cfif PAGEID EQ 364>
			<cfinclude template="custom/content_protheses.cfm">	
		</cfif>
		
			
	<!---<cfdump var="#getcontent#">--->
		 
	</article>
	</cfif> 
	<!--- include gallery, if there is one --->
	<cfif albumid NEQ 0>
		<cfinclude template="gallery.cfm">
	</cfif>
	<!---<cfinclude template="news.cfm" />--->
</cfoutput>