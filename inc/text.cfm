<!--- get normal CMS TExt --->
<cfoutput query="getcontent">
	<div class="textbox">
		<h2 class="h2">#titel#</h2>	
		<h3 class="h3">#lead#</h3>
		<div class="col-md-6 col-lg-6">
			<p>#fliesstext#</p>	
		</div>
	</div>
	<div class="col-md-6">
       <cfif bildname NEQ "">
			<figure class="">
				<img src="/#session.serverpath#/upload/img/#bildname#" alt="#bildname#" class="img-fluid" >
				<caption>img-caption lookup</caption>
			</figure> 
		</cfif>
    </div>
</cfoutput>