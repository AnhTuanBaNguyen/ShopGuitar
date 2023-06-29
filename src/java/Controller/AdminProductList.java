/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DaoImpl.ProductDao;
import Model.Page;
import Model.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author User
 */
public class AdminProductList extends HttpServlet {
 // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {
        ProductDao productDao = new ProductDao();
        int page = request.getParameter("page") != null
                ? Integer.parseInt(request.getParameter("page"))
                : 1;
        String status = request.getParameter("status");
        List<Product> products = productDao.getAll(page);
        int count = productDao.getAll().size();
        int endpage = count / 5;
        if (count % 5 != 0) {
            endpage++;
        }
        Page pageClass = new Page(page, endpage);
        List<String> pages = pageClass.listPage();
        request.setAttribute("page", Integer.toString(page));
        request.setAttribute("pages", pages);
        request.setAttribute("products", products);
        request.setAttribute("status", status);
        request
                .getRequestDispatcher("/admin/product/productList.jsp")
                .forward(request, response);
    }
}
