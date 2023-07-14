<%-- 
    Document   : cart
    Created on : Dec 8, 2022, 11:55:55 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <title>GSharing</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">
        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <h1>Hello World!</h1>
         <%@include file="header.jsp"  %>
        <div class="container-fluid">
            <!--Cart Table-->
            <div class="shopping-cart-container" style="margin-bottom: 60px;">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h1 class="box-title" style="text-align: center;">View cart </h1>
                        <table class="table table-striped" style="width: 100%">
                            <thead>
                                <tr>
                                    <th >Product Name</th>
                                    <th class="product-name">Product Img</th>
                                    <th class="product-price">Price</th>
                                    <th class="product-quantity">Quantity</th>
                                    <th class="product-subtotal">Total</th>
                                    <th class="product-subtotal">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="cart" items="${carts}">
                                    <tr class="cart_item">
                                        <td >
                                            <a href="#">${cart.getProduct().getName()}</a>
                                        </td>
                                        <td class="product-thumbnail" data-title="Product Name">
                                            <a class="prd-thumb" href="#">
                                                <figure><img width="113" height="113" src="${cart.getProduct().getImage()}" alt="img product in cart"></figure>
                                            </a>
                                        </td>

                                        <td class="product-price" data-title="Price">
                                            <div class="price price-contain">
                                                <ins><span class="price-amount"><span class="currencySymbol">$</span>${cart.getProduct().getPrice()}</span></ins>
                                            </div>
                                        </td>
                                        <td class="product-quantity" data-title="Quantity">
                                            <div class="quantity-box type1">
                                                <a href="<%=request.getContextPath()%>/cart/update?pid=${cart.getProduct().id}&quantity=${cart.quantity-1}" style="font-size: 30px;text-decoration: none;"> - </a>
                                                 ${cart.quantity} 
                                                <a href="<%=request.getContextPath()%>/cart/update?pid=${cart.getProduct().id}&quantity=${cart.quantity+1}"  style="font-size: 30px;text-decoration: none;"> + </a>
                                            </div>
                                        </td>
                                        <td class="product-subtotal" data-title="Total">
                                            <div class="price price-contain">
                                                <ins><span class="price-amount"><span class="currencySymbol">$</span>${cart.getProduct().getPrice()*cart.getQuantity()}</span></ins>
                                            </div>
                                        </td>
                                        <td class="product-subtotal" data-title="Total">
                                            <div class="action">
                                                <a href="<%=request.getContextPath()%>/cart/delete?pid=${cart.getProduct().getId()}"style="color: red; font-size: 40px;" class="remove"><i class="fa-solid fa-trash"></i></a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>

                                <tr class="cart_item wrap-buttons">
                                    <td class="wrap-btn-control" colspan="4">
                                        <a class="btn back-to-shop" href="./product" style="background-color: #00ffff">Back to Shop</a>
                                    </td>
                                    <td class="wrap-btn-control" colspan="2">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>
        <%@include file="footer.jsp"  %>
    </body>
</html>
