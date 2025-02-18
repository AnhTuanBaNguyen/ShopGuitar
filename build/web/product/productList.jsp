<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <title>GSharing</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">
        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <style>
            .content{
                display: none;
            }
        </style>
        <script>
            $(document).ready(function () {
                $(".content").slice(0, 20).show();
                $("#loadMore").on("click", function (e) {
                    e.preventDefault();
                    $(".content:hidden").slice(0, 20).slideDown();
                    if ($(".content:hidden").length == 0) {
                        $("#loadMore").text("Hết sản phẩm").addClass("noContent");
                    }
                });
            })
        </script>
    </head>

    <body>
        <%@include file="../header.jsp"  %>
        <div class="container-fluid">
            <div class="row px-xl-5">
                <div class="col-lg-3 col-md-4">
                    <form action="product" method="get" >  
                        <div class="row">
                            <input type="reset" class="col m-1 btn btn-outline-dark" style="width: -webkit-fill-available" value=Xóa hết>
                            <input type="submit" class="col m-1 btn btn-primary" style="width: -webkit-fill-available" value="Tìm kiếm">
                        </div>
                        <h5 class="section-title position-relative text-uppercase my-3"><span class="bg-secondary pr-3">Tìm kiếm </span></h5>
                        <div class="bg-light p-2 mb-30">
                            <input name="search" type="text" class="form-control" placeholder="Search" value="${search}">
                        </div>
                        <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Bộ Lọc </span></h5>
                        <div class="bg-light p-2 mb-30">
                            <div class="form-check">
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input
                                        type="radio"
                                        class="custom-control-input"
                                        id="sortNameAsc"
                                        name="sort"
                                        ${sort == 'sortNameAsc'? 'checked':''}
                                        value="sortNameAsc"
                                        />
                                    <label class="custom-control-label" for="sortNameAsc"> 
                                        Tên từ a đến z   
                                    </label>
                                </div>
                            </div> 
                            <div class="form-check">
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input
                                        type="radio"
                                        class="custom-control-input"
                                        id="sortNameDesc"
                                        name="sort"
                                        ${sort == 'sortNameDesc'? 'checked':''}  
                                        value="sortNameDesc"
                                        />
                                    <label class="custom-control-label" for="sortNameDesc"> 
                                        Tên từ z đến a 
                                    </label>
                                </div>
                            </div> 
                            <div class="form-check">
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input
                                        type="radio"
                                        class="custom-control-input"
                                        id="sortPriceDesc"
                                        name="sort"
                                        ${sort == 'sortPriceDesc'? 'checked':''}  
                                        value="sortPriceDesc"
                                        />
                                    <label class="custom-control-label" for="sortPriceDesc"> 
                                        Giá từ cao xuống thấp
                                    </label>
                                </div>
                            </div> 
                            <div class="form-check">
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input
                                        type="radio"
                                        class="custom-control-input"
                                        id="sortPriceAsc"
                                        name="sort"
                                        ${sort == 'sortPriceAsc'? 'checked':''}  
                                        value="sortPriceAsc"
                                        />
                                    <label class="custom-control-label" for="sortPriceAsc"> 
                                        Giá từ thấp đến cao 
                                    </label>
                                </div>
                            </div> 
                            <div class="form-check">
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input
                                        type="radio"
                                        class="custom-control-input"
                                        id="sortNew"
                                        name="sort"
                                        ${sort == 'sortNew'? 'checked':''}  
                                        value="sortNew"
                                        />
                                    <label class="custom-control-label" for="sortNew"> 
                                        Mới nhất 
                                    </label>
                                </div>
                            </div> 
                        </div>
                        <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Giá </span></h5>
                        <div class="bg-light p-2 mb-30">
                            <div class="">
                                <label>Từ</label>
                                <input name="minPrice" class="form-control" placeholder="$0" type="number" min="0" max="1000000000" value="${minPrice}" />
                            </div>
                            <div class="">
                                <label>Đến</label>
                                <input name="maxPrice" class="form-control" placeholder="$0" type="number" min="0" max="1000000000" value="${maxPrice}" />
                            </div><!-- card-body.// -->
                        </div>
                        <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Danh Mục</span></h5>
                        <div class="bg-light p-2 mb-30">
                            <c:forEach items="${categories}" var="c">
                                <div class="form-check">
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input
                                            type="radio"
                                            class="custom-control-input"
                                            id="${c.id}"
                                            name="categoryId"
                                            ${c.id == categoryId? 'checked':''}
                                            value="${c.id}"
                                            />
                                        <label class="custom-control-label" for="${c.id}"> 
                                            ${c.name}
                                        </label>
                                    </div>
                                </div> 
                            </c:forEach>
                        </div>
                        <div class="row">
                            <input type="reset" class="col m-1 btn btn-outline-dark" style="width: -webkit-fill-available" value="Xóa">
                            <input type="submit" class="col m-1 btn btn-primary" style="width: -webkit-fill-available" value="Tìm kiếm">
                        </div>
                    </form>
                </div>
                <div class="col-lg-9 col-md-8">
                    <div class="row  ">

                        <c:forEach items="${products}" var="p">
                            <div class="col-lg-3 col-md-4 col-sm-6 pb-1 content">
                                <div class="product-item bg-light mb-4">
                                    <div class="product-img position-relative overflow-hidden">
                                        <img class="img-fluid w-100" src="${p.image}" alt="">
                                    </div>
                                    <div class="text-center py-4">
                                        <a class="h6 text-decoration-none text-truncate" href="<%=request.getContextPath()%>/product?categoryId=${p.categoryId}">${p.getCategory().getName()}</a>              
                                        <div class="d-flex align-items-center justify-content-center mt-2">
                                            <a class="h5 text-decoration-none text-truncate" href="<%=request.getContextPath()%>/product/detail?id=${p.id}">${p.name}</a>
                                        </div>
                                            <div class="d-flex align-items-center flex-column justify-content-center mt-2" style="flex-direction: column;">
                                            <h6> 
                                                <script type="text/javascript">
                                                    var str = parseInt(${p.price})
                                                    document.write(str.toLocaleString('vi', {style: 'currency', currency: 'VND'}));
                                                </script>
                                            </h6>
                                            <a href="<%=request.getContextPath()%>/cart/add?pid=${p.getId()}&quantity=1" class="btn btn-warning">ADD TO CART</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="text-center mb-5 btn-load">
                        <button type="button" class="btn btn-outline-primary rounded-3" id="loadMore" >
                            Xem Thêm
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="../footer.jsp"  %>
    </body>
</html>


