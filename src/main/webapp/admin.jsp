<%@ page import="entity.User" %>
<%@ page import="dao.Categorydao" %>
<%@ page import="helper.FactoryProvider" %>
<%@ page import="entity.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="helper.Helper" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    User user = (User) session.getAttribute("current-user");
    System.out.println("admin.jsp " + user);
    if (user == null) {
        session.setAttribute("message", "You are not signed in");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equalsIgnoreCase("normal")) {
            session.setAttribute("message", "You cannot access this page..!");
            response.sendRedirect("normal.jsp");
            return;
        }
    }
%>
<%
    Categorydao category = new Categorydao(FactoryProvider.getFactory());
    List<Category> catelist =category.listCategory();

    //getting count

    Map<String , Long> m = Helper.getCounts(FactoryProvider.getFactory());
%>
<html>
<head>
    <title>Admin</title>
    <%@ include file="components/common_css_js.jsp" %>
    <style>
        .card:hover{
            background: #e2e2e2;
            cursor: pointer;
        }
    </style>
</head>
<body>
<%@ include file="components/navbar.jsp" %>
<%@ include file="components/message.jsp" %>

<div class="container">
    <br/><h1>Admin Panel</h1>
    <div class="row mt-4">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body text-center">
                    <img src="images/user1.png" class="img-fluid" style="max-width: 100px" alt="user"/>
                    <h4><i><%=m.get("Usercount")%></i></h4>
                    <h3 class="text-uppercase text-muted">Users</h3>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card">
                <div class="card-body text-center">
                    <img src="images/categories2.png" class="img-fluid" style="max-width: 100px" alt="categories"/>
                    <h4><i><%=catelist.size()%></i></h4>
                    <h3 class="text-uppercase text-muted">Categories</h3>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card">
                <div class="card-body text-center">
                    <img src="images/products1.png" class="img-fluid" style="max-width: 100px" alt="product"/>
                    <h4><i><%=m.get("Productcount")%></i></h4>
                    <h3 class="text-uppercase text-muted">Products</h3>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col md-6">
            <div class="card" data-toggle="modal" data-target="#categorymodal">
                <div class="card-body text-center">
                    <div class="container">
                        <img src="images/categories3.png" style="max-width: 100px;" class="img-fluid" alt="add category"/>
                    </div>
                    <br/><p class="text-muted"><i>Click here to add new category</i></p>
                    <h3 class="text-uppercase text-muted">Add Category</h3>
                </div>
            </div>
        </div>
        <div class="col md-6">
            <div class="card" data-toggle="modal" data-target="#productmodal">
                <div class="card-body text-center">
                    <div class="container">
                        <img src="images/product2.png" style="max-width: 100px;" class="img-fluid" alt="add category"/>
                    </div>
                    <br/><p class="text-muted"><i>Click here to add new product</i></p>
                    <h3 class="text-uppercase text-muted">Add Products</h3>
                </div>
            </div>
        </div>
    </div>
</div>

<%--Add category modal--%>

<!-- Modal -->
<div class="modal fade" id="categorymodal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header custom_bg text-white">
                <h5 class="modal-title" id="exampleModalLabel1"> Add category </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="Productop" method="post">
                    <input type="hidden" name="operation" value="addcategory"></input>
                    <div class="form-group">
                        <input type="text" class="form-control" name="catetitle" placeholder="Add category title" required/>
                    </div>
                    <div class="form-group">
                        <textarea style="height: 200px;" class="form-control" name="catedetail" placeholder="Enter details" required></textarea>
                    </div>
                    <div class="container text-center">
                        <button type="submit" class="btn btn-outline-success">Add Category</button>
                        <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>

<%--finish--%>

<%--Add product modal--%>

<!-- Modal -->
<div class="modal fade" id="productmodal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header custom_bg text-white">
                <h5 class="modal-title" id="exampleModalLabel">Add product</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="Productop" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="operation" value="addproduct"></input>
                    <div class="form-group">
                        <input type="text" class="form-control" name="productname" placeholder="Add product title" required/>
                    </div>
                    <div class="form-group">
                        <textarea style="height: 100px;" class="form-control" name="productdescription" placeholder="Enter details" required></textarea>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="productprice" placeholder="Add price" required/>
                    </div>
                    <div class="form-group">
                        <input type="number" class="form-control" name="productquantity" placeholder="Add quantity" required/>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="productdiscount" placeholder="Add discount" required/>
                    </div>


                    <div class="form-group">
                        <select name="proId" class="form-control" id="" required>
                            <option selected disabled>Choose category</option>
                           <%
                                for(Category c : catelist){
                           %>
                                <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="productimage">Add product image</label>
                        <input type="file" class="form-control-file" name="productimage" id="productimage" accept="image/*" required>
                    </div>
                    <div class="container text-center">
                        <button type="submit" class="btn btn-outline-success">Add Product</button>
                        <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="components/common_modal.jsp"%>
<%--finish--%>
</body>
</html>
