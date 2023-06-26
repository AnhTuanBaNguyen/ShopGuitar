<%-- 
    Document   : register
    Created on : Nov 29, 2022, 1:11:34 AM
    Author     : hami
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login Form</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- Font Awesome -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
            />
        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
            />
        <!-- MDB -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css"
            rel="stylesheet"
            />
    </head>
    <body class="img js-fullheight" style="background-image: url(assets/img/bg.jpg); background-repeat: no-repeat; background-size: cover">
        <section class="vh-100" style="background-color: #508bfc">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card shadow-2-strong" style="border-radius: 1rem">
                            <div class="card-body p-5 text-center">
                                <form action="login" method="post">

                                    <h3 class="mb-3">Sign in</h3>
                                    <c:if test="${login == 'false'}">
                                        <div class="alert alert-danger" role="alert">
                                            Your email or password is incorrect!
                                        </div>
                                    </c:if>


                                    <c:if test="${errorPassword == 'true'}">
                                        <div class="alert alert-danger" role="alert"> 
                                            Must contain at least one number and one uppercase and
                                            lowercase letter and special characters, the length is 8-16
                                            characters!</div>

                                    </c:if>

                                    <div class="form-outline mb-4">
                                        <input
                                            type="email"
                                            required
                                            id="email"
                                            value="${email}" 
                                            name="email"
                                            class="form-control form-control-lg"
                                            />
                                        <label class="form-label" for="typeEmailX-2">Email</label>
                                    </div>
                                    <div class="form-outline mb-4 needs-validation" >
                                        <input
                                            type="password"
                                            required
                                            id="password"
                                            pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,16}$"
                                            value="${password}" 
                                            name="password"
                                            class="form-control form-control-lg"
                                            />
                                        <label class="form-label" for="typePasswordX-2"
                                               >Password</label
                                        > 

                                    </div>


                                    <!-- Checkbox -->
                                    <div class="d-flex justify-content-between mb-4">
                                        <div class="form-check d-flex justify-content-star">
                                            <input
                                                class="form-check-input"
                                                type="checkbox"
                                                id="remember"
                                                name="remember"
                                                />
                                            <label class="form-check-label" for="form1Example3">
                                                Remember password
                                            </label>
                                        </div>

                                        <div class="text-center">
                                            <a
                                                href="<%=request.getContextPath()%>/register"
                                                class="text-black"
                                                >Sign Up</a
                                            >
                                        </div>
                                    </div>


                                    <button class="btn btn-primary btn-lg btn-block" type="submit">
                                        Login
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Login</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">

                            <form action="login" class="signin-form needs-validation" novalidate method="post">
                                <div class="form-group">
                                    <input id="username" type="text" class="form-control" placeholder="Username" required value="${username}" name="username"/>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>  
                                    <div class="invalid-feedback">
                                        Please input username.
                                    </div> 
                                </div>
                                <div class="input-group">

                                    <input id="password" type="password" class="form-control"   
                                           pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,16}$"
                                           placeholder="Password" required value="${password}" name="password" />
                                    <span class="input-group-text" style="border-radius: 0 40px 40px 0;">
                                        <i class="fa fa-eye-slash" id="togglePassword" 
                                           style="cursor: pointer"></i>
                                    </span>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                    <div class="invalid-feedback">
                                        Must contain at least one number and one uppercase and lowercase letter and special characters, the length is 8-16 characters
                                    </div> 
                                </div>
                                <div class="d-flex my-3  justify-content-between">
                                    <div class="form-check">
                                        <input
                                            type="checkbox"
                                            class="form-check-input uf-form-check-input"
                                            id="remember"
                                            name="remember"
                                            />
                                        <label for="remember">
                                            Remember Me
                                        </label>
                                    </div>
                                    <a href="<%=request.getContextPath()%>/reset_password">Forgot password?</a>
                                </div>
                                <div class="form-group">
                                    <input type="submit" class="btn btn-primary btn-block btn-lg" name="btn-register" value="Login">
                                </div>

                            </form>
                            <div class="text-center pt-4">
                                <p class="m-0 ">Do not have an account? <a href="<%=request.getContextPath()%>/register" class="text-black">Sign Up</a></p>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>

        </section>




        <!-- MDB -->
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"
        ></script>
    </body>
</html>

