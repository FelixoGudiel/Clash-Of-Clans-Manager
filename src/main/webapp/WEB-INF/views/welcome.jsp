<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="ocaParchis" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css" />
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

<ocaParchis:layout pageName="home">
    <title>CocAPIC</title>
</head>
<body style="background-color:#ececec">
    <h1 style="font-family:monospace; text-align:center;">CocApiC</h1>
    
    <div class="container" style="margin-top: 20px;">
        <div class="card" style="background-color: #ffffff; padding: 20px; border-radius: 10px;">
            <p>IP: ${globalConfigIp}</p>
            <p>API Key lista: 
                <c:choose>
                    <c:when test="${not empty apiKeyCode}">
                        <i class="bi bi-check-circle-fill" style="color: green;"></i>
                    </c:when>
                    <c:otherwise>
                        <i class="bi bi-x-circle-fill" style="color: red;"></i>
                    </c:otherwise>
                </c:choose>
            </p>
        </div>
    </div>
</body>
</ocaParchis:layout>
</html>
