<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>
<style>
      a:link {
         color: black;
         background-color: transparent;
         text-decoration: none;
      }
      a:visited {
         color: black;
         background-color: transparent;
         text-decoration: none;
      }
      a:active {
         color: yellow;
         background-color: transparent;
      }
   </style>

<title>Projeto AGRO</title>

<c:set value="${pageContext.request.contextPath}" var="contextPath" />

<link href="${contextPath}/css/bootstrap.css" rel="stylesheet">
<link href="${contextPath}/css/small-business.css" rel="stylesheet">

</head>

<body>

	<nav class="navbar navbar-fixed-top" style="background-color:deepskyblue;" role="navigation">
		<div class="container">
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav" style="width: 100%; display: flex; justify-content: space-between; font-family: 'Arial Black'; font-size: 22px; font-weight: bold">
					<li><a href="${contextPath}/producao">Desperdício</a></li>
					<li><a href="${contextPath}/cultura">Culturas</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<h1>Projeto AGRO</h1>

				<p class="toolbar">

					<a class="create btn btn-default"
						href="${contextPath}/producao/form?page=producao-nova">Novo Item
						</a> <span class="alert"></span>
				</p>

				<c:if test="${not empty messages}">
					<h3 class="alert alert-warning">${messages}</h3>
				</c:if>

				<table class="table table-striped">
					<thead>
						<tr>
							<th data-field="id">Identificador</th>
							<th data-field="name">Nome</th>
							<th data-field="qtdProducao">Produção</th>
							<th data-field="qtdConsumo">Consumo</th>
							<th data-field="desperdicio">Saldo (Desperdiçado)</th>
							<th data-field="ano">Ano</th>
							<th class="actions" width="220">Opções</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${producoes}" var="producao" varStatus="i">
							<tr>
								<td>${producao.id}</td>
								<td>${producao.cultura.nomeCultura}</td>
								<td>${producao.quantidade}</td>
								<td>${consumos[i.index].quantidade}</td>
								<td class="value" style="color: red"><c:out value="${producao.quantidade-consumos[i.index].quantidade}"/></td>
								<td>${producao.ano}</td>

								<td class="actions"><form:form
										action="${contextPath}/producao/${producao.id}" method="delete">

										<a class="btn btn-success btn-xs"
											href="${contextPath}/producao/${producao.id}">Producao</a>
										<a class="btn btn-success btn-xs"
											href="${contextPath}/producao/consumo/${consumos[i.index].id}">Consumo</a>
										<a class="btn btn-warning btn-xs"
											href="${contextPath}/producao/form?page=producao-editar&id=${producao.id}">Editar</a>
										<input type="submit" value="Excluir"
											class="btn btn-danger btn-xs">
									</form:form></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<hr>
	</div>

	<!-- jQuery -->
	<script src="${contextPath}/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="${contextPath}/js/bootstrap.min.js"></script>

</body>
</html>