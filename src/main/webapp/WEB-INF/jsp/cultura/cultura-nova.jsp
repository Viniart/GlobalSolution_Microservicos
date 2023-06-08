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

    <title>Culturas - Cadastro</title>
    
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
            <div class="col-lg-12">
                <div class="well" style="display: flex; flex-direction: column; align-items: center; justify-content: center">
					
					<h2>Cultura</h2>
					
					<form:form modelAttribute="culturaModel" action="${contextPath}/cultura" method="post"
							   style="display: flex;flex-direction: column;align-content: center;">
					
						<spring:hasBindErrors name="culturaModel">
							<div class="alert alert-danger" role="alert">
								<form:errors path="*" class="has-error" />
							</div>
						</spring:hasBindErrors>
					
						<div class="form-group">
							<label class="control-label" for="nome">Nome da Cultura:</label>
							<form:input type="text" path="nomeCultura" id="nomeCultura" class="form-control" maxlength="50" size="50" />
							<font color="red"><form:errors path="nomeCultura"/></font><br/>
                        </div>
                        <div class="form-group">
							<label class="control-label" for="tipo">Tipo da Cultura:</label>
							<form:input type="text" path="tipo" id="tipo" class="form-control" maxlength="50" size="50" />
							<font color="red"><form:errors path="tipo"/></font><br/>
                        </div>
						<hr/>
						
						<a class="btn btn-default btn-lg" href="${contextPath}/cultura">Cancelar</a>
						<button type="submit" class="btn btn-primary btn-lg">Salvar</button>
                            
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