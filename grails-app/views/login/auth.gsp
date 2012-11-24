<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" xml:lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Login</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<r:require modules="login"/>
	<r:layoutResources />
	<r:script type="text/javascript">
		$(document).ready(function() {
			// Tabs
			//$('#tabs, #tabs2, #tabs5').tabs();
			$('#tabs').tabs();
		});
	</r:script>
</head>
<body>
	<div id="page_wrapper">
		<div id="page-header">
			<div id="page-header-wrapper">
				<div id="top">
					<a href="#" class="logo" title="Admintasia V2.0">Admintasia V2.0</a>
					<div class="welcome">
<%--						<span class="note">Welcome, <a href="#" title="Welcome, Horia Simon">Horia Simon</a></span>--%>
<%--						<a class="btn ui-state-default ui-corner-all" href="#">--%>
<%--							<span class="ui-icon ui-icon-wrench"></span>--%>
<%--							Settings--%>
<%--						</a>--%>
<%--						<a class="btn ui-state-default ui-corner-all" href="#">--%>
<%--							<span class="ui-icon ui-icon-person"></span>--%>
<%--							My account--%>
<%--						</a>--%>
<%--						<a class="btn ui-state-default ui-corner-all" href="#">--%>
<%--							<span class="ui-icon ui-icon-power"></span>--%>
<%--							Logout--%>
<%--						</a>						--%>
					</div>
				</div>
			</div>
		</div>
		<div id="sub-nav">
			<div class="page-title">
				<h1><g:message code="login.area.title" /> </h1>
				<span><g:message code="login.area.message" /></span>
			</div>
		</div>
		<div class="clear"></div>
		<div id="page-layout">
			<div id="page-content">
				<div id="page-content-wrapper">

				<div id="tabs">
					<ul>

						<li><a href="#login"><g:message code="login.info.tab"/> </a></li>
<%--						<li><a href="#tabs-2">Register</a></li>--%>
<%--						<li><a href="#tabs-3">Recover password</a></li>--%>
					</ul>
					<div id="login">
			            <g:if test="${flash.message}">
			            	<div class="response-msg error ui-corner-all">
								<span><g:message code="error.box.label" /></span>
								${flash.message}
							</div>
			            </g:if>
						<form action='${postUrl}' method='POST' autocomplete='off' >
							<ul>
								<li>
									<label for="email" class="desc">
				
										<g:message code="login.label" />:
									</label>
									<div>
										<input type="text" tabindex="1" maxlength="255" value="" class="field text full" name='j_username' id='username' />
									</div>
								</li>
								<li>
									<label for="password" class="desc">
										<g:message code="password.label" />:
									</label>
				
									<div>
										<input type="password" tabindex="1" maxlength="255" value="" class="field text full" name="j_password" id="password" />
									</div>
								</li>
								<li class="buttons">
									<div>
										<button class="ui-state-default ui-corner-all float-right ui-button" type="submit"><g:message code="dashboard.button.label"/> </button>
									</div>
								</li>
							</ul>
						</form>
					</div>
<%--					<div id="tabs-2">--%>
<%--						<div class="other-box gray-box ui-corner-all">--%>
<%--							<div class="cont ui-corner-all tooltip" title="Example tooltip!">--%>
<%--								<h3>Example information message</h3>--%>
<%--								<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</p>--%>
<%--							</div>--%>
<%--						</div>--%>
<%--						<p>You can put a register form here.</p>--%>
<%--					</div>--%>
<%--					<div id="tabs-3">--%>
<%--						<form action="dashboard.php">--%>
<%--							<ul>--%>
<%--								<li>--%>
<%--									<label for="email" class="desc">--%>
<%--										Registered Email:--%>
<%--									</label>--%>
<%--									<div>--%>
<%--										<input type="text" tabindex="1" maxlength="255" value="" class="field text full" name="email" id="email" />--%>
<%--									</div>--%>
<%--								</li>--%>
<%--								<li class="buttons">--%>
<%--									<div>--%>
<%--										<button class="ui-state-default ui-corner-all float-right ui-button" type="submit">Send new password</button>--%>
<%--									</div>--%>
<%--								</li>--%>
<%--							</ul>--%>
<%--						</form>--%>
<%--					</div>--%>
				</div>

				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<r:layoutResources />
</body>
</html>
