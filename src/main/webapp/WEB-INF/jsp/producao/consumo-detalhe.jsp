<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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


<title>Consumo - Detalhe</title>

<c:set value="${pageContext.request.contextPath}" var="contextPath" />

<link href="${contextPath}/css/bootstrap.css" rel="stylesheet">
<link href="${contextPath}/css/small-business.css" rel="stylesheet">

</head>

<body>

	<nav class="navbar navbar-fixed-top" style="background-color: deepskyblue;"
		role="navigation">
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
			<div class="col-lg-12">
				<div class="well">

					<h2>Consumo</h2>

					<div class="form-group">
						<label class="control-label" for="nome">Ano:</label> <b>${consumo.ano}</b>
					</div>

					<div class="form-group">
						<label class="control-label" for="nome">Cultura:</label> <label
							class="label label-default">${consumo.cultura.nomeCultura}</label>
					</div>

					<div class="form-group">
						<label class="control-label" for="mensagem">Quantidade:</label> <label
							class="label label-default">${consumo.quantidade}</label>
					</div>

					<hr>

					<a class="btn btn-default btn-lg" href="${contextPath}/producao">Voltar</a>

					<br> <br>

				</div>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="${contextPath}/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="${contextPath}/js/bootstrap.min.js"></script>

</body>
</html>