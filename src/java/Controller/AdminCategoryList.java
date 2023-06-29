/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DaoImpl.CategoryDao;
import Model.Category;
import Model.Page;
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
public class AdminCategoryList extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
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

        int page = request.getParameter("page") != null
                ? Integer.parseInt(request.getParameter("page"))
                : 1;
        String status = request.getParameter("status");
        List<Category> categories = categoryDao.getAll(page);
        int count = categoryDao.getAll().size();
        int endpage = count / 5;
        if (count % 5 != 0) {
            endpage++;
        }
        Page pageClass = new Page(page, endpage);
        List<String> pages = pageClass.listPage();
        request.setAttribute("page", Integer.toString(page));
        request.setAttribute("pages", pages);
        request.setAttribute("categories", categories);
        request.setAttribute("status", status);
        request
                .getRequestDispatcher("/admin/category/categoryList.jsp")
                .forward(request, response);
    }
}
