package controller;

import java.io.*;

import helper.Validator;
import entity.User;
import helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.exception.ConstraintViolationException;

@WebServlet(name = "Register", value = "/Register")
public class Register extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
       response.sendRedirect("home.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String phoneno = req.getParameter("phone");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email =req.getParameter("email");
        String address = req.getParameter("address");
        User user = new User(username, password,"normal" , email, phoneno, address, "image.jpg" );
        System.out.println("user "+user);
//        boolean value = Validator.validateRegister(user);
//        System.out.println("value "+value);

            try {
                Session session = FactoryProvider.getFactory().openSession();

                Transaction transaction = session.beginTransaction();

                Integer userId = (Integer) session.save(user);

                Validator valid = new Validator(user ,userId);

                if(valid.validateRegister(username ,password ,email ,phoneno ,address)){

                    transaction.commit();

                    System.out.println("Data Saved successfully");
                    System.out.println(userId + " " + username);

                    HttpSession httpSession = req.getSession();

                    httpSession.setAttribute("message", "Registration successfull for " + username + " your id is : " + userId);

                    resp.sendRedirect("login.jsp");

                    session.close();

                }else{
//                    System.out.println("value"+value);
                    HttpSession httpSession= req.getSession();
                    httpSession.setAttribute("message" , "All fields are required");
                    resp.sendRedirect("register.jsp");
                }

            } catch (ConstraintViolationException e) {

                resp.sendRedirect("register.jsp");
                HttpSession httpSession = req.getSession();

                httpSession.setAttribute("message", "Email Already existed , try again ");

                resp.sendRedirect("register.jsp");
            } catch (Exception e) {

                e.printStackTrace();

                System.out.println("Register : " + e);

                HttpSession httpSession = req.getSession();

                httpSession.setAttribute("message", "Something unexpected occur , try again ");

                resp.sendRedirect("register.jsp");
            }


    }

    public void destroy() {
    }
}