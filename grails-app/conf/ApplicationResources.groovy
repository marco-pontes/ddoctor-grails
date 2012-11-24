modules = {
	
	base{
		resource url: "css/ui/ui.reset.css"
		resource url: "css/ui/ui.core.css"
		resource url: "css/ui/ui.forms.css"
		resource url: "css/ui/ui.tables.css"
		resource url: "css/ui/ui.messages.css"
		resource url: "css/ui/ui.dialog.css"
		resource url: "css/ui/ui.tabs.css"
		resource url: "css/ui/ui.dashboard.css"
		}
	
    application {
		dependsOn 'jquery', 'base'
		resource url: 'css/themes/black_rose/ui.css' 
//		resource url: 'css/themes/blueberry/ui.css'
		resource url: 'css/main.css'
		resource url: 'js/ui/ui.core.js'
		resource url: 'js/ui/ui.widget.js'
		resource url: 'js/ui/ui.mouse.js'
		resource url: 'js/superfish.js'
		resource url: 'js/live_search.js'
		resource url: 'js/tooltip.js'
		resource url: 'js/cookie.js'
		resource url: 'js/ui/ui.sortable.js'
		resource url: 'js/ui/ui.draggable.js'
		resource url: 'js/ui/ui.resizable.js'
		resource url: 'js/ui/ui.position.js'
		resource url: 'js/ui/ui.button.js'
		resource url: 'js/ui/ui.dialog.js'
		resource url: 'js/ui/ui.datepicker.js'
		resource url: 'css/fullcalendar.css'
		resource url: 'js/ui/fullcalendar.min.js'
		resource url: 'js/ui/I18N/jquery.ui.datepicker-pt-BR.js'
		resource url: 'js/ui/jquery.ui.autocomplete.js'
		resource url: 'js/i18n/globalize.js'
		resource url: 'js/custom.js'
		resource url: 'js/application.js'
    }
	
	login{
		dependsOn 'jquery', 'base'
		resource url: 'css/ui/ui.base.css'
		resource url: 'css/ui/ui.login.css'
		resource url: 'css/themes/black_rose/ui.css' // css/themes/blueberry/ui.css
		resource url: 'css/main.css'
		resource url: 'css/fullcalendar.css'
		resource url: 'js/ui/ui.core.js'
		resource url: 'js/ui/ui.widget.js'
		resource url: 'js/ui/ui.mouse.js'
		resource url: 'js/superfish.js'
		resource url: 'js/live_search.js'
		resource url: 'js/tooltip.js'
		resource url: 'js/cookie.js'
		resource url: 'js/ui/ui.sortable.js'
		resource url: 'js/ui/ui.draggable.js'
		resource url: 'js/ui/ui.resizable.js'
		resource url: 'js/ui/ui.position.js'
		resource url: 'js/ui/ui.button.js'
		resource url: 'js/ui/ui.dialog.js'
		resource url: 'js/ui/ui.tabs.js'
		resource url: 'js/i18n/globalize.js'
		resource url: 'js/custom.js'
		resource url:'js/application.js'
		}
	
	dashboard_atendente {
		dependsOn 'application'
		resource url: 'js/dashboard/atendente.js'
	}
	
	dashboard_paciente {
		dependsOn 'application'
		resource url: 'js/ui/ui.accordion.js'
		resource url: 'js/highcharts.js'
		resource url: 'js/dashboard/paciente.js'
	}
	
	dashboard_medico {
		dependsOn 'application'
		resource url: 'js/dashboard/medico.js'
	}
	
	atendimento_listar {
		dependsOn 'application'
	}
	
	medico_listar {
		dependsOn 'application'
		resource url: 'js/medico/listar.js'
	}
	
	paciente_listar {
		dependsOn 'application'
		resource url: 'js/paciente/listar.js'
	}
	
	tarefa_listar {
		dependsOn 'application'
		resource url: 'js/tarefa/listar.js'
	}
	
	mensagem_listar {
		dependsOn 'application'
		resource url: 'js/mensagem/listar.js'
	}
	
	atendimento_mostrar {
		dependsOn 'application'
		resource url: 'js/consulta/confirmacao.js'
	}
	
	consulta_confirmacao {
		dependsOn 'application'
		resource url: 'js/consulta/confirmacao.js'
	}
	
	entrevista_medica {
		dependsOn 'application'
		resource url: 'js/dashboard/atendente.js'
	}
	
}