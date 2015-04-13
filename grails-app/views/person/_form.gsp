<%@ page import="parreira.Person" %>



<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="person.name.label" default="Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" maxlength="64" required="" value="${personInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'email', 'error')} required">
    <label for="email">
        <g:message code="person.email.label" default="Email"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="email" maxlength="32" required="" value="${personInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'balance', 'error')} required">
    <label for="balance">
        <g:message code="person.balance.label" default="Balance"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="balance" type="number" min="0" value="${personInstance.balance}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'transactions', 'error')} ">
    <label for="transactions">
        <g:message code="person.transactions.label" default="Transactions"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${personInstance?.transactions ?}" var="t">
            <li><g:link controller="transaction" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="transaction" action="create"
                    params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'transaction.label', default: 'Transaction')])}</g:link>
        </li>
    </ul>

</div>

