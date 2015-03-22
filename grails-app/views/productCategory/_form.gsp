<%@ page import="entities.ProductCategory" %>



<div class="fieldcontain ${hasErrors(bean: productCategoryInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="productCategory.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" maxlength="16" required="" value="${productCategoryInstance?.code}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productCategoryInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="productCategory.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${productCategoryInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productCategoryInstance, field: 'titleInt', 'error')} required">
	<label for="titleInt">
		<g:message code="productCategory.titleInt.label" default="Title Int" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titleInt" required="" value="${productCategoryInstance?.titleInt}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productCategoryInstance, field: 'productClass', 'error')} required">
	<label for="productClass">
		<g:message code="productCategory.productClass.label" default="Product Class" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="productClass" from="${productCategoryInstance.constraints.productClass.inList}" required="" value="${productCategoryInstance?.productClass}" valueMessagePrefix="productCategory.productClass"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productCategoryInstance, field: 'explicitContract', 'error')} ">
	<label for="explicitContract">
		<g:message code="productCategory.explicitContract.label" default="Explicit Contract" />
		
	</label>
	<g:checkBox name="explicitContract" value="${productCategoryInstance?.explicitContract}" />

</div>

<div class="fieldcontain ${hasErrors(bean: productCategoryInstance, field: 'parentCategory', 'error')} ">
	<label for="parentCategory">
		<g:message code="productCategory.parentCategory.label" default="Parent Category" />
		
	</label>
	<g:select id="parentCategory" name="parentCategory.id" from="${entities.ProductCategory.list()}" optionKey="id" value="${productCategoryInstance?.parentCategory?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productCategoryInstance, field: 'modelProducts', 'error')} ">
	<label for="modelProducts">
		<g:message code="productCategory.modelProducts.label" default="Model Products" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${productCategoryInstance?.modelProducts?}" var="m">
    <li><g:link controller="modelProduct" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="modelProduct" action="create" params="['productCategory.id': productCategoryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'modelProduct.label', default: 'ModelProduct')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: productCategoryInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="productCategory.notes.label" default="Notes" />
		
	</label>
	<g:textArea name="notes" cols="40" rows="5" maxlength="65535" value="${productCategoryInstance?.notes}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productCategoryInstance, field: 'userId', 'error')} required">
	<label for="userId">
		<g:message code="productCategory.userId.label" default="User Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="userId" type="number" value="${productCategoryInstance.userId}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: productCategoryInstance, field: 'orgUnitId', 'error')} required">
	<label for="orgUnitId">
		<g:message code="productCategory.orgUnitId.label" default="Org Unit Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="orgUnitId" type="number" value="${productCategoryInstance.orgUnitId}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: productCategoryInstance, field: 'recStatus', 'error')} required">
	<label for="recStatus">
		<g:message code="productCategory.recStatus.label" default="Rec Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="recStatus" from="${productCategoryInstance.constraints.recStatus.inList}" required="" value="${productCategoryInstance?.recStatus}" valueMessagePrefix="productCategory.recStatus"/>

</div>

