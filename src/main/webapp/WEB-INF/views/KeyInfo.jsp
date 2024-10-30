<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="ocaParchis" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <ocaParchis:layout pageName="Apikey">
        <title>CocAPIC</title>
    </ocaParchis:layout>
    <style>
        /* Estilo para limitar la longitud de la columna y ocultar contenido inicialmente */
        .api-key-column {
            max-width: 900px; 
            word-wrap: break-word;
            white-space: normal;
        }

        .api-key-full {
            display: none;
        }
    </style>
    <script>
        function toggleApiKey(id) {
            var fullApiKey = document.getElementById("fullApiKey-" + id);
            var btn = document.getElementById("btn-" + id);

            // Alternar la visibilidad
            if (fullApiKey.style.display === "none" || fullApiKey.style.display === "") {
                fullApiKey.style.display = "block"; 
                btn.textContent = "Ocultar"; 
            } else {
                fullApiKey.style.display = "none"; 
                btn.textContent = "Ver más";
            }
        }
    </script>
</head>

<body style="background-color:#ececec;">
    <div class="container">
        <h1 class="text-center">Listado de API Keys</h1>
        <div class="text-right">
            <a href="/apikey/nueva" class="btn btn-danger">Crear nueva API Key</a>
        </div>
        <br>
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>API Key</th>
                        <th>IP</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:if test="${not empty apiKeys}">
                        <c:forEach var="apiKey" items="${apiKeys}">
                            <tr>
                                <td><c:out value="${apiKey.id}" /></td>
                                <td class="api-key-column">
                                    <span id="fullApiKey-${apiKey.id}" class="api-key-full"><c:out value="${apiKey.apiKeyCode}" /></span>
                                    <button type="button" id="btn-${apiKey.id}" class="btn btn-link btn-sm" onclick="toggleApiKey(${apiKey.id})">Ver más</button>
                                </td>
                                <td><c:out value="${apiKey.ip}" /></td>
                                <td>
                                    <a href="/apikey/eliminar/${apiKey.id}" class="btn btn-danger btn-sm" onclick="return confirm('¿Estás seguro que deseas eliminar esta API Key?');">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty apiKeys}">
                        <tr>
                            <td colspan="6" class="text-center">No hay API Keys disponibles.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</body>

</html>
