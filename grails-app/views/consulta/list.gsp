
<%@ page import="ddoctor.Consulta" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'consulta.label', default: 'Consulta')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
		<r:require module="consulta_list" />
		<r:script type="text/javascript">
			$(document).ready(function() {
				/* Table Sorter */
				$("#sort-table")
				.tablesorter({
					widgets: ['zebra'],
					headers: { 
					            // assign the secound column (we start counting zero) 
					            0: { 
					                // disable it by setting the property sorter to false 
					                sorter: false 
					            }, 
					            // assign the third column (we start counting zero) 
					            6: { 
					                // disable it by setting the property sorter to false 
					                sorter: false 
					            } 
					        } 
				})
				
				.tablesorterPager({container: $("#pager")}); 
				
				$(".header").append('<span class="ui-icon ui-icon-carat-2-n-s"></span>');
			
				
			});
			
			 	/* Check all table rows */
			
			var checkflag = "false";
			function check(field) {
				if (checkflag == "false") {
					for (i = 0; i < field.length; i++) {
						field[i].checked = true;
					}
					checkflag = "true";
					return "check_all"; 
				}
				else {
					for (i = 0; i < field.length; i++) {
						field[i].checked = false; 
					}
					checkflag = "false";
					return "check_none";
				}
			}
		</r:script>        
    </head>
    <body>
    
    
    	<div id="sub-nav">
			<div class="page-title">
				<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				<span><a href="#" title="Layout Options">Layout Options</a> > <a href="#" title="Two column layout">Two column layout</a> > This is a breadcrumb example</span>
			</div>
			<g:render template="/dashboard/top_buttons" />
		</div>
		<div id="page-layout">
			<div id="page-content">
				<div id="page-content-wrapper">
					<div class="inner-page-title">
	          			<h2>Welcome to Admintasia 2.1 Live Demonstration</h2>
						<span>You can start building your next user interface with this powerful UI framework !</span>
					</div>
					<div class="clear"></div>
					<div class="content-box">
					
				 		<div class="clearfix"></div>
						<g:link class="btn ui-state-default ui-corner-all" controller="dashboard" action="index">
							<span class="ui-icon ui-icon-grip-dotted-horizontal"></span>
							<g:message code="default.home.label"/>
						</g:link>
						<g:link class="btn ui-state-default ui-corner-all" action="create">
							<span class="ui-icon ui-icon-grip-dotted-horizontal"></span>
							<g:message code="default.new.label" args="[entityName]" />
						</g:link>
						<div class="clearfix"></div>  						
						
			            <g:if test="${flash.message}">
			            	<div class="response-msg inf ui-corner-all">
								<span><g:message code="info.box.label" /></span>
								${flash.message}
							</div>
			            </g:if>
            
						<div class="hastable">
							<form name="myform" class="pager-form" method="post" action="">
								<table id="sort-table"> 
									<thead> 
									<tr>
										<th><input type="checkbox" value="check_none" onclick="this.value=check(this.form.list)" class="submit"/></th>
										
			                            <g:sortableColumn property="id" title="${message(code: 'consulta.id.label', default: 'Id')}" />
			                        
			                            <th><g:message code="consulta.entrevistaMedica.label" default="Entrevista Medica" /></th>
			                        
			                            <g:sortableColumn property="confirmada" title="${message(code: 'consulta.status.label', default: 'Confirmada')}" />
			                        
			                            <g:sortableColumn property="data" title="${message(code: 'consulta.data.label', default: 'Data')}" />
			                        
			                            <th><g:message code="consulta.medico.label" default="Medico" /></th>
			                        
			                            <th><g:message code="consulta.paciente.label" default="Paciente" /></th>
			                        
			                        
										<th style="width:128px">Options</th> 
									</tr> 
									</thead> 
									<tbody>
										<g:each in="${consultaInstanciaList}" status="i" var="consultaInstancia"> 
											<tr>
												<td class="center"><input type="checkbox" value="1" name="list" class="checkbox"/></td> 
						                        
						                            <td><g:link action="show" id="${consultaInstancia.id}">${fieldValue(bean: consultaInstancia, field: "id")}</g:link></td>
						                        
						                            <td>${fieldValue(bean: consultaInstancia, field: "entrevistaMedica")}</td>
						                        
						                            <td>${consultaInstancia.status}</td>
						                        
						                            <td><g:formatDate date="${consultaInstancia.data}" /></td>
						                        
						                            <td>${fieldValue(bean: consultaInstancia, field: "medico")}</td>
						                        
						                            <td>${fieldValue(bean: consultaInstancia, field: "paciente")}</td>
						                        
						                    	<td>
													<a class="btn_no_text btn ui-state-default ui-corner-all tooltip" title="Edit this example" href="#">
														<span class="ui-icon ui-icon-wrench"></span>
													</a>
													<a class="btn_no_text btn ui-state-default ui-corner-all tooltip" title="Favourite this example" href="#">
														<span class="ui-icon ui-icon-heart"></span>
													</a>
													<a class="btn_no_text btn ui-state-default ui-corner-all tooltip" title="Add to shopping card example" href="#">
														<span class="ui-icon ui-icon-cart"></span>
													</a>
													<a class="btn_no_text btn ui-state-default ui-corner-all tooltip" title="Delete this example" href="#">
														<span class="ui-icon ui-icon-circle-close"></span>
													</a>
												</td>
											</tr>
										</g:each> 
									</tbody>
								</table>
								<div id="pager">
							
										<a class="btn_no_text btn ui-state-default ui-corner-all first" title="First Page" href="#">
											<span class="ui-icon ui-icon-arrowthickstop-1-w"></span>
										</a>
										<a class="btn_no_text btn ui-state-default ui-corner-all prev" title="Previous Page" href="#">
											<span class="ui-icon ui-icon-circle-arrow-w"></span>
										</a>
									
										<input type="text" class="pagedisplay"/>
										<a class="btn_no_text btn ui-state-default ui-corner-all next" title="Next Page" href="#">
											<span class="ui-icon ui-icon-circle-arrow-e"></span>
										</a>
										<a class="btn_no_text btn ui-state-default ui-corner-all last" title="Last Page" href="#">
											<span class="ui-icon ui-icon-arrowthickstop-1-e"></span>
										</a>
										<select class="pagesize">
											<option value="10" selected="selected">10 results</option>
											<option value="20">20 results</option>
											<option value="30">30 results</option>
											<option value="40">40 results</option>
										</select>								
								</div>
							</form>
							<div class="clear"></div>
							<i class="note">Sort multiple columns simultaneously by holding down the shift key and clicking a second, third or even fourth column header!</i>											
        				</div>
        			</div>
        		</div>
        	</div>
        </div>
    </body>
</html>
