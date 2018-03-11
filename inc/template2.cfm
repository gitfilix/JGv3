<cfprocessingdirective pageencoding="utf-8" />
<div class="global">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12 col-md-12 col-lg-12">
				<cfinclude template="servicenav.cfm">
			</div>
		</div>	
        <div class="row">
            <div class="col-md-2 col-lg-2 col-sm-2">
               <cfinclude template="logo.cfm" />			
            </div>
            <div class="col-md-10 col-lg-10 col-sm-10">
            	<cfinclude template="themennav.cfm" />
            </div>
        </div>
		<div class="row">
            <div class="col-md-2 col-lg-2 col-sm-2">
            </div>
            <div class="col-sm-10 col-md-10 col-lg-10">
            	<cfinclude template="subnav.cfm" />
            </div>
        </div>
        
		<div class="row">
          <div class="col-sm-12 col-md-12 col-lg-12">
        	   <cfinclude template="headerpanel.cfm" />
		   </div>
        </div>
        <div class="row spacerow"></div>

        <div class="row">
            <div class="col-sm-0 col-md-1 col-lg-2">
				&nbsp;
            </div>
            <div class="col-sm-12 col-md-8 col-lg-10">
               <cfinclude template="content_template_2.cfm" >
            </div>
            <div class="col-sm-0 col-md-1 col-lg-2">
               &nbsp;
            </div>
        </div>
		<!--footer starts here-->
		<div class="row">
            <div class="col-sm-0 col-md-12 col-lg-12" >
                <footer class="footer">
                   <cfinclude template="footer.cfm">
                </footer>
            </div>
        </div>
	<!--global wrapper-->
	</div>
</div>
<!---<cfdump var="#getnews#"></cfdump>--->