<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    <title>Culturas - Listagem</title>
    
    <c:set value="${pageContext.request.contextPath}" var="contextPath"/>
    
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
				
				<h1>Culturas</h1>
				
				<p class="toolbar">
				
					<a class="create btn btn-default" href="${contextPath}/cultura/form?page=cultura-nova">Nova Cultura</a>
	
					<span class="alert"></span>
				</p>
				
				<c:if test="${not empty messages}">
					<h3 class="alert alert-warning">${messages}</h3>
				</c:if>
				
				<table class="table table-striped">
					<thead>
						<tr>
						    <th data-field="id">Identificador</th>
							<th data-field="name">Cultura</th>
							<th data-field="name">Tipo da Cultura</th>
							<th class="actions" width="220">Opções</th>
						</tr>
					</thead>
					<tbody>
					
					<c:forEach items="${culturas}" var="cultura">
						<tr>
							<td>${cultura.idCultura}</td>
							<td>${cultura.nomeCultura}</td>
							<td>${cultura.tipo}</td>
							<td class="actions">
							
								<form:form action="${contextPath}/cultura/${cultura.idCultura}" method="delete">
								
									<a class="btn btn-success btn-xs" href="${contextPath}/cultura/${cultura.idCultura}">Detalhes</a>
									<a class="btn btn-warning btn-xs" href="${contextPath}/cultura/form?page=cultura-editar&id=${cultura.idCultura}">Editar</a>
									<input type="submit" value="Excluir" class="btn btn-danger btn-xs">
								</form:form>
								
							</td>
						</tr>
					</c:forEach>
                    </tbody>
				</table>
            </div>
        </div>
		<hr>
    </div>

    <!-- jQuery -->
    <script src="${js}/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${contextPath}/js/bootstrap.min.js"></script>

</body>
</html>