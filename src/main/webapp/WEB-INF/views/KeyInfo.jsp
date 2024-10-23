<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
				<%@ taglib prefix="ocaParchis" tagdir="/WEB-INF/tags" %>

					<!DOCTYPE html
						PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
					<html>

					<head>
						<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
						<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
						<script src="/webjars/jquery/jquery.min.js"></script>
						<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

						<ocaParchis:layout pageName="Clan">
							<title>CocAPIC</title>
					</head>

<body style="background-color:#ececec;">
    <div class="container">
        <h1 class="text-center">Listado de API Keys</h1>
        <div class="text-right">
            <a href="/apikeys/nueva" class="btn btn-primary">Crear nueva API Key</a>
        </div>
        <br>
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>API Key</th>
                    <th>Descripcion</th>
                    <th>Activa</th>
                    <th>IP</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <!-- Comprobamos si la lista de apikeys no está vacía -->
                <c:if test="${not empty apiKeys}">
                    <c:forEach var="apiKey" items="${apiKeys}">
                        <tr>
                            <td><c:out value="${apiKey.id}" /></td>
                            <td><c:out value="${apiKey.apiKey}" /></td>
                            <td><c:out value="${apiKey.descripcion}" /></td>
                            <td>
                                <c:choose>
                                    <c:when test="${apiKey.activa}">
                                        <span class="label label-success">Activa</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="label label-danger">Inactiva</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td><c:out value="${apiKey.ip}" /></td>
                            <td>
                                <a href="/apikey/eliminar/${apiKey.id}" class="btn btn-danger btn-sm" onclick="return confirm('¿Estás seguro que deseas eliminar esta API Key?');">Eliminar</a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                <!-- En caso de que no haya apikeys, mostramos un mensaje -->
                <c:if test="${empty apiKeys}">
                    <tr>
                        <td colspan="6" class="text-center">No hay API Keys disponibles.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</body>
</ocaParchis:layout>
</html>
