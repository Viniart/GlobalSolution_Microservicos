<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>

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


<title>Produção - Editar</title>

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

		<!-- Call to Action Well -->
		<div class="row">
			<div class="col-lg-12">
				<div class="well" style="display: flex; flex-direction: column; align-items: center; justify-content: center">

					<h2>Producao</h2>

					<form:form modelAttribute="producaoModel"
						action="${contextPath}/producao/${producaoModel.id}" method="put">

						<spring:hasBindErrors name="produtoModel">
							<div class="alert alert-danger" role="alert">
								<form:errors path="*" class="has-error" />
							</div>
						</spring:hasBindErrors>

						<div class="form-group">
							<label class="control-label" for="ano">Ano:</label>
							<form:input type="text" path="ano" id="ano"
								class="form-control" maxlength="50" size="50" />
							<font color="red"><form:errors path="ano" /></font><br />
						</div>

						<div class="form-group">
							<label class="control-label" for="cultura">Cultura:</label>

							<form:select path="cultura.idCultura">
								<form:options items="${culturas}" itemValue="idCultura"
									itemLabel="nomeCultura" />
							</form:select>
						</div>

						<div class="form-group">
							<label class="control-label" for="quantidade">Quantidade Produzida:</label>
							<form:input type="number" path="quantidade" id="quantidade" class="form-control"
								maxlength="50" size="50" />
							<font color="red"><form:errors path="quantidade" /></font><br />
						</div>

						<div class="form-group">
							<label class="control-label" for="consumo">Quantidade Consumida:</label>
							<form:input type="number" path="consumo" id="consumo" class="form-control"
								maxlength="50" size="50" />
							<font color="red"><form:errors path="consumo" /></font><br />
						</div>

						<hr>

						<a class="btn btn-default btn-lg" href="${contextPath}/producao">Cancelar</a>
						<button type="submit" class="btn btn-primary btn-lg">Gravar</button>

						<br>
						<br>
					</form:form>

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