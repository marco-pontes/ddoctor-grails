	<div id="page_wrapper">
		<div id="page-header">
			<div id="page-header-wrapper">
				<div id="top">
					<a href="dashboard.php" class="logo" title="Admintasia V2.0">Admintasia V2.0</a>
					<div class="welcome">
<%--						<span class="note"><g:message code="welcome.message"/> <a href="#" title="Welcome, Horia Simon">${usuario.nome}</a></span>--%>
<%--						<a class="btn ui-state-default ui-corner-all" href="#">--%>
<%--							<span class="ui-icon ui-icon-wrench"></span>--%>
<%--							<g:message code="botao.settings.label"/>--%>
<%--						</a>--%>
<%--						<a class="btn ui-state-default ui-corner-all" href="#">--%>
<%--							<span class="ui-icon ui-icon-person"></span>--%>
<%--							My account--%>
<%--						</a>--%>
						<g:link class="btn ui-state-default ui-corner-all" controller="logout">
							<span class="ui-icon ui-icon-power"></span>
							<g:message code="botao.logout.label"/>
						</g:link>						
					</div>
				</div>
				<ul id="navigation">
					<li>
						<g:link controller="dashboard" action="index" class="sf-with-ul"><g:message code="menu.dashboard.label"/></g:link>
					</li>
					<li>
						<g:link controller="medico" action="listar" class="sf-with-ul"><g:message code="menu.medico.label"/></g:link>
<%--						<ul>--%>
<%--							<li>--%>
<%--								<a href="#" class="sf-with-ul">Menu item 1</a>--%>
<%--								<ul>--%>
<%--									<li><a href="#">Subitem 1</a></li>--%>
<%--									<li><a href="#">Subitem 2</a></li>--%>
<%--								</ul>--%>
<%--							</li>--%>
<%--							<li>--%>
<%--								<a href="#">Menu item 2</a>--%>
<%--							</li>--%>
<%--							<li>--%>
<%--								<a href="#">Menu item 3</a>--%>
<%--							</li>--%>
<%--							<li>--%>
<%--								<a href="#" class="sf-with-ul">Menu item 4</a>--%>
<%--								<ul>--%>
<%--									<li><a href="#">Subitem 1</a></li>--%>
<%--									<li>--%>
<%--										<a href="#" class="sf-with-ul">Subitem 2</a>--%>
<%--										<ul>--%>
<%--											<li><a href="#">Subitem 1</a></li>--%>
<%--											<li>--%>
<%--												<a href="#" class="sf-with-ul">Subitem 2</a>--%>
<%--												<ul>--%>
<%--													<li><a href="#">Subitem 1</a></li>--%>
<%--													<li>--%>
<%--														<a href="#">Subitem 2</a>--%>
<%--													</li>--%>
<%--												</ul>--%>
<%--											</li>--%>
<%--										</ul>--%>
<%--									</li>--%>
<%--								</ul>--%>
<%--							</li>--%>
<%--							<li>--%>
<%--								<a href="#" class="sf-with-ul">Menu item 5</a>--%>
<%--								<ul>--%>
<%--									<li><a href="#">Subitem 1</a></li>--%>
<%--									<li><a href="#">Subitem 2</a></li>--%>
<%--								</ul>--%>
<%--							</li>--%>
<%--							<li>--%>
<%--								<a href="#">Menu item 6</a>--%>
<%--							</li>--%>
<%--							<li>--%>
<%--								<a href="#">Menu item 7</a>--%>
<%--							</li>--%>
<%--						</ul>--%>
					</li>
					<g:if test="${perfil == 'ROLE_ATENDENTE' || perfil == 'ROLE_MEDICO'}">
						<li>
							<g:link controller="paciente" action="listar" class="sf-with-ul"><g:message code="menu.paciente.label"/></g:link>
						</li>
					</g:if>
<%--					<g:if test="${perfil == 'ROLE_MEDICO'}">--%>
<%--						<li>--%>
<%--							<g:link controller="agenda" action="mostrar" id="${usuario.agenda.id}" class="sf-with-ul"><g:message code="menu.agenda.label"/></g:link>--%>
<%--						</li>--%>
<%--					</g:if>--%>
					<g:if test="${perfil == 'ROLE_ATENDENTE'}">
						<li>
							<g:link controller="atendimento" action="listar" class="sf-with-ul">
								<g:message code="menu.atendimentos.label"/>
							</g:link>
						</li>
						<li>
							<g:link class="sf-with-ul" controller="tarefa" action="listar">
								<g:message code="menu.tarefas.label"/>
							</g:link>
						</li>
					</g:if>
