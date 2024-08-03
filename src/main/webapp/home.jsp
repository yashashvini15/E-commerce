<%@ page import="dao.Productdao" %>
<%@ page import="helper.FactoryProvider" %>
<%@ page import="entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.Categorydao" %>
<%@ page import="entity.Category" %>
<%@ page import="helper.DescriptionShortner" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Home</title>
    <%@ include file="components/common_css_js.jsp" %>
    <style>
        .borderless-card {
            border: none;
            box-shadow: none;
        }
        .price-section {
            text-align: center;
        }
        .discount-percentage {
            color: red;
            font-size: 20px;
            margin-right: 5px;
        }
        .original-price {
            text-decoration: line-through;
            color: grey;
            font-size: 14px;
            display: block;
        }
        .discounted-price {
            color: black;
            font-size: 24px;
        }
    </style>
</head>
<body>
<%@ include file="components/navbar.jsp" %>
<%@ include file="components/message.jsp" %>

<div class="container-fluid">
    <div class="row mt-3 mx-4">
        <!-- Show categories -->
        <div class="col-md-2">
            <div class="list-group">
                <a href="home.jsp?category=all" class="list-group-item list-group-item-action active bottom-0 fw-bold text-center custom-nav text-light" aria-current="true">
                    <strong>Categories</strong>
                </a>
                <%
                    Categorydao categorydao = new Categorydao(FactoryProvider.getFactory());
                    List<Category> catelist = categorydao.listCategory();
                    for(Category category : catelist){
                %>
                <a href="home.jsp?category=<%=category.getCategoryId()%>" class="list-group-item list-group-item-action">
                    <strong><%=category.getCategoryTitle()%></strong>
                </a>
                <%
                    }
                %>
            </div>
        </div>

        <!-- Show products -->
        <div class="col-md-10">
            <div class="row">
                <div class="col-md-12">
                    <div class="card-columns">
                        <%
                            String cateId = request.getParameter("category");
                            System.out.println("home.jsp : category id : " + cateId);

                            Productdao productdao = new Productdao(FactoryProvider.getFactory());
                            List<Product> list = null;
                            try {
                                if(cateId == null || cateId.trim().equals("all")) {
                                    list = productdao.getAllProduct();
                                } else {
                                    int id = Integer.parseInt(cateId.trim());
                                    list = productdao.getAllProductByID(id);
                                }
                            } catch (NumberFormatException e) {
                                list = productdao.getAllProduct(); // Default to all products if parsing fails
                            }

                            if(list != null) {
                                for(Product product : list) {
                                    double originalPrice = product.getProductPrice();
                                    double discount = product.getProductDiscount();
                                    double discountedPrice = originalPrice - (originalPrice * discount / 100);
//                                    System.out.println(product.getProductName());
                        %>
                        <div class="card borderless-card">
                            <div class="container text-center">
                                <img src="images/product/<%= product.getProductPhoto() %>" style="max-width: 300px; max-height: 200px; width: auto;" class="card-img-top" alt="product image"/>
                            </div>
                            <div class="card-body text-center">
                                <h5 class="card-title"><%= DescriptionShortner.shortDescription(product.getProductName()) %></h5>
                                <p class="card-text"><%= DescriptionShortner.shortDescription(product.getProductDescription()) %></p>
                                <div class="price-section">
                                    <span class="discount-percentage">-<%= (int) discount %>%</span>
                                    <span class="discounted-price">₹<%= String.format("%,d", (int) discountedPrice) %></span>
                                    <span class="original-price">M.R.P.: ₹<%= String.format("%,d", (int) originalPrice) %></span>
                                </div>
                            </div>
                            <div class="card-footer text-center borderless-card">
                                <button class="btn custom_bg text-white" onclick="add_to_cart('<%= product.getProductId() %>', `<%=DescriptionShortner.shortestDescription(product.getProductName())%>`, '<%= discountedPrice %>');">Add to cart</button>
                                <%-- use (``) or ("") this otherwise because of special character or string literals it will generate an error on console and will not function properly
                                `<%=DescriptionShortner.shortestDescription(product.getProductName())%>`                         --%>
                                <button class="btn btn-success text-white">Buy now</button>
                            </div>
                        </div>
                        <%
                                }
                                if(list.size() == 0) {
                                    out.println("<h3>No items are present in this category...!</h3>");
                                }
                            } else {
                                out.println("<h3>Error retrieving products. Please try again later.</h3>");
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
