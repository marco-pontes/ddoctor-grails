<%@ page import="ddoctor.Mensagem" %>



<div class="fieldcontain ${hasErrors(bean: mensagemInstancia, field: 'corpo', 'error')} ">
	<label for="corpo">
		<g:message code="mensagem.corpo.label" default="Corpo" />
		
	</label>
	<g:textArea name="corpo" cols="40" rows="5" maxlength="500" value="${mensagemInstancia?.corpo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: mensagemInstancia, field: 'tipo', 'error')} ">
	<label for="tipo">
		<g:message code="mensagem.tipo.label" default="Tipo" />
		
	</label>
	<g:textField name="tipo" value="${mensagemInstancia?.tipo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: mensagemInstancia, field: 'assunto', 'error')} ">
	<label for="assunto">
		<g:message code="mensagem.assunto.label" default="Assunto" />
		
	</label>
	<g:textField name="assunto" value="${mensagemInstancia?.assunto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: mensagemInstancia, field: 'dataEnvio', 'error')} required">
	<label for="dataEnvio">
		<g:message code="mensagem.dataEnvio.label" default="Data Envio" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataEnvio" precision="day"  value="${mensagemInstancia?.dataEnvio}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: mensagemInstancia, field: 'destinatario', 'error')} required">
	<label for="destinatario">
		<g:message code="mensagem.destinatario.label" default="Destinatario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="destinatario" name="destinatario.id" from="${ddoctor.usuario.Usuario.list()}" optionKey="id" required="" value="${mensagemInstancia?.destinatario?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: mensagemInstancia, field: 'remetente', 'error')} required">
	<label for="remetente">
		<g:message code="mensagem.remetente.label" default="Remetente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="remetente" name="remetente.id" from="${ddoctor.usuario.Usuario.list()}" optionKey="id" required="" value="${mensagemInstancia?.remetente?.id}" class="many-to-one"/>
</div>

