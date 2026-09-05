<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String username =
        (String) session.getAttribute("username");

    int headerCartCount = 0;

    java.util.ArrayList<String> headerCart =
        (java.util.ArrayList<String>) session.getAttribute("cart");

    if (headerCart != null) {
        headerCartCount = headerCart.size();
    }
%>

<style>

.header {
    background: #111827;
    color: white;
    padding: 16px 5%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 2px 8px rgba(0,0,0,0.15);
}

.store-name {
    font-size: 24px;
    font-weight: bold;
}

.header-right {
    display: flex;
    align-items: center;
    gap: 18px;
}

.welcome {
    color: #d1d5db;
}

.username {
    color: white;
    font-weight: bold;
}

.header-link {
    color: white;
    text-decoration: none;
    font-weight: 600;
    padding: 8px 12px;
    border-radius: 6px;
}

.header-link:hover {
    background: #374151;
}

.cart-link {
    background: #2563eb;
    color: white;
    text-decoration: none;
    font-weight: bold;
    padding: 9px 15px;
    border-radius: 8px;
}

.cart-link:hover {
    background: #1d4ed8;
}

.logout-link {
    color: #fca5a5;
    text-decoration: none;
    font-weight: 600;
    padding: 8px 12px;
    border-radius: 6px;
}

.logout-link:hover {
    background: #7f1d1d;
    color: white;
}

@media (max-width: 768px) {

    .header {
        flex-direction: column;
        gap: 15px;
    }

    .header-right {
        flex-wrap: wrap;
        justify-content: center;
    }

}

</style>


<div class="header">

    <div class="store-name">
        My Online Store
    </div>


    <div class="header-right">

        <div class="welcome">

            Welcome,

            <span class="username">
                <%= username != null ? username : "Guest" %>
            </span>

        </div>


        <a href="catalog.jsp"
           class="header-link">

            Catalog

        </a>


        <a href="cart.jsp"
           class="cart-link">

            Cart
            (<%= headerCartCount %>)

        </a>


        <a href="logout.jsp"
           class="logout-link">

            Logout

        </a>

    </div>

</div>