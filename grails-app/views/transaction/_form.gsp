<%@ page import="parreira.Transaction" %>




<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'receiver', 'error')} required">
	<label for="receiver">
		<g:message code="transaction.receiver.label" default="Receiver" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="receiver" name="receiver.id" from="${parreira.Person.list()}" optionKey="id" optionValue="name" required="" value="${transactionInstance?.receiver?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'sender', 'error')} required">
	<label for="sender">
		<g:message code="transaction.sender.label" default="Sender" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sender" name="sender.id" from="${parreira.Person.list()}" optionKey="id" optionValue="name" required="" value="${transactionInstance?.sender?.id}" class="many-to-one"/>

</div>


<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="transaction.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" type="number" min="1" value="${transactionInstance.amount}" required=""/>

</div>