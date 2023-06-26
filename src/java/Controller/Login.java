package Controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import DaoImpl.UserDaoImpl;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author haimi
 */
public class Login extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {
        User account = (User) request.getSession().getAttribute("account");
        if (account == null) {
            String email = "";
            String password = "";
            Cookie ck[] = request.getCookies();
            for (Cookie ck1 : ck) {
                if (ck1.getName().equalsIgnoreCase("email")) {
                    email = ck1.getValue();
                }
                if (ck1.getName().equalsIgnoreCase("password")) {
                    password = ck1.getValue();
                }
            }
            request.setAttribute("email", email);
            request.setAttribute("password", password);
            request
                    .getRequestDispatcher("/common/login.jsp")
                    .forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/admin");
        }
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {
        User account = (User) request.getSession().getAttribute("user");
        if (account == null) {
            UserDaoImpl userDao = new UserDaoImpl();
            String email = request.getParameter("email").trim();
            String password = request.getParameter("password").trim();
            // check validate password
            if (!isValid(password)) {
                request.setAttribute("email", email);
                request.setAttribute("password", password);
                request.setAttribute("errorPassword", true);
                request
                        .getRequestDispatcher("common/login.jsp")
                        .forward(request, response);
            } else {
                User userLogin = new User(email, password);
                User user = userDao.login(userLogin);
                if (user.getId() == 0) {
                    request.setAttribute("login", false);
                    request.setAttribute("email", email);
                    request.setAttribute("password", password);
                    request
                            .getRequestDispatcher("common/login.jsp")
                            .forward(request, response);
                } else {
                    if (request.getParameter("remember") != null) {
                        Cookie userCookie = new Cookie("email", user.getEmail());
                        Cookie passCookie = new Cookie("password", user.getPassword());
                        userCookie.setMaxAge(60 * 60 * 24);
                        passCookie.setMaxAge(60 * 60 * 24);
                        response.addCookie(userCookie);
                        response.addCookie(passCookie);
                    }
                    request.getSession().setAttribute("user", user);
                    response.sendRedirect(request.getContextPath() + "/admin");
                }
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/admin");
        }
    }

    public static boolean isValid(String password) {
        String PASSWORD_PATTERN
                = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()–[{}]:;',?/*~$^+=<>]).{8,16}$";
        Pattern pattern = Pattern.compile(PASSWORD_PATTERN);
        Matcher matcher = pattern.matcher(password);
        return matcher.matches();
    }
}
