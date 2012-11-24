<%@ page import="ddoctor.Tarefa" %>



<div class="fieldcontain ${hasErrors(bean: tarefaInstancia, field: 'link', 'error')} ">
	<label for="link">
		<g:message code="tarefa.link.label" default="Link" />
		
	</label>
	<g:textField name="link" value="${tarefaInstancia?.link}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tarefaInstancia, field: 'dataEnvio', 'error')} required">
	<label for="dataEnvio">
		<g:message code="tarefa.dataCriacao.label" default="Data Envio" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataEnvio" precision="day"  value="${tarefaInstancia?.dataCriacao}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: tarefaInstancia, field: 'descricao', 'error')} ">
	<label for="descricao">
		<g:message code="tarefa.descricao.label" default="Descricao" />
		
	</label>
	<g:textField name="descricao" value="${tarefaInstancia?.descricao}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tarefaInstancia, field: 'nome', 'error')} ">
	<label for="nome">
		<g:message code="tarefa.nome.label" default="Nome" />
		
	</label>
	<g:textField name="nome" value="${tarefaInstancia?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tarefaInstancia, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="tarefa.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${ddoctor.StatusTarefa?.values()}" keys="${ddoctor.StatusTarefa.values()*.name()}" required="" value="${tarefaInstancia?.status?.name()}"/>
</div>

