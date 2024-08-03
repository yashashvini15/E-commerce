package controller;

import java.io.*;

import dao.Categorydao;
import dao.Productdao;
import entity.Category;
import entity.Product;
import helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@MultipartConfig
@WebServlet(name = "Productop", value = "/Productop")
public class Productop extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("home.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String operation = req.getParameter("operation");


        Categorydao catedao = new Categorydao(FactoryProvider.getFactory());

        if(operation.trim().equals("addcategory")){

            try{

                String category_title = req.getParameter("catetitle");

                String category_description = req.getParameter("catedetail");

                Category category = new Category(category_title, category_description);

                int category_id = catedao.saveCategory(category);
                System.out.println("Productdao.addcategory : id = "+category_id);
                System.out.println("Category Saved");

                HttpSession httpSession = req.getSession();
                req.setAttribute("message" ,"Category is saved successfully id is "+category_id);
                resp.sendRedirect("admin.jsp");
            }catch (Exception e){
                e.printStackTrace();
                System.out.println("Productdao.addcategory : "+e);
            }

        } else if (operation.trim().equals("addproduct")) {

            try{
                String productName = req.getParameter("productname");
                String productDescription = req.getParameter("productdescription");
                int productPrice = Integer.parseInt(req.getParameter("productprice").trim().replace(",",""));
                int productQuantity = Integer.parseInt(req.getParameter("productquantity").trim());
                int productDiscount = Integer.parseInt(req.getParameter("productdiscount").trim().replace("%",""));
                int productCategoryId = Integer.parseInt(req.getParameter("proId").trim());
                Part filepic = req.getPart("productimage");


                Product product = new Product(productName , productDescription , productPrice ,productQuantity , filepic.getSubmittedFileName(), productDiscount );

                Category categoryId = catedao.getCategoryId(productCategoryId);

                product.setCategory(categoryId);

                Productdao productdao = new Productdao(FactoryProvider.getFactory());

                HttpSession httpSession = req.getSession();

                boolean f = productdao.saveProduct(product);


                // pic upload
                String imagesPath = getServletContext().getRealPath("images");
                String productPath = imagesPath + File.separator + "product";
                File dir = new File(productPath);

                // Ensure the directory exists
                if (!dir.exists()) {
                    dir.mkdirs(); // Create the directory if it does not exist
                }

                String path = productPath + File.separator + filepic.getSubmittedFileName();
                System.out.println(path);

                try (FileOutputStream fos = new FileOutputStream(path); InputStream is = filepic.getInputStream()) {
                    byte[] data = new byte[is.available()];
                    is.read(data);
                    fos.write(data);
                } catch (FileNotFoundException e) {
                    e.printStackTrace();
                    httpSession.setAttribute("message", "Details saved but product image cannot be stored, try again.");
                    resp.sendRedirect("admin.jsp");
                    return; // Ensure no further processing occurs
                }
                if(f){
                    System.out.println("Product Saved");
                    httpSession.setAttribute("message" ,"Product is saved");
                    resp.sendRedirect("admin.jsp");
                }else{
                    httpSession.setAttribute("message" , "Something went wrong , try again..!");
                    resp.sendRedirect("admin.jsp");
                }
            }catch (Exception e){
                e.printStackTrace();
                System.out.println("Add Product , Productop : "+e.getMessage());
                HttpSession httpSession = req.getSession();
                httpSession.setAttribute("message" , "Something went wrong , try again..!");
                resp.sendRedirect("admin.jsp");
            }
        }
    }

    public void destroy() {
    }
}