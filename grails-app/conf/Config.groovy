// locations to search for config files that get merged into the main config
// config files can either be Java properties files or ConfigSlurper scripts

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }


grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [ html: ['text/html','application/xhtml+xml'],
                      xml: ['text/xml', 'application/xml'],
                      text: 'text/plain',
                      js: 'text/javascript',
                      rss: 'application/rss+xml',
                      atom: 'application/atom+xml',
                      css: 'text/css',
                      csv: 'text/csv',
                      all: '*/*',
                      json: ['application/json','text/json'],
                      form: 'application/x-www-form-urlencoded',
                      multipartForm: 'multipart/form-data'
                    ]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']


// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instancia'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// enable query caching by default
grails.hibernate.cache.queries = true

// set per-environment serverURL stem for creating absolute links

environments {
    development {
        grails.logging.jul.usebridge = true
		grails.resources.processing.enabled = true
		grails.serverURL = "http://localhost:8080/ddoctor"
    }
    production {
        grails.logging.jul.usebridge = false
		grails.serverURL = "http://ec2-50-17-131-191.compute-1.amazonaws.com/ddoctor_grails"
		deploy{
			user = "ubuntu"
			host = "ec2-50-17-131-191.compute-1.amazonaws.com"
			port = 22
			keyfile = "/Users/marco/amazon/marco-amazon.pem"
			timeout = 100000
			temp = "/storage/tmp/deploy"
			folder = "/storage/apache-tomcat-7.0.23/webapps"
			finalWar = "ddoctor_grails.war"
			war = "${appName}-${appVersion}.war"
			explodedWar = "ddoctor_grails"
			zipCommand = "zip"
			server = [
						name :  "Tomcat 7",
						startCommand : "tomcat start;",
						stopCommand : "tomcat stop;",
						restart: false
					]
			backup {
				dir = "/storage/backups"
				database {
					name = "ddoctor"
					command = "pg_dump"
					date = "`date +%d-%m-%G[%a-%b-%Hh%Mm]`"
				}
			}
			//os testes que ser�o feitos antes do deploy, se algum teste falhar ele cancela o build/
			//para n�o executar testes o valor deve ser false
			tests = false //["unit", "integration"] // "unit", "integration", "functional"
		}
    }
}

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console
    // appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error  'org.codehaus.groovy.grails.web.servlet',  //  controllers
           'org.codehaus.groovy.grails.web.pages', //  GSP
           'org.codehaus.groovy.grails.web.sitemesh', //  layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping', // URL mapping
           'org.codehaus.groovy.grails.commons', // core / classloading
           'org.codehaus.groovy.grails.plugins', // plugins
           'org.codehaus.groovy.grails.orm.hibernate', // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate'
		   
	info  'grails.app'
//	debug 'grails.app'
}
