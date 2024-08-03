package controller;

import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "Logout", value = "/Logout")
public class Logout extends HttpServlet {
    private String message;

    public void init() {
        message = "Logout!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
      try{
          HttpSession httpSession = request.getSession();
          httpSession.removeAttribute("current-user");
          httpSession.setAttribute("message" ,"Signed Out");
          response.sendRedirect("login.jsp");
      }catch (Exception e){
          e.printStackTrace();
          System.out.println("Logout : "+e);
      }
    }

    public void destroy() {
    }
}