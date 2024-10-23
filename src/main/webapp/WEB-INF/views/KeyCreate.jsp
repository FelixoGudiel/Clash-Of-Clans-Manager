<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ocaParchis" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CocAPIC - Crear nueva API Key</title>
    
    <!-- CSS de Bootstrap -->
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    
    <!-- Scripts de Bootstrap y jQuery -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

    <!-- Estilos personalizados -->
    <style>
        body {
            background-color: #ececec;
            font-family: monospace;
        }

        h1 {
            color: #dc3545;
            text-align: center;
            padding-top: 20px;
        }

        .form-container {
            margin: 0 auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }

        .btn-danger:hover {
            background-color: #c82333;
        }

        .form-group label {
            color: #dc3545;
        }

        .form-container {
            max-width: 600px;
            margin-top: 50px;
        }
    </style>
</head>

<ocaParchis:layout pageName="Clan">
<body>
    <div class="container form-container">
        <h1>Crear nueva API Key</h1>
        <form action="${pageContext.request.contextPath}/apikey/nueva" method="POST" class="form-horizontal">
            <div class="form-group">
                <label for="apiKey">API Key:</label>
                <input type="text" class="form-control" id="apiKey" name="apiKey" required>
            </div>

            <div class="form-group">
                <label for="description">Descripción:</label>
                <input type="text" class="form-control" id="description" name="description" required>
            </div>

            <div class="form-group">
                <label for="active">¿Activa?:</label>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="active" name="active">
                    <label class="form-check-label" for="active">Sí</label>
                </div>
            </div>

            <div class="form-group">
                <label for="ip">IP:</label>
                <input type="text" class="form-control" id="ip" name="ip" required>
            </div>

            <button type="submit" class="btn btn-danger btn-block">Guardar</button>
        </form>
    </div>
</body>
</ocaParchis:layout>
</html>