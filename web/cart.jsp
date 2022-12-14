<%-- 
    Document   : cart
    Created on : Nov 24, 2022, 12:47:06 PM
    Author     : chris
--%>

<%@page import="model.ProductsModel"%>
<%@page import="model.Product"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lato:wght@700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet"> 
        <link href="styles/cart-styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
        /*
        Cache Scriptlet
        */
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
        %>
        
        <!-- HEADER -->
        <%@ include file = "header.jsp" %>
        <!-- END OF HEADER -->
        <div class="cart-body">
        <div class="cart-container">
        <%
            if (session.getAttribute("username") == null)  {
                response.sendRedirect("LoginRedirect");
            }
            else    {
                ArrayList cartContents = (ArrayList)session.getAttribute("order-"+session.getAttribute("orderCounter"));
                if (cartContents.isEmpty())   {
                    out.println("<div class=\"no-item\">");
                    out.println("<p>It doesn't seem like you have anything in your cart right now.</p>");
                    out.println("</div>");
                }

                else    {
                    out.println("<div class=\"cart-list\">");
                    out.println("<div class=\"cart-header\">");
                    out.println("<h1 class=\"cart-heading\">Your Cart</h1>");
                    out.println("</div>");
                    out.println("<form name=\"remove\" id=\"remove\" action=\"RemoveFromCart\"></form>");
                    
                    out.println("<div class=\"cart-div\">");
                    out.println("<div class=\"table-guide\">");
                    out.println("<p class=\"product-title\">product</p>");
                    out.println("<p class=\"price-title\">price</p>");
                    out.println("<p class=\"quantity-title\">quantity</p>");
                    out.println("<p class=\"edit-title\"></p>");
                    out.println("<p class=\"remove-title\"></p>");
                    out.println("</div>");
                    
                    for (int i = 0; i < cartContents.size(); i++)   {
                        Product product = (Product)cartContents.get(i);
                    
                        out.println("<div class=\"cart-item\">");
                            out.println("<div class=\"top-cart-item\">");
                            out.println("<div class=\"product\">");
                                out.println("<img class=\"product-image\" src=\"products/"+product.getName()+"/"+product.getName()+".jpg\">");
                                out.println("<p class=\"item-title\">"+ProductsModel.formatName(product.getName())+"</p>");
                            out.println("</div>");
                            out.println("<p class=\"price-column\"><b>&#8369</b>"+String.format("%.2f", (Double)product.getPrice())+"</p>");
                            out.println("<p class=\"quantity-column\">"+product.getQuantity()+"</p>");
                            out.println("</div>");
                            out.println("<div class=\"bottom-cart-item\">");
                            out.println("<div class=\"edit-column\">");
                            out.println("<a href=\"Products?name="+product.getName()+"\"><button class=\"edit-button\">Edit</button></a>");
                            out.println("</div>");
                            out.println("<div class=\"remove-column\">");
                            out.println("<button class=\"remove-button\" form=\"remove\" name=\"remove\" value=\""+product.getName()+"\">Remove</button>");
                            out.println("</div>");
                            out.println("</div>");
                        out.println("</div><br>");
                    }
                    out.println("</div>");
                    out.println("</div>");
                    
                    out.println("<div class=\"checkout-list\">");
                    out.println("<div class=\"checkout-container\">");
                    out.println("<form name=\"Checkout\" id=\"Checkout\" action=\"Checkout\"></form>");
                    out.println("<button class=\"checkout-button\" form=\"Checkout\" name=\"Checkout\" value=\"Checkout\">Checkout</button>");
                    out.println("</div>");
                    out.println("</div>");
                }
            }
        %>
        </div>
        </div>
    </body>
</html>
