<cfprocessingdirective pageencoding="utf-8" />


<cfquery name="getAlbumWithImages" datasource="#application.dsn#">
SELECT A.id as albumid, A.Albumtitle,A.albumdescription,I.*
FROM	albums A LEFT JOIN albumimages I ON I.albumID = A.id
WHERE A.id = <cfif isdefined("getActivePage.albumid")>#getActivePage.albumid#<cfelse>#albumid#</cfif>
</cfquery>
	<script >
		(function() { 
			Galleria.run('.galleria');

			Galleria.configure({
				transition: 'fadeslide',
				transitionSpeed: 800,
				autoplay: 3000,
				carouselSpeed: 1500,
				preload: true,
				imageCrop: true,
				height: 600,
				showInfo: true,
				trueFullscreen: true,
				easing: 'galleriaOut'
			});
		}());
	</script>

<cfif getAlbumWithImages.imagePath NEQ "">

	<cfoutput query="getAlbumWithImages" group="albumid">
	<cfif albumtitle NEQ "">
		<h3>#albumtitle#</h3>
	</cfif>

	<!---<cfdump var="#albumid#" ></cfdump>--->
	<cfif isdefined("getActivePage.albumid")>
		<cfset albumtype = getActivePage.albumtype />
	<cfelse>
		<cfset albumtype = getContent.albumtype />
	</cfif>
	<!--- hier der template switch zwischen thumbnail-liste und vollem album --->
	<!--- thumbnail-liste --->
	<cfif albumtype EQ 1>
		<cfoutput>
		<img src="/#session.serverpath#/upload/galleries/#imagePath#" alt="hoi">

		</cfoutput>
		<div class="yoxview">
		<cfoutput>
			<cfimage source="#expandPath('/' & session.serverpath & '/upload/galleries/' & imageThumbPath)#" name="myImage"> 
			<cfset bildbreite = ImageGetWidth(myImage) />
			<cfset bildhoehe = ImageGetHeight(myImage) />

			<cfset bildformat = "" />
			<cfif bildbreite GT bildhoehe>
				<cfset bildformat = "quer" />
			<cfelse>
				<cfset bildformat = "hoch" />
			</cfif>

			<div style="height:80px;width:80px;background-color:##e1e1e1;overflow:hidden;float:left;margin-right:1.5em;text-align:center;">
				<a href="/#session.serverpath#/upload/galleries/#imagePath#"><img src="/#session.serverpath#/upload/galleries/#imageThumbPath#" alt="#imageTitle#"  title="#imageCaption#" class="thumbBox" <cfif bildformat EQ "hoch">style="height:80px;"<cfelse>style="width:80px;"</cfif> /></a>
			</div>
		</cfoutput>
		<div style="clear:both;"></div>
		</div>
	<!--- Galleria album --->
	<cfelse>
		<div class="gallery-container">
			<div class="galleria" >
				<cfoutput>
					<img src="/#session.serverpath#/upload/galleries/#imagePath#" 
						 alt="#imageTitle#"
						 data-title="#imageTitle#" 
						 data-description="#imageCaption#"
						 >

				</cfoutput>
			</div>
		</div>
		<br/>
		<cfif albumdescription NEQ "">
			<h4>#albumdescription#</h4>
		</cfif>

	</cfif>	
	<br/>

	</cfoutput>

</cfif>


    
   
