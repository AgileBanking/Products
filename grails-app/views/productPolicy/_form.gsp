<%@ page import="entities.ProductPolicy" %>



<div class="fieldcontain ${hasErrors(bean: productPolicyInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="productPolicy.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${productPolicyInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productPolicyInstance, field: 'titleInt', 'error')} ">
	<label for="titleInt">
		<g:message code="productPolicy.titleInt.label" default="Title Int" />
		
	</label>
	<g:textField name="titleInt" value="${productPolicyInstance?.titleInt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productPolicyInstance, field: 'product', 'error')} required">
	<label for="product">
		<g:message code="productPolicy.product.label" default="Product" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="product" name="product.id" from="${entities.Product.list()}" optionKey="id" required="" value="${productPolicyInstance?.product?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productPolicyInstance, field: 'currencyISO', 'error')} ">
	<label for="currencyISO">
		<g:message code="productPolicy.currencyISO.label" default="Currency ISO" />
		
	</label>
	<g:textField name="currencyISO" maxlength="3" value="${productPolicyInstance?.currencyISO}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productPolicyInstance, field: 'termUnit', 'error')} ">
	<label for="termUnit">
		<g:message code="productPolicy.termUnit.label" default="Term Unit" />
		
	</label>
	<g:select name="termUnit" from="${productPolicyInstance.constraints.termUnit.inList}" value="${productPolicyInstance?.termUnit}" valueMessagePrefix="productPolicy.termUnit" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productPolicyInstance, field: 'fromTerm', 'error')} required">
	<label for="fromTerm">
		<g:message code="productPolicy.fromTerm.label" default="From Term" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="fromTerm" type="number" value="${productPolicyInstance.fromTerm}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: productPolicyInstance, field: 'toTerm', 'error')} required">
	<label for="toTerm">
		<g:message code="productPolicy.toTerm.label" default="To Term" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="toTerm" type="number" value="${productPolicyInstance.toTerm}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: productPolicyInstance, field: 'recStatus', 'error')} ">
	<label for="recStatus">
		<g:message code="productPolicy.recStatus.label" default="Rec Status" />
		
	</label>
	<g:select name="recStatus" from="${productPolicyInstance.constraints.recStatus.inList}" value="${productPolicyInstance?.recStatus}" valueMessagePrefix="productPolicy.recStatus" noSelection="['': '']"/>
</div>

