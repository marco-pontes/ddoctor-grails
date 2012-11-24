import grails.util.BuildScope
//Variável que indica o escopo do script, para saber quais plugins carregar e empacotar. #scriptScope
scriptScope = BuildScope.WAR

includeTargets << grailsScript("_GrailsTest")
includeTargets << grailsScript("_GrailsWar")
includeTargets << grailsScript("_GrailsPackage")

target(configuraBuild: "Cria as configurações do build e seta parâmetros da linha de comando") {
	createConfig()
//	println "[${grailsAppName}] Criando ${config.deploy.temp}/${grailsEnv}/ e ${config.deploy.backup.dir}..."
//	event ("CriaDiretorio", ["[${grailsAppName}] Criando ${config.deploy.temp}/${grailsEnv}/ e ${config.deploy.backup.dir}..."])
	if(config.deploy.tests) {
		//Variável que indica quais tipos de testes executar. #phasesToRun
		phasesToRun = config.deploy.tests
		allTests()
		if(getFailedTests()){
			event "FalhaTestes", ["[${grailsAppName}] Falha nos testes."]
			grailsConsole.error "[${grailsAppName}] Falha nos testes."
			ant.fail("Build e deploy cancelados.")
			exit 1
		}
	}
	//Verifica se a keyfile vem de um parâmetro de linha de comando. "grails deploy --keyfile=caminho"
	if (argsMap."keyfile"){
		config.deploy.keyfile = argsMap."keyfile"
	}
}

target(criaDiretorios: "Cria o diretório de backup e o diretório temporario de deploy") {
	depends(configuraBuild)
	grailsConsole.updateStatus "[${grailsAppName}] Criando ${config.deploy.temp}/${grailsEnv}/ e ${config.deploy.backup.dir}..."
	event ("CriaDiretorio", ["[${grailsAppName}] Criando ${config.deploy.temp}/${grailsEnv}/ e ${config.deploy.backup.dir}..."])
	ant.sshexec(host:"${config.deploy.host}",
		username:"${config.deploy.user}",
		trust:"true",
		port:"${config.deploy.port}",
		command:"sudo mkdir -p ${config.deploy.temp}/${grailsEnv}; sudo chmod 777 ${config.deploy.temp}/${grailsEnv}; sudo mkdir -p ${config.deploy.backup.dir}; sudo chmod 777 ${config.deploy.backup.dir};",
		timeout:"${config.deploy.timeout}",
		keyfile:"${config.deploy.keyfile}")
}

target(copiaWar: "Cria o pacote e envia para o host do ambiente escolhido") {
	depends(criaDiretorios,war)
	def tamanhoArquivo = String.format('%.2fMb', (grailsSettings.projectWarFile.size()/1024/1024))
	grailsConsole.updateStatus "[${grailsAppName}] Copiando ${config.deploy.war}(${tamanhoArquivo}) para: ${config.deploy.host}:${config.deploy.temp}/${grailsEnv}/..."
	event ("InicioCopia", ["[${grailsAppName}] Copiando ${config.deploy.war}(${tamanhoArquivo}) para: ${config.deploy.host}:${config.deploy.temp}/${grailsEnv}/..."])

	ant.scp (file:"${grailsSettings.projectWarFile}",
		todir:"${config.deploy.user}@${config.deploy.host}:${config.deploy.temp}/${grailsEnv}",
		port:"${config.deploy.port}",
		trust:"true",
		verbose:"true",
		keyfile:"${config.deploy.keyfile}",
		passphrase:" ")
	
	event "FinalCopia", ["[${grailsAppName}] Arquivo ${config.deploy.war} copiado com sucesso!"]
}

target(backupBanco: "Faz backup do banco de dados") {
	depends (copiaWar)
	grailsConsole.updateStatus "[${grailsAppName}] Criando backup do banco ${config.deploy.backup.database.name} na pasta '${config.deploy.backup.dir}'."
	event "InicioBackup", ["[${grailsAppName}] Criando backup do banco ${config.deploy.backup.database.name} na pasta '${config.deploy.backup.dir}'."]
	ant.sshexec(host:"${config.deploy.host}",
		username:"${config.deploy.user}",
		trust:"true",
		port:"${config.deploy.port}",
		command:"""sudo ${config.deploy.backup.database.command} ${config.deploy.backup.database.name} > banco-${grailsAppName.toLowerCase()}-${grailsEnv}.sql; 
			sudo ${config.deploy.zipCommand} banco-${grailsAppName.toLowerCase()}-${grailsEnv}.zip banco-${grailsAppName.toLowerCase()}-${grailsEnv}.sql
			sudo mv banco-${grailsAppName.toLowerCase()}-${grailsEnv}.zip ${config.deploy.backup.dir}/banco-${grailsAppName.toLowerCase()}-${grailsEnv}-${config.deploy.backup.database.date}.zip""",
		timeout:"${config.deploy.timeout}",
		keyfile:"${config.deploy.keyfile}")
	
	event "FinalBackup", ["[${grailsAppName}] Backup do banco ${config.deploy.backup.database.name} gerado na pasta ${config.deploy.backup.dir}  com sucesso!"]
}

