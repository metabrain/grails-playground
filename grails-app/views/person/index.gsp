<%@ page import="parreira.Person" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
	<title>See transactions</title>
	<g:javascript library="jquery"/>
	%{--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>--}%
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'transaction.css')}" type="text/css">
	<g:javascript src="myscript.js" />
</head>
<body>
<a href="#list-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
	<ul>
		<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
		<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
	</ul>
</div>
<div class="transaction-page">
	<h2>Pay</h2>
	<br/>
	<g:hasErrors bean="${Person}" field="name">
		<g:message error="${Person.errors.getFieldErrors("name")}" />
	</g:hasErrors>
	<b>Person:</b> 
	<g:select
			id="person"
			name="person.id"
			from="${parreira.Person.list()}"
			noSelection="['':'Pick a person']"
			optionKey="id"
			optionValue="name"
			required=""
			value="${personInstance?.id}"
	/>

	<br/>
	­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­­
	<div id="person-txns" style="display: none">
		<div>Balance of <span class="person-name"></span>: <span class="person-balance"></span>$</div>
		<div id="list-txn" class="content scaffold-list" role="main">
			<h1><span class="person-name"></span></h1>
			<table>
				<thead>
				<tr>
					<g:sortableColumn property="amount" title="${message(code: 'txn.amount.label', default: 'Amount')}" />
					<th><g:message code="txn.receiver.label" default="Receiver" /></th>
					<th><g:message code="txn.sender.label" default="Sender" /></th>
				</tr>
				</thead>
				<tbody>
				<g:each in="${txnInstanceList}" status="i" var="txnInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${txnInstance.id}">${fieldValue(bean: txnInstance, field: "amount")}</g:link></td>
						<td>${fieldValue(bean: txnInstance, field: "receiver")}</td>
						<td>${fieldValue(bean: txnInstance, field: "sender")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
	</div>



</div>









%{--<div id="list-person" class="content scaffold-list" role="main">--}%
	%{--<h1><g:message code="default.list.label" args="[entityName]" /></h1>--}%
	%{--<g:if test="${flash.message}">--}%
		%{--<div class="message" role="status">${flash.message}</div>--}%
	%{--</g:if>--}%
	%{--<table>--}%
		%{--<thead>--}%
		%{--<tr>--}%

			%{--<g:sortableColumn property="name" title="${message(code: 'person.name.label', default: 'Name')}" />--}%

			%{--<g:sortableColumn property="email" title="${message(code: 'person.email.label', default: 'Email')}" />--}%

			%{--<g:sortableColumn property="balance" title="${message(code: 'person.balance.label', default: 'Balance')}" />--}%

		%{--</tr>--}%
		%{--</thead>--}%
		%{--<tbody>--}%
		%{--<g:each in="${personInstanceList}" status="i" var="personInstance">--}%
			%{--<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">--}%

				%{--<td><g:link action="show" id="${personInstance.id}">${fieldValue(bean: personInstance, field: "name")}</g:link></td>--}%

				%{--<td>${fieldValue(bean: personInstance, field: "email")}</td>--}%

				%{--<td>${fieldValue(bean: personInstance, field: "balance")}</td>--}%

			%{--</tr>--}%
		%{--</g:each>--}%
		%{--</tbody>--}%
	%{--</table>--}%
	%{--<div class="pagination">--}%
		%{--<g:paginate total="${personInstanceCount ?: 0}" />--}%
	%{--</div>--}%
%{--</div>--}%
</body>
</html>

%{--<%@ page import="parreira.Person" %>--}%
%{--<!DOCTYPE html>--}%
%{--<html>--}%
	%{--<head>--}%
		%{--<meta name="layout" content="main">--}%
		%{--<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />--}%
		%{--<title><g:message code="default.list.label" args="[entityName]" /></title>--}%
	%{--</head>--}%
	%{--<body>--}%
		%{--<a href="#list-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
		%{--<div class="nav" role="navigation">--}%
			%{--<ul>--}%
				%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
				%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
			%{--</ul>--}%
		%{--</div>--}%
		%{--<div id="list-person" class="content scaffold-list" role="main">--}%
			%{--<h1><g:message code="default.list.label" args="[entityName]" /></h1>--}%
			%{--<g:if test="${flash.message}">--}%
				%{--<div class="message" role="status">${flash.message}</div>--}%
			%{--</g:if>--}%
			%{--<table>--}%
			%{--<thead>--}%
					%{--<tr>--}%
					%{----}%
						%{--<g:sortableColumn property="name" title="${message(code: 'person.name.label', default: 'Name')}" />--}%
					%{----}%
						%{--<g:sortableColumn property="email" title="${message(code: 'person.email.label', default: 'Email')}" />--}%
					%{----}%
						%{--<g:sortableColumn property="balance" title="${message(code: 'person.balance.label', default: 'Balance')}" />--}%
					%{----}%
					%{--</tr>--}%
				%{--</thead>--}%
				%{--<tbody>--}%
				%{--<g:each in="${personInstanceList}" status="i" var="personInstance">--}%
					%{--<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">--}%
					%{----}%
						%{--<td><g:link action="show" id="${personInstance.id}">${fieldValue(bean: personInstance, field: "name")}</g:link></td>--}%
					%{----}%
						%{--<td>${fieldValue(bean: personInstance, field: "email")}</td>--}%
					%{----}%
						%{--<td>${fieldValue(bean: personInstance, field: "balance")}</td>--}%
					%{----}%
					%{--</tr>--}%
				%{--</g:each>--}%
				%{--</tbody>--}%
			%{--</table>--}%
			%{--<div class="pagination">--}%
				%{--<g:paginate total="${personInstanceCount ?: 0}" />--}%
			%{--</div>--}%
		%{--</div>--}%
	%{--</body>--}%
%{--</html>--}%
