
<%@ page import="parreira.Txn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'txn.label', default: 'Txn')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-txn" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-txn" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
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
			<div class="pagination">
				<g:paginate total="${txnInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
