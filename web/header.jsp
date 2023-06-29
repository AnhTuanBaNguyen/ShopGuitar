<%-- 
    Document   : header
    Created on : Dec 5, 2022, 10:15:42 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta charset="utf-8">
    <title>GSharing</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page import="Model.*" import="Dao.*"  import="DaoImpl.*" import="java.util.List" %>
    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
    <!-- Navbar Start -->
    <div class="container-fluid bg-dark mb-30">
        <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0 mb-3 ">
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a href="<%=request.getContextPath()%>/" class="text-decoration-none my-2 d-flex flex-column">
                <span class="h6 text-uppercase text-primary bg-dark px-2 text-center">Guitar</span>
                <span class="h6 text-uppercase text-dark bg-primary px-2 text-center">Shop</span>
            </a> 
            <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
              
                <div class="navbar-nav ml-auto py-0 d-none d-lg-block">
                    <%
                         User user = (User) request.getSession().getAttribute("User");
                         if(user == null){
                    %>
                    <a href="<%=request.getContextPath()%>/login" class="btn px-0 ml-3">Đăng nhập</a>
                    <%
                    }else{
                    %>
                    <div class="btn-group">
                        <a  class="nav-item nav-link ml-3"  data-toggle="dropdown">${account.username}</a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <button class="dropdown-item" type="button" onclick="window.location.href = '<%=request.getContextPath()%>/logout'">Đăng xuất</button>
                        </div>
                    </div>
                    <%}%>
                </div>     
            </div>
        </nav>
    </div>

    <!-- Navbar End -->    