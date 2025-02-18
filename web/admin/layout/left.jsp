<%@page import="Model.*" import="Dao.*" import="DaoImpl.*" import="java.util.ArrayList" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
        integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
crossorigin="anonymous"></script>
<style>
    a {
        text-decoration: none;
        color: black
    }
    .fadeOutLeft{
        animation: fadeOutLeft 0.3s ease-in;
        animation-fill-mode: forwards;
    }
    @keyframes fadeOutLeft {
        0% {
            opacity: 1;
            transform: translateX(0);
        }
        50%{
            opacity: 1;
            transform: skewX(-5deg);
        }
        75%{
            opacity: 1;
            transform: skewX(5deg);
        }
        100% {
            opacity: 0;
            transform: translateX(-100%);
        }
    }
    body{
        background-color: aliceblue;
    }
</style>

<div style="
     float: left;
     height: 100vh;
     width: 20%;
     ">

</div>

<div class="flex-column flex-shrink-0 p-3 text-bg-dark" style="
     height: 100vh;
     width: 20%;
     position: fixed;
     z-index: 2;
     "
     >
    <a href="<%= request.getContextPath()%>/home" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
        <svg class="bi pe-none me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
        <span class="fs-4">Gaming Sharing</span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
        <li class="nav-item">
            <a href="<%= request.getContextPath()%>/admin" class="nav-link  text-white <%=request.getServletPath().equals("/admin/dashBoard.jsp")?"active":""%>" aria-current="page">
                <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#home"/></svg>
                Dashboard
            </a>
        </li>
        <li>
            <a href="<%= request.getContextPath()%>/admin/category" class="nav-link text-white <%=request.getServletPath().startsWith("/admin/category")?"active":""%>">
                <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
                Category
            </a>
        </li>
        <li>
            <a href="<%= request.getContextPath()%>/admin/product" class="nav-link text-white <%=request.getServletPath().startsWith("/admin/product")?"active":""%>">
                <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
                Product
            </a>
        </li>
    </ul>
    <hr>
    <div class="d-flex justify-content-center">
                <a href="<%= request.getContextPath()%>/logout" class="nav-link text-white <%=request.getServletPath().startsWith("/staff/product")?"active":""%>">
                    Sign out
                </a>
    </div>
</div>