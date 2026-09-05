<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>

<%
    // Authentication check
    Boolean loggedIn =
        (Boolean) session.getAttribute("loggedIn");

    if (loggedIn == null || !loggedIn) {
%>
        <jsp:forward page="login.jsp" />
<%
        return;
    }

    // Get cart from session
    ArrayList<String> cart =
        (ArrayList<String>) session.getAttribute("cart");

    // Remove item
    String removeItem =
        request.getParameter("remove");

    if (removeItem != null &&
        cart != null) {

        cart.remove(removeItem);
    }
%>

<!DOCTYPE html>
<html>

<head>

<title>Shopping Cart</title>

<style>

body {
    margin: 0;
    font-family: Arial;
    background: #f4f6f9;
}

.container {
    inline-size: 80%;
    margin: 30px auto;
}

table {
    inline-size: 100%;
    background: white;
    border-collapse: collapse;
}

th, td {
    padding: 15px;
    border: 1px solid #ddd;
}

th {
    background: #007bff;
    color: white;
}

button {
    padding: 8px 12px;
    border: none;
    cursor: pointer;
    border-radius: 5px;
}

.checkout {
    background: green;
    color: white;
}

.remove {
    background: red;
    color: white;
}

</style>

</head>

<body>

<jsp:include page="header.jsp" />

<div class="container">

<h1>Your Shopping Cart</h1>

<%
if (cart == null || cart.size() == 0) {
%>

    <h3>Your cart is empty.</h3>

    <a href="catalog.jsp">
        Continue Shopping
    </a>

<%
} else {
%>

<table>

<tr>
    <th>Product</th>
    <th>Action</th>
</tr>

<%
for (String item : cart) {
%>

<tr>

    <td>
        <%= item %>
    </td>

    <td>

        <a href="cart.jsp?remove=<%= item %>">

            <button class="remove">
                Remove
            </button>

        </a>

    </td>

</tr>

<%
}
%>

</table>

<br>

<h3>
    Total Items: <%= cart.size() %>
</h3>

<a href="catalog.jsp">

    <button>
        Continue Shopping
    </button>

</a>

<a href="checkout.jsp">

    <button class="checkout">
        Proceed to Checkout
    </button>

</a>

<%
}
%>

</div>

<jsp:include page="footer.jsp" />

</body>
</html>