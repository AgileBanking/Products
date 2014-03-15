<%@ page import="entities.EventType" %>



<div class="fieldcontain ${hasErrors(bean: eventTypeInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="eventType.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${eventTypeInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventTypeInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="eventType.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${eventTypeInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventTypeInstance, field: 'titleInt', 'error')} ">
	<label for="titleInt">
		<g:message code="eventType.titleInt.label" default="Title Int" />
		
	</label>
	<g:textField name="titleInt" value="${eventTypeInstance?.titleInt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventTypeInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="eventType.notes.label" default="Notes" />
		
	</label>
	<g:textField name="notes" maxlength="250" value="${eventTypeInstance?.notes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventTypeInstance, field: 'recStatus', 'error')} ">
	<label for="recStatus">
		<g:message code="eventType.recStatus.label" default="Rec Status" />
		
	</label>
	<g:select name="recStatus" from="${eventTypeInstance.constraints.recStatus.inList}" value="${eventTypeInstance?.recStatus}" valueMessagePrefix="eventType.recStatus" noSelection="['': '']"/>
</div>

