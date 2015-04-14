<%@ page import="parreira.Txn" %>




<div class="fieldcontain ${hasErrors(bean: txnInstance, field: 'sender', 'error')} required">
	<label for="sender">
		<g:message code="txn.sender.label" default="From: (sender)" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sender" name="sender.id" from="${parreira.Person.list()}" optionKey="id" required="" value="${txnInstance?.sender?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: txnInstance, field: 'receiver', 'error')} required">
	<label for="receiver">
		<g:message code="txn.receiver.label" default="To: (receiver)" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="receiver" name="receiver.id" from="${parreira.Person.list()}" optionKey="id" required="" value="${txnInstance?.receiver?.id}" class="many-to-one"/>

</div>



<div class="fieldcontain ${hasErrors(bean: txnInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="txn.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" type="number" min="1" value="${txnInstance.amount}" required=""/>

</div>