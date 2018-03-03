<cfoutput query="getcontent">
		<cfinclude template="sidebars.cfm">
	<article class="content">
		<header>
			<!--- Print a Title --->	
			<cfif titel NEQ "">
				<h1 class="h2 supertitle">#titel#</h1>
			</cfif>		
			<!---  PRint the lead --->
			<cfif lead NEQ "">
				 	<h2 class="h3">#lead#</h2>
			<cfelse>
				
			</cfif>
		</header>
		<div class="row">
			<div class="col-sm-12 col-md-5 col-lg-5">
				<!--- Print out Fliesstext --->
				<cfif fliesstext NEQ "" AND fliesstext NEQ "<br>">
						<section class="content-text">#fliesstext#</section>
				</cfif>
				<cfif href NEQ "">
					<div class="content_link" >
						<a class="content_link" href="#href#" target="_blank">
							#hreflabel#
						</a>
					</div>
				</cfif>
				<!--- doc link --->
				<cfif doc NEQ "">
					<div class="content_link_pdf">
						<img src="/#session.serverpath#/img/pdf_iconsmall.png" alt="pdf-icon">
						<a href="/#session.serverpath#/upload/doc/#doc#" target="_blank">
							Pdf: #doclabel#
						</a>
					</div>
				</cfif> 
			</div>
			<div class="col-sm-12 col-md-7 col-lg-7">
				<!--- Show Content Image --->
				 <cfif bildname NEQ "">
					<figure class="content-image">
						<img src="/#session.serverpath#/upload/img/#bildname#" alt="#bildname#" class="img-fluid" >
						<div class="content-caption"><caption >#IMAGECAPTION#</caption></div>
					</figure> 
				</cfif>
			</div>
		</div>
		<cfif HASCONTACT EQ 1>
			<cfinclude template="contactform.cfm">
		<cfelse>
	<!---<cfdump var="#getcontent#">--->
	</article>
	</cfif> 
	<!--- include gallery, if there is one --->
	<cfif albumid NEQ 0>
		<cfinclude template="gallery.cfm">
	</cfif>
	<!---<cfinclude template="news.cfm" />--->
</cfoutput>