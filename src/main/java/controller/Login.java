package controller;

import java.io.*;

import dao.Userdao;
import entity.User;
import helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

@WebServlet(name = "Login", value = "/Login")
public class Login extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String useremail = String.valueOf(req.getParameter("email"));
        String userpassword = String.valueOf(req.getParameter("password"));

        try{

            Userdao userdao = new Userdao(FactoryProvider.getFactory());
            User user = userdao.getUserByEmailAndPassword(useremail , userpassword);
            HttpSession session =req.getSession();
            if(user==null){
                System.out.println("Signin failed");
                session.setAttribute("message","Invalid credentials , try again");
                resp.sendRedirect("login.jsp");
            }else{
                System.out.println("Signin successfull");
                session.setAttribute("current-user" ,user);
                System.out.println(session.getAttributeNames());

                if(user.getUserType().equalsIgnoreCase("admin")){
                    session.setAttribute("message","Sign in successfull admin");
                    resp.sendRedirect("admin.jsp");
                    System.out.println("Admin Signed in");
                } else if (user.getUserType().equalsIgnoreCase("normal")) {
                    session.setAttribute("message","Sign in successfull "+user.getUserName());
                    resp.sendRedirect("home.jsp");
                    System.out.println("user signed in");
                }else {
                    resp.sendRedirect("login.jsp");
                    session.setAttribute("message","Cannot signed in ,  We have not identified user ");
                }

//                session.removeAttribute("current-user");
            }

        }catch (Exception e){
            e.printStackTrace();
            System.out.println("Login : "+e);
        }

    }

    public void destroy() {
    }
}