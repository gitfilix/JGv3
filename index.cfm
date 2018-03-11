<cfprocessingdirective pageencoding="UTF-8" />
<!--- Template loader for MANDANT: --->
<!--- check for own domain --->
<cfquery name="getDomain" datasource="#application.dsn#">
SELECT 	* 
FROM 	mandantensprachen
WHERE 	mandant = #session.mandant# AND domain != ''
</cfquery>

<cfset ownDomain = "" />
<cfif getDomain.recordcount GT 0>
	<cfset ownDomain = getDomain.domain />
</cfif>

<cfif ownDomain NEQ "">
	<cfset xpath = cgi.PATH_INFO />
	<cfif xpath EQ "/#session.serverpath#/index.cfm" OR xpath EQ "/#session.serverpath#/ch-de" OR xpath EQ "/#session.serverpath#/ch-de/">
		<cflocation url="http://#cgi.SERVER_NAME#" addtoken="no" />
	</cfif>
</cfif>

<!--- get service-nav oberstes level --->
<cfquery name="getServiceNav" datasource="#application.dsn#">
SELECT * FROM pages
WHERE navpos = 0 AND parentid = 0 AND isactive = 1 AND mandant = #session.mandant# AND lang = '#session.lang#'
ORDER	BY navorder
</cfquery>
<!--- get themen-nav oberstes level --->
<cfquery name="getThemenNav" datasource="#application.dsn#">
SELECT 	* FROM pages
WHERE 	navpos = 1 AND parentid = 0 AND isactive = 1  AND mandant = #session.mandant# AND lang = '#session.lang#'
ORDER	BY navorder
</cfquery>
<!--- get subnav 2. level --->
<cfquery name="getsubnav" datasource="#application.dsn#">
SELECT 	* FROM pages
WHERE 	parentid = #listFirst(session.navtree)# AND isactive = 1 
ORDER	BY navorder
</cfquery>
<!--- get FOOTER-nav oberstes level --->
<cfquery name="getFooterNav" datasource="#application.dsn#">
SELECT * FROM pages
WHERE 	navpos = 2
		AND parentid = 0 
		AND isactive = 1 
		AND mandant =#session.mandant#
		AND lang ="#session.lang#"
ORDER 	BY navorder
</cfquery>
<!--- get inhalte --->
<cfquery name="getcontent" datasource="#application.dsn#">
SELECT 	* FROM content
WHERE 	pageid = #url.id# AND isactive = 1
ORDER	BY reihenfolge
</cfquery>
<!--- get actual page properties --->
<cfquery name="pageProperties" datasource="#application.dsn#">
SELECT * FROM pages
WHERE id = #url.id# AND isactive = 1 
</cfquery>
<!--- get actual sidebars --->
<cfquery name="getSidebarElems" datasource="#application.dsn#">
SELECT 	S.* 
FROM 	sidebar2pages P LEFT JOIN sidebar S ON P.sidebarid = S.id
WHERE 	P.pageid = #url.id# AND S.isactive = 1 AND S.teaserposition = 1
ORDER	BY P.reihenfolge 
</cfquery>
<!--- get teasers --->
<cfquery name="getTeasers" datasource="#application.dsn#">
SELECT 	S.* 
FROM 	teaser2pages P LEFT JOIN sidebar S ON P.sidebarid = S.id
WHERE 	P.pageid = #url.id# AND S.isactive = 1 AND S.teaserposition = 2
ORDER	BY P.reihenfolge 
</cfquery>
<!--- get all News from Mandant --->

<cfquery name="getnews" datasource="#application.dsn#">
SELECT 	* 
FROM 	news
WHERE 	mandant = #session.mandant# AND 
		isactive = 1
</cfquery>
<!--- get actual headerpanel --->
<cfquery name="getHeaderPanels" datasource="#application.dsn#">
SELECT 	S.* 
FROM 	headerpanels2pages H LEFT JOIN headerpanels S ON H.headerpanelID = S.id
WHERE 	H.pageid = #url.id# AND S.isactive = 1
ORDER	BY H.reihenfolge 
</cfquery>
<!--- getAllLinkedContentsFromCalledContentid --->
<cfquery name="getAllLinkedContentsFromPage" datasource="#application.dsn#">
SELECT 	linkedContentID,mainContentID
FROM 	contents2content
WHERE 	mainContentID IN (SELECT id FROM content WHERE pageid = #url.id#)
</cfquery>

<!--- Get active Footer from current Mandant-ID  --->
<cfquery name="getFooter" datasource="#application.dsn#">
SELECT 	*
FROM	footer
WHERE	mandant = #session.mandant#
		AND isactive = 1
</cfquery>
<!DOCTYPE html>

<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->

<html lang="de"> 

<head>
	<meta charset="UTF-8">
	<!-- Remove this line if you use the .htaccess -->
	<!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<!--	<meta name="robots" content="index,follow">-->
<!--	<meta name="revisit-after" content="30 days">	-->
	<!--- push meta-tags dynamicly into html-head section --->
	<cfoutput>
	<cfhtmlhead text='
	<meta name="description" content="#pageProperties.metaDesc#">
	<meta name="keywords" content="#pageProperties.metaKeys#">
	<title>Gasser Zahntechnik #pageProperties.metaTitel# | Dentallabor Winterthur</title>
	' />		
	</cfoutput>

	<!--- 3. CHANGE FAVICON HERE --->
	<link rel="shortcut icon" type="image/x-icon" href="/dentaltechnik/favicon.ico">
	<link rel="shortcut icon" type="image/png" href="/dentaltechnik/gasser_favicon.png">
	
	<!--- 4. INCLUDE external styles --->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"  />
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Exo+2:200%7CJulius+Sans+One%7CRajdhani" />

	<cfoutput>
	<link rel="stylesheet" href="/#session.serverpath#/js/FlexSlider/flexslider.css" type="text/css" />
	<link rel="stylesheet" href="/#session.serverpath#/js/galleria/themes/classic/galleria.classic.min.css" />
	<link rel="stylesheet" href="/#session.serverpath#/css/jgv3styles.css"  />
	<link rel="stylesheet" href="/#session.serverpath#/css/mq-jgv3-styles.css"  />
<!---		not minified --->
	<!--- Javascript - jQuery --->
	<script src="http://code.jquery.com/jquery.min.js"></script>

	<script>window.jQuery || document.write('<//script src="js/jquery-1.7.2.min.js"><\/script>')</script>
	<script src="/#session.serverpath#/js/galleria/galleria-1.5.7.js"></script>
	<script src="/#session.serverpath#/js/galleria/themes/classic/galleria.classic.min.js"></script>	
	</cfoutput>
	<!---[if lt IE 9]>
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]--->
	
</head>
<body>
<!--- Prompt IE 7 users to install Chrome Frame --->
<!--[if lt IE 8]><p class=chromeframe>Your browser is <em>ancient!</em> <a href="http://browsehappy.com/">Upgrade to a different browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to experience this site.</p><![endif]-->

	<!---load template 1 to 3--->
	<cfoutput>
	<!---<cfdump var="#pageProperties#"></cfdump>--->
	<cfinclude template="inc/template#pageProperties.template#.cfm" />
	
	</cfoutput>
			
	<!--tether for bootstrap	-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" 
			integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" 
			crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" ></script>
	<cfoutput>	
		<script src="/#session.serverpath#/js/jquery.flexslider-min.js"></script>
		<script src="/#session.serverpath#/js/scripts.js"></script>
	</cfoutput>

	<!--- Global site tag (gtag.js) - Google Analytics --->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-38956798-1"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'UA-38956798-1');
	</script>

	</body>
</html>