<%--					<li><a href="gallery.php">Photo Gallery</a></li>--%>
<%--					<li>--%>
<%--						<a href="#" class="sf-with-ul">Layout Options</a>--%>
<%--						<ul>--%>
<%--							<li>--%>
<%--								<a href="three-columns-layout.php">Three columns</a>--%>
<%--							</li>--%>
<%--							<li>--%>
<%--								<a href="two-column-layout.php">Two columns</a>--%>
<%--							</li>--%>
<%--							<li>--%>
<%--								<a href="no-rounded.php">No rounded corners</a>--%>
<%--							</li>--%>
<%--							<li>--%>
<%--								<a href="content_boxes.php">Available content boxes</a>--%>
<%--							</li>--%>
<%--						</ul>--%>
<%--					</li>--%>
<%--					<li>--%>
<%--						<a href="#" class="sf-with-ul">Theme Options</a>--%>
<%--						<ul>--%>
<%--							<li>--%>
<%--								<a href="page_left_sidebar.php">Page with left sidebar</a>--%>
<%--							</li>--%>
<%--							<li>--%>
<%--								<a href="page_dynamic_sidebar.php">Page with dynamic sidebar</a>--%>
<%--							</li>--%>
<%--							<li>--%>
<%--								<a href="#">Avaiable Themes</a>--%>
<%--								<ul id="style-switcher">--%>
<%--									<li>--%>
<%--										<a class="set_theme" id="black_rose" href="#" title="Black Rose Theme">Black Rose Theme</a>--%>
<%--									</li>--%>
<%--									<li>--%>
<%--										<a class="set_theme" id="gray_standard" href="#" title="Gray Standard Theme">Gray Standard Theme</a>--%>
<%--									</li>--%>
<%--									<li>--%>
<%--										<a class="set_theme" id="gray_lightness" href="#" title="Gray Lightness Theme">Gray Lightness Theme</a>--%>
<%--									</li>--%>
<%--									<li>--%>
<%--										<a class="set_theme" id="apple_pie" href="#" title="Apple Pie Theme">Apple Pie Theme</a>--%>
<%--									</li>--%>
<%--									<li>--%>
<%--										<a class="set_theme" id="blueberry" href="#" title="Blueberry Theme">Blueberry Theme</a>--%>
<%--									</li>--%>
<%--								</ul>--%>
<%--							</li>--%>
<%--							<li>--%>
<%--								<a href="#"><i>Dummy Link</i></a>--%>
<%--							</li>--%>
<%--						</ul>--%>
<%--					</li>--%>
<%--					<li>--%>
<%--						<a href="#" class="sf-with-ul">Widgets</a>--%>
<%--						<ul>--%>
<%--							<li><a href="accordion.php">Accordion</a></li>--%>
<%--							<li><a href="flexigrid.php"><b>FlexiGrid</b></a></li>--%>
<%--							<li><a href="editinplace.php"><b>Edit in Place</b></a></li>--%>
<%--							<li><a href="tinymce.php"><b>WYSIWYG Editor</b></a></li>--%>
<%--							<li><a href="charts.php"><b>Charts</b></a></li>--%>
<%--							<li><a href="tabs.php">Tabs</a></li>--%>
<%--							<li><a href="slider.php">Slider</a></li>--%>
<%--							<li><a href="datepicker.php">Datepicker</a></li>--%>
<%--							<li><a href="progress.php">Progress Bar</a></li>--%>
<%--							<li><a href="dialog.php">Dialogs and Modals</a></li>--%>
<%--							<li><a href="overlays.php">Overlays</a></li>--%>
<%--							<li><a href="photo_manager.php">Photo Manager</a></li>--%>
<%--							<li><a href="file_browser.php">File Browser</a></li>--%>
<%--						</ul>--%>
<%--					</li>--%>
				</ul>
				<div id="search-bar">
					<form method="post" action="http://www.google.com/">
						<input type="text" name="q" value="live search demo" />
					</form>
				</div>
			</div>
		</div>