<%@ page import="ddoctor.Medicacao" %>
<div class="fieldcontain ${hasErrors(bean: medicacaoInstancia, field: 'bula', 'error')} ">
	<label for="bula">
		<g:message code="medicacao.bula.label" default="Bula" />
	</label>
	<g:textField name="bula" value="${medicacaoInstancia?.bula}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: medicacaoInstancia, field: 'dataCompra', 'error')} required">
	<label for="dataCompra">
		<g:message code="medicacao.dataCompra.label" default="Data Compra" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataCompra" precision="day"  value="${medicacaoInstancia?.dataCompra}"  />
</div>
<div class="fieldcontain ${hasErrors(bean: medicacaoInstancia, field: 'fabricante', 'error')} ">
	<label for="fabricante">
		<g:message code="medicacao.fabricante.label" default="Fabricante" />
	</label>
	<g:textField name="fabricante" value="${medicacaoInstancia?.fabricante}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: medicacaoInstancia, field: 'nome', 'error')} ">
	<label for="nome">
		<g:message code="medicacao.nome.label" default="Nome" />
	</label>
	<g:textField name="nome" value="${medicacaoInstancia?.nome}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: medicacaoInstancia, field: 'quantidade', 'error')} required">
	<label for="quantidade">
		<g:message code="medicacao.quantidade.label" default="Quantidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantidade" type="number" value="${medicacaoInstancia.quantidade}" required=""/>
</div>
<div class="fieldcontain ${hasErrors(bean: medicacaoInstancia, field: 'tarja', 'error')} ">
	<label for="tarja">
		<g:message code="medicacao.tarja.label" default="Tarja" />
		
	</label>
	<g:textField name="tarja" value="${medicacaoInstancia?.tarja}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: medicacaoInstancia, field: 'unidade', 'error')} ">
	<label for="unidade">
		<g:message code="medicacao.unidade.label" default="Unidade" />
	</label>
	<g:textField name="unidade" value="${medicacaoInstancia?.unidade}"/>
</div>