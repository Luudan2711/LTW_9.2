<%@ page import="java.util.*" %>
<%
    // Get or create cart in session
    Map<String, Map<String, Object>> cart = (Map<String, Map<String, Object>>) session.getAttribute("cart");
    if (cart == null) {
        cart = new HashMap<>();
        session.setAttribute("cart", cart);
    }
    
    String productCode = request.getParameter("productCode");
    String quantityStr = request.getParameter("quantity");
    
    // If adding a new product
    if (productCode != null && quantityStr == null) {
        Map<String, Object> item = cart.get(productCode);
        if (item == null) {
            item = new HashMap<>();
            item.put("code", productCode);
            item.put("quantity", 1);
            
            // Set product details based on code
            if ("8601".equals(productCode)) {
                item.put("name", "86 (the band) - True Life Songs and Pictures");
                item.put("price", 14.95);
            } else if ("pf01".equals(productCode)) {
                item.put("name", "Paddlefoot - The first CD");
                item.put("price", 12.95);
            } else if ("pf02".equals(productCode)) {
                item.put("name", "Paddlefoot - The second CD");
                item.put("price", 14.95);
            } else if ("jr01".equals(productCode)) {
                item.put("name", "Joe Rut - Genuine Wood Grained Finish");
                item.put("price", 14.95);
            }
            cart.put(productCode, item);
        } else {
            // Increase quantity if item already exists
            int currentQty = (Integer) item.get("quantity");
            item.put("quantity", currentQty + 1);
        }
    }
    
    // If updating quantity
    if (productCode != null && quantityStr != null) {
        int newQty = Integer.parseInt(quantityStr);
        if (newQty > 0) {
            Map<String, Object> item = cart.get(productCode);
            if (item != null) {
                item.put("quantity", newQty);
            }
        } else {
            // Remove item if quantity is 0
            cart.remove(productCode);
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Murach's Java Servlets and JSP</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>

<h1>Your cart</h1>

<% if (cart.isEmpty()) { %>
    <p>Your cart is empty.</p>
<% } else { %>
<table>
  <tr>
    <th>Quantity</th>
    <th>Description</th>
    <th>Price</th>
    <th>Amount</th>
    <th></th>
  </tr>
  <%
    double total = 0;
    for (Map<String, Object> item : cart.values()) {
        String code = (String) item.get("code");
        String name = (String) item.get("name");
        int quantity = (Integer) item.get("quantity");
        double price = (Double) item.get("price");
        double amount = price * quantity;
        total += amount;
  %>
  <tr>
    <td>
      <form action="cart.jsp" method="post">
        <input type="hidden" name="productCode" value="<%= code %>">
        <input type="text" name="quantity" value="<%= quantity %>" size="2">
        <input type="submit" value="Update">
      </form>
    </td>
    <td><%= name %></td>
    <td>$<%= String.format("%.2f", price) %></td>
    <td>$<%= String.format("%.2f", amount) %></td>
    <td>
      <form action="cart.jsp" method="post">
        <input type="hidden" name="productCode" value="<%= code %>">
        <input type="hidden" name="quantity" value="0">
        <input type="submit" value="Remove Item">
      </form>
    </td>
  </tr>
  <% } %>
  <tr>
    <td colspan="3"><strong>Total:</strong></td>
    <td><strong>$<%= String.format("%.2f", total) %></strong></td>
    <td></td>
  </tr>
</table>
<% } %>

<p><b>To change the quantity</b>, enter the new quantity 
      and click on the Update button.</p>
  
<form action="index.jsp" method="get">
  <input type="submit" value="Continue Shopping">
</form>

<form action="checkout.jsp" method="get">
  <input type="submit" value="Checkout">
</form>

</body>
</html>