target(deploy: "Copia o war da pasta temporária para a pasta de deploy") {
	depends (backupBanco)
	grailsConsole.updateStatus "[${grailsAppName}] Copiando ${config.deploy.war} da pasta  '${config.deploy.temp}/${grailsEnv}' para: '${config.deploy.folder}'."
	event "InicioDeploy", ["[${grailsAppName}] Copiando ${config.deploy.war} da pasta  '${config.deploy.temp}/${grailsEnv}' para: '${config.deploy.folder}'."]
	def delExplodedWar = ""
	if(config.deploy.explodedWar){
		delExplodedWar = " sudo rm -r ${config.deploy.folder}/${config.deploy.explodedWar}; "
	}
	ant.sshexec(host:"${config.deploy.host}",
		username:"${config.deploy.user}",
		trust:"true",
		port:"${config.deploy.port}",
		command:"sudo rm ${config.deploy.folder}/${config.deploy.finalWar};" + delExplodedWar + "sudo cp ${config.deploy.temp}/${grailsEnv}/${config.deploy.war} ${config.deploy.folder}/${config.deploy.finalWar};",
		timeout:"${config.deploy.timeout}",
		keyfile:"${config.deploy.keyfile}")
	
	event "FinalDeploy", ["[${grailsAppName}] Arquivo copiado para o ${config.deploy.server.name} com sucesso!"]
}

target(paraServidor: "Para o servidor do ambiente escolhido") {
	depends(deploy)
	grailsConsole.updateStatus "[${grailsAppName}] Parando o servidor ${config.deploy.server.name}."
	event "ParaServidor", ["[${grailsAppName}] Parando o servidor ${config.deploy.server.name}."]
	try {
		ant.sshexec(host:"${config.deploy.host}",
			username:"${config.deploy.user}",
			trust:"true",
			port:"${config.deploy.port}",
			command:"sudo ${config.deploy.server.stopCommand}",
			timeout:"${config.deploy.timeout}",
			keyfile:"${config.deploy.keyfile}")
	} catch (Exception e) {
		e.printStackTrace()
	}
	if(config.deploy.server.shutdownTime){
		sleep(config.deploy.server.shutdownTime)
	}
}

target(iniciaServidor: "Inicia o servidor do ambiente escolhido") {
	depends(paraServidor)
	grailsConsole.updateStatus "[${grailsAppName}] Iniciando o servidor ${config.deploy.server.name}."
	event "IniciaServidor", ["[${grailsAppName}] Iniciando o servidor ${config.deploy.server.name}."]
	try {
		ant.sshexec(host:"${config.deploy.host}",
			username:"${config.deploy.user}",
			trust:"true",
			port:"${config.deploy.port}",
			command:"sudo ${config.deploy.server.startCommand}",
			timeout:"${config.deploy.timeout}",
			keyfile:"${config.deploy.keyfile}")
	} catch (Exception e) {
		e.printStackTrace()
	}
}

target(removeArquivos: "Remove arquivos criados") {
	def dependencias = [deploy, cleanAll]
	if (config.deploy.server.restart){
		dependencias = [iniciaServidor, cleanAll]
	}
	depends(*dependencias)
//	depends(configuraBuild)
	grailsConsole.updateStatus "[${grailsAppName}] Removendo arquivos temporarios."
	event "RemoveArquivos", ["[${grailsAppName}] Removendo arquivos temporarios."]
	try {
		ant.sshexec(host:"${config.deploy.host}",
			username:"${config.deploy.user}",
			trust:"true",
			port:"${config.deploy.port}",
			command:"""sudo rm ${config.deploy.temp}/${grailsEnv}/${config.deploy.war}; 
					sudo rm banco-${grailsAppName.toLowerCase()}-${grailsEnv}.sql;
					sudo rm banco-${grailsAppName.toLowerCase()}-${grailsEnv}.zip;""",
			timeout:"${config.deploy.timeout}",
			keyfile:"${config.deploy.keyfile}")
	} catch (Exception e) {
		e.printStackTrace()
	}
}
setDefaultTarget(removeArquivos)

def getFailedTests() {
	File file = new File("${testReportsDir}/TESTS-TestSuites.xml")
	if (!file.exists()) {
		return []
	}

	def xmlParser = new XmlParser().parse(file)
	def failedTests = xmlParser.testsuite.findAll { it.'@failures' =~ /.*[1-9].*/ || it.'@errors' =~ /.*[1-9].*/}

	return failedTests.collect {
		grailsConsole.updateStatus it
		String testName = it.'@name'
		testName = testName.replace('Tests', '')
		def pkg = it.'@package'
		if (pkg) {
			testName = pkg + '.' + testName
		}
		return testName
	}
}

//echo("${config.grails.project.groupId}")
//echo("${grailsSettings.projectWarFile}")
//echo("${grailsSettings.projectWarFile.absolutePath}")
//echo("${config.deploy.user}")
//echo("${grailsSettings.projectWarFile.size()}")
//Ant.property(environment:"env")
//grailsHome = Ant.antProject.properties."env.GRAILS_HOME"
//baseDir = Ant.project.properties.basedir
//Ant.property ( file : 'application.properties' )
//
//includeTargets << new File ( "${grailsHome}/scripts/War.groovy" )
//
//args = "scott.war"
//
//target(default: "a simple gant script") {
//
//
//Ant.property ( file : 'application.properties' )
//Ant.property ( file : 'environment.properties' )
//
//def appName = Ant.project.properties.'app.name'
//def appVersion = Ant.project.properties.'app.version'
//
//def host = Ant.project.properties.'deployhost'
//def port = Ant.project.properties.'deployport'
//def username = Ant.project.properties.'deployusername'
//def password = Ant.project.properties.'deploypassword'
//
//
//echo ( message : "starting deployment" )
//war()
//
//scp(file:args, todir:"${username}@${host}", password:password,port:port)