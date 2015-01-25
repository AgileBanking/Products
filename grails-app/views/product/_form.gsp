<%@ page import="entities.Product" %>



<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="product.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" required="" value="${productInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="product.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${productInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'titleInt', 'error')} required">
	<label for="titleInt">
		<g:message code="product.titleInt.label" default="Title Int" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titleInt" required="" value="${productInstance?.titleInt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'modelProduct', 'error')} required">
	<label for="modelProduct">
		<g:message code="product.modelProduct.label" default="Model Product" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="modelProduct" name="modelProduct.id" from="${entities.ModelProduct.list()}" optionKey="id" required="" value="${productInstance?.modelProduct?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'productPolicies', 'error')} ">
	<label for="productPolicies">
		<g:message code="product.productPolicies.label" default="Product Policies" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${productInstance?.productPolicies?}" var="p">
    <li><g:link controller="productPolicy" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="productPolicy" action="create" params="['product.id': productInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'productPolicy.label', default: 'ProductPolicy')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'dimensions', 'error')} required">
	<label for="dimensions">
		<g:message code="product.dimensions.label" default="Dimensions" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="dimensions" type="number" value="${productInstance.dimensions}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'activeSince', 'error')} ">
	<label for="activeSince">
		<g:message code="product.activeSince.label" default="Active Since" />
		
	</label>
	<g:datePicker name="activeSince" precision="day"  value="${productInstance?.activeSince}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'activeUntil', 'error')} ">
	<label for="activeUntil">
		<g:message code="product.activeUntil.label" default="Active Until" />
		
	</label>
	<g:datePicker name="activeUntil" precision="day"  value="${productInstance?.activeUntil}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="product.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${productInstance.constraints.status.inList}" required="" value="${productInstance?.status}" valueMessagePrefix="product.status"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'marketingVersion', 'error')} required">
	<label for="marketingVersion">
		<g:message code="product.marketingVersion.label" default="Marketing Version" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="marketingVersion" type="number" min="1" value="${productInstance.marketingVersion}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'minOpeningAmount', 'error')} required">
	<label for="minOpeningAmount">
		<g:message code="product.minOpeningAmount.label" default="Min Opening Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="minOpeningAmount" type="number" value="${productInstance.minOpeningAmount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'maxOpeningAmount', 'error')} required">
	<label for="maxOpeningAmount">
		<g:message code="product.maxOpeningAmount.label" default="Max Opening Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="maxOpeningAmount" type="number" value="${productInstance.maxOpeningAmount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'dormantPeriod', 'error')} required">
	<label for="dormantPeriod">
		<g:message code="product.dormantPeriod.label" default="Dormant Period" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="dormantPeriod" type="number" value="${productInstance.dormantPeriod}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'specialEvents', 'error')} ">
	<label for="specialEvents">
		<g:message code="product.specialEvents.label" default="Special Events" />
		
	</label>
	<g:select name="specialEvents" from="${entities.SpecialEvent.list()}" multiple="multiple" optionKey="id" size="5" value="${productInstance?.specialEvents*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="product.notes.label" default="Notes" />
		
	</label>
	<g:textArea name="notes" cols="40" rows="5" maxlength="255" value="${productInstance?.notes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'recStatus', 'error')} ">
	<label for="recStatus">
		<g:message code="product.recStatus.label" default="Rec Status" />
		
	</label>
	<g:select name="recStatus" from="${productInstance.constraints.recStatus.inList}" value="${productInstance?.recStatus}" valueMessagePrefix="product.recStatus" noSelection="['': '']"/>
</div>

