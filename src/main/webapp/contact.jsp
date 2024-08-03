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
    <title>Contact Us - Let's Shop</title>
    <%@ include file="components/common_css_js.jsp" %>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;

        }
        .contact-container {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            padding: 50px 0;
        }
        .contact-form {
            background-color: #ffffff;
            padding: 40px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 45%;
            width: 100%;
        }
        .contact-form h2 {
            margin-bottom: 30px;
            text-align: left;
            font-size: 24px;
            font-weight: bold;
        }
        .contact-form .form-group {
            margin-bottom: 20px;
        }
        .contact-form .form-control {
            border-radius: 0;
            box-shadow: none;
            height: 45px;
        }
        .contact-form .btn-primary {
            background-color: #000;
            border-color: #000;
            border-radius: 0;
            padding: 10px 20px;
            width: 100%;
        }
        .contact-form .btn-primary:hover {
            background-color: #333;
            border-color: #333;
        }
        .contact-info {
            max-width: 45%;
            padding-top: 50px;
            width: 100%;
        }
        .contact-info h4 {
            margin-bottom: 20px;
            text-transform: uppercase;
            font-size: 18px;
            font-weight: bold;
        }
        .contact-info p, .contact-info a {
            margin-bottom: 15px;
            color: #000;
        }
        .contact-info a {
            text-decoration: none;
        }
        .contact-info a:hover {
            text-decoration: underline;
        }
        .social-icons {
            display: flex;
            gap: 15px;
            margin-top: 20px;
        }
        .social-icons i {
            font-size: 24px;
            color: #000;
        }
    </style>
</head>
<body>
<%@ include file="components/navbar.jsp" %>
<%@ include file="components/message.jsp" %>
<div class="container">
    <div class="contact-container">
        <div class="contact-form">
            <h2>Contact</h2>
            <h4>Send us a message</h4><br>
            <form>
                <div class="form-group">
                    <label for="name">Name*</label>
                    <input type="text" class="form-control" id="name" placeholder="Name">
                </div>
                <div class="form-group">
                    <label for="email">Email*</label>
                    <input type="email" class="form-control" id="email" placeholder="Email">
                </div>
                <div class="form-group">
                    <label for="message">Message</label>
                    <textarea class="form-control" id="message" rows="4" placeholder="Type message here..."></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
        <div class="contact-info">
            <h4>Our Address</h4>
            <p>Let's Shop, Inc.<br>
                123 abc <br>
                x street , UT 84003</p><br/>
            <h4>Our Social</h4>
            <div class="social-icons">
                <a href="#"><i class="fab fa-facebook"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-youtube"></i></a>
                <a href="#"><i class="fab fa-tiktok"></i></a>
            </div><br/>
            <h4>Email Us</h4>
            <p>For Product Questions/Concerns, Brand Information & General Inquiries:</p>
            <a href="mailto:sizzle.developer@gmail.com">sizzle.developer@gmail.com</a>
            <br/><p>Visit our corporate website Let's Shop:<br/>
                <a href="#">www.letshop.com</a></p>
        </div>
    </div>
</div>
<%@ include file="components/common_modal.jsp" %>
</body>
</html>
