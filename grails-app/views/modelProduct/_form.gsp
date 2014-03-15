<%@ page import="entities.ModelProduct" %>



<div class="fieldcontain ${hasErrors(bean: modelProductInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="modelProduct.code.label" default="Code" />
		
	</label>
	<g:textField name="code" maxlength="16" value="${modelProductInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: modelProductInstance, field: 'productCategory', 'error')} required">
	<label for="productCategory">
		<g:message code="modelProduct.productCategory.label" default="Product Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="productCategory" name="productCategory.id" from="${entities.ProductCategory.list()}" optionKey="id" required="" value="${modelProductInstance?.productCategory?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: modelProductInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="modelProduct.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${modelProductInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: modelProductInstance, field: 'titleInt', 'error')} required">
	<label for="titleInt">
		<g:message code="modelProduct.titleInt.label" default="Title Int" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titleInt" required="" value="${modelProductInstance?.titleInt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: modelProductInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="modelProduct.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${modelProductInstance.constraints.type.inList}" required="" value="${modelProductInstance?.type}" valueMessagePrefix="modelProduct.type"/>
</div>

<div class="fieldcontain ${hasErrors(bean: modelProductInstance, field: 'ineterestFreq', 'error')} ">
	<label for="ineterestFreq">
		<g:message code="modelProduct.ineterestFreq.label" default="Ineterest Freq" />
		
	</label>
	<g:select name="ineterestFreq" from="${modelProductInstance.constraints.ineterestFreq.inList}" value="${modelProductInstance?.ineterestFreq}" valueMessagePrefix="modelProduct.ineterestFreq" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: modelProductInstance, field: 'modelEvents', 'error')} ">
	<label for="modelEvents">
		<g:message code="modelProduct.modelEvents.label" default="Model Events" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${modelProductInstance?.modelEvents?}" var="m">
    <li><g:link controller="modelEvent" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="modelEvent" action="create" params="['modelProduct.id': modelProductInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'modelEvent.label', default: 'ModelEvent')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: modelProductInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="modelProduct.notes.label" default="Notes" />
		
	</label>
	<g:textArea name="notes" cols="40" rows="5" maxlength="255" value="${modelProductInstance?.notes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: modelProductInstance, field: 'recStatus', 'error')} ">
	<label for="recStatus">
		<g:message code="modelProduct.recStatus.label" default="Rec Status" />
		
	</label>
	<g:select name="recStatus" from="${modelProductInstance.constraints.recStatus.inList}" value="${modelProductInstance?.recStatus}" valueMessagePrefix="modelProduct.recStatus" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: modelProductInstance, field: 'products', 'error')} ">
	<label for="products">
		<g:message code="modelProduct.products.label" default="Products" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${modelProductInstance?.products?}" var="p">
    <li><g:link controller="product" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="product" action="create" params="['modelProduct.id': modelProductInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'product.label', default: 'Product')])}</g:link>
</li>
</ul>

</div>

