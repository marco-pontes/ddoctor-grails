<%@ page import="ddoctor.Paciente" %>



<div class="fieldcontain ${hasErrors(bean: pacienteInstancia, field: 'login', 'error')} required">
	<label for="login">
		<g:message code="paciente.login.label" default="Login" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="login" required="" value="${pacienteInstancia?.login}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pacienteInstancia, field: 'senha', 'error')} required">
	<label for="senha">
		<g:message code="paciente.senha.label" default="Senha" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="senha" required="" value="${pacienteInstancia?.senha}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pacienteInstancia, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="paciente.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${pacienteInstancia?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pacienteInstancia, field: 'sexo', 'error')} required">
	<label for="sexo">
		<g:message code="paciente.sexo.label" default="Sexo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sexo" from="${pacienteInstancia.constraints.sexo.inList}" required="" value="${pacienteInstancia?.sexo}" valueMessagePrefix="paciente.sexo"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pacienteInstancia, field: 'dataNascimento', 'error')} ">
	<label for="dataNascimento">
		<g:message code="paciente.dataNascimento.label" default="Data Nascimento" />
		
	</label>
	<g:datePicker name="dataNascimento" precision="day"  value="${pacienteInstancia?.dataNascimento}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: pacienteInstancia, field: 'telefone', 'error')} ">
	<label for="telefone">
		<g:message code="paciente.telefone.label" default="Telefone" />
		
	</label>
	<g:textField name="telefone" value="${pacienteInstancia?.telefone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pacienteInstancia, field: 'tarefas', 'error')} ">
	<label for="tarefas">
		<g:message code="paciente.tarefas.label" default="Tarefas" />
		
	</label>
	<g:select name="tarefas" from="${ddoctor.Tarefa.list()}" multiple="multiple" optionKey="id" size="5" value="${pacienteInstancia?.tarefas*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pacienteInstancia, field: 'historico', 'error')} ">
	<label for="historico">
		<g:message code="paciente.historico.label" default="Historico" />
		
	</label>
	<g:textArea name="historico" cols="40" rows="5" maxlength="1000" value="${pacienteInstancia?.historico}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pacienteInstancia, field: 'RG', 'error')} required">
	<label for="RG">
		<g:message code="paciente.RG.label" default="RG" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="RG" required="" value="${fieldValue(bean: pacienteInstancia, field: 'RG')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pacienteInstancia, field: 'ativo', 'error')} ">
	<label for="ativo">
		<g:message code="paciente.ativo.label" default="Ativo" />
		
	</label>
	<g:checkBox name="ativo" value="${pacienteInstancia?.ativo}" />
</div>

<div class="fieldcontain ${hasErrors(bean: pacienteInstancia, field: 'contaBloqueada', 'error')} ">
	<label for="contaBloqueada">
		<g:message code="paciente.contaBloqueada.label" default="Conta Bloqueada" />
		
	</label>
	<g:checkBox name="contaBloqueada" value="${pacienteInstancia?.contaBloqueada}" />
</div>

<div class="fieldcontain ${hasErrors(bean: pacienteInstancia, field: 'contaExpirada', 'error')} ">
	<label for="contaExpirada">
		<g:message code="paciente.contaExpirada.label" default="Conta Expirada" />
		
	</label>
	<g:checkBox name="contaExpirada" value="${pacienteInstancia?.contaExpirada}" />
</div>

<div class="fieldcontain ${hasErrors(bean: pacienteInstancia, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="paciente.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${pacienteInstancia?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pacienteInstancia, field: 'endereco', 'error')} required">
	<label for="endereco">
		<g:message code="paciente.endereco.label" default="Endereco" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="endereco" name="endereco.id" from="${ddoctor.Endereco.list()}" optionKey="id" required="" value="${pacienteInstancia?.endereco?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pacienteInstancia, field: 'idade', 'error')} required">
	<label for="idade">
		<g:message code="paciente.idade.label" default="Idade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="idade" required="" value="${fieldValue(bean: pacienteInstancia, field: 'idade')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pacienteInstancia, field: 'planoSaude', 'error')} required">
	<label for="planoSaude">
		<g:message code="paciente.planoSaude.label" default="Plano Saude" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="planoSaude" name="planoSaude.id" from="${ddoctor.PlanoSaude.list()}" optionKey="id" required="" value="${pacienteInstancia?.planoSaude?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pacienteInstancia, field: 'senhaExpirada', 'error')} ">
	<label for="senhaExpirada">
		<g:message code="paciente.senhaExpirada.label" default="Senha Expirada" />
		
	</label>
	<g:checkBox name="senhaExpirada" value="${pacienteInstancia?.senhaExpirada}" />
</div>

