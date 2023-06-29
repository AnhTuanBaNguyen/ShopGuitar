/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DaoImpl.CategoryDao;
import DaoImpl.ProductDao;
import Model.Category;
import Model.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.List;

/**
 *
 * @author User
 */
@MultipartConfig
public class AdminProductAdd extends HttpServlet {
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
        CategoryDao categoryDao = new CategoryDao();
        List<Category> categories = categoryDao.getAll();
        request.setAttribute("categories", categories);
        request
                .getRequestDispatcher("/admin/product/productAdd.jsp")
                .forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDao dao = new ProductDao();
        CategoryDao categoryDao = new CategoryDao();
        List<Category> categories = categoryDao.getAll();

        String name = request.getParameter("name") != null
                ? request.getParameter("name").trim()
                : "";
        Part filePart = request.getPart("image");
        int categoryId = request.getParameter("categoryId") != null
                ? Integer.parseInt(request.getParameter("categoryId"))
                : 0;
        int price = request.getParameter("price") != null
                ? Integer.parseInt(request.getParameter("price"))
                : 0;
        String description = request.getParameter("description") != null
                ? request.getParameter("description").trim()
                : "";

        Product product = new Product(
                categoryId,
                name,
                description,
                price
        );
        System.out.println(product.toString());
        if (dao.insert(product)) {
            product = dao.getLast();
            String image = dao.uploadImage(filePart, request, product);
            product.setImage(image);
            boolean status = dao.update(product);
            if (status) {
                response.sendRedirect(
                        "/admin/product?status=" + status
                );
            } else {
                request.setAttribute("categories", categories);
                request
                        .getRequestDispatcher("/admin/product/productAdd.jsp")
                        .forward(request, response);
            }
        } else {
            request.setAttribute("categories", categories);
            request
                    .getRequestDispatcher("/admin/product/productAdd.jsp")
                    .forward(request, response);
        }
    }
}
