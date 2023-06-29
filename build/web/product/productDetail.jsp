<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html lang="en">
    <head>
        <title>GSharing</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">
        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    </head>


    <%@include file="../header.jsp"  %>
    <!-- Shop Detail Start -->
    <div class="container  bg-light pb-5">
        <div class="row px-xl-5 my-3">
            <div class="col-lg-5 my-3">
                <div id="product-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-item active" style="text-align:center">
                        <img style="width: 70%; height: 70%;" 
                             src="${product.image}"
                             alt="${product.name}">
                    </div>
                </div>
            </div>

            <div class="col-lg-7 h-auto  bg-light mb-30 pr-3 ">
                <div class="h-100 pt-3">
                    <h3>${product.name}</h3>
                    <h3 class="font-weight-semi-bold mb-3 text-success">
                        <script type="text/javascript">
                            var str = parseInt(${product.getPrice()})
                            document.write(str.toLocaleString('vi', {style: 'currency', currency: 'VND'}));
                        </script>
                    </h3>
                    <div class="d-flex mb-3">
                        <strong class="text-dark mr-3">Danh mục:</strong>
                        ${product.category.name}
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="bg-light ">
                    <div class="nav nav-tabs mb-4">
                        <a class="nav-item nav-link text-dark active" data-toggle="tab" href="#tab-pane-1">Mô tả</a>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="tab-pane-1">
                            ${product.description}          
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Shop Detail End -->


    <!-- Products Start -->
    <div class="container">
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Có thể bạn sẽ thích</span></h2>
        <div class="row px-xl-5">
            <c:forEach items="${products}" var="p">
                <div class=" col-lg-3 col-md-4 col-sm-6 pb-1 content product-item bg-light">
                    <div class="product-img position-relative overflow-hidden">
                        <img class="img-fluid w-100" src="${p.image}" alt="">
                    </div>
                    <div class="text-center py-4">
                        <a class="h6 text-decoration-none text-truncate" href="<%=request.getContextPath()%>/product?categoryId=${p.categoryId}">${p.getCategory().getName()}</a>
                        <div class="d-flex align-items-center justify-content-center mt-2">
                            <a class="h5 text-decoration-none text-truncate" href="<%=request.getContextPath()%>/product/detail?id=${p.id}">${p.name}</a>
                        </div>
                        <div class="d-flex align-items-center justify-content-center mt-2">
                            <h6>
                                <script type="text/javascript">
                                    var str = parseInt(${p.price})
                                    document.write(str.toLocaleString('vi', {style: 'currency', currency: 'VND'}));
                                </script>
                            </h6>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <!-- Products End -->
    <%@include file="../footer.jsp"  %>

</html>


