<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 8/1/2024
  Time: 07:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>About Us</title>
    <%@ include file="components/common_css_js.jsp" %>
    <style>
        .about-header {
            background-color: #f8f9fa;
            padding: 50px 0;
            text-align: center;
        }
        .about-header h1 {
            font-size: 2.5rem;
            font-weight: bold;
        }
        .about-header p {
            font-size: 1.2rem;
            margin-top: 10px;
        }
        .about-section {
            padding: 50px 0;
        }
        .about-section .about-img {
            max-width: 100%;
            border-radius: 10px;
        }
        .about-section .about-content {
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .about-section .about-content h2 {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .about-section .about-content p {
            font-size: 1.1rem;
            margin-bottom: 15px;
        }
        .testimonial-section {
            background-color: #343a40;
            color: #fff;
            padding: 50px 0;
            text-align: center;
        }
        .testimonial-section blockquote {
            font-size: 1.5rem;
            font-style: italic;
        }
        .testimonial-section .author {
            margin-top: 20px;
            font-size: 1.2rem;
            font-weight: bold;
        }
    </style>
</head>
<body>
<%@ include file="components/navbar.jsp" %>
<%@ include file="components/message.jsp" %>

<div class="about-header">
    <div class="container">
        <h1>Welcome to Let's Shop</h1>
        <p>Your one-stop destination for all your shopping needs</p>
    </div>
</div>

<div class="about-section">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-6">
                <img src="images/shopping.jpg" alt="About Us" class="about-img">
            </div>
            <div class="col-md-6">
                <div class="about-content">
                    <h2>About Us</h2>
                    <p>
                        At Let's Shop, we are dedicated to providing the best online shopping experience. Our mission is to offer a wide variety of products at competitive prices while ensuring top-notch customer service.
                    </p>
                    <p>
                        We believe in the power of community and strive to create a platform where customers can find everything they need. From electronics to fashion, home goods to beauty products, Let's Shop has it all.
                    </p>
                    <p>
                        Our team is passionate about curating the latest trends and delivering them to your doorstep. Thank you for choosing Let's Shop as your trusted online retailer.
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="testimonial-section">
    <div class="container">
        <blockquote>
            "Be who you are and say what you feel, because those who mind don't matter, and those who matter don't mind."
        </blockquote>
        <div class="author">
            - Bernard M. Baruch
        </div>
    </div>
</div>

<%@ include file="components/common_modal.jsp" %>
</body>
</html>
