<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    // ==============================
    // CHECK LOGIN
    // ==============================

    Boolean loggedIn =
        (Boolean) session.getAttribute("loggedIn");

    if (loggedIn == null || !loggedIn) {
%>

        <jsp:forward page="login.jsp" />

<%
        return;
    }


    // ==============================
    // GET SESSION CART
    // ==============================

    ArrayList<String> cart =
        (ArrayList<String>) session.getAttribute("cart");

    if (cart == null) {

        cart = new ArrayList<String>();

        session.setAttribute("cart", cart);
    }


    // ==============================
    // INITIALIZE APPLICATION TOTAL
    // ==============================

    synchronized (application) {

        Integer totalSold =
            (Integer) application.getAttribute("totalSold");

        if (totalSold == null) {

            application.setAttribute(
                "totalSold",
                0
            );
        }
    }


    // ==============================
    // GET REQUEST ACTION
    // ==============================

    String action =
        request.getParameter("action");

    String purchaseMessage = null;


    // ==============================
    // PURCHASE
    // ==============================

    if ("buy".equals(action) &&
        cart.size() > 0) {


        int purchasedItems =
            cart.size();


        synchronized (application) {

            Integer totalSold =
                (Integer) application.getAttribute("totalSold");

            if (totalSold == null) {
                totalSold = 0;
            }


            totalSold =
                totalSold + purchasedItems;


            application.setAttribute(
                "totalSold",
                totalSold
            );
        }


        // Clear current user's cart

        cart.clear();


        purchaseMessage =
            "Purchase completed successfully!";

    }


    // ==============================
    // GET APPLICATION TOTAL
    // ==============================

    Integer totalSold =
        (Integer) application.getAttribute("totalSold");

%>


<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Checkout</title>

    <script src="https://cdn.tailwindcss.com"></script>

    <style>

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f8fafc;
        }

        .checkout-box {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .success {
            color: #166534;
            background: #dcfce7;
            border: 1px solid #86efac;
            padding: 15px;
            border-radius: 8px;
            font-weight: bold;
        }

        .stats {
            background: #eff6ff;
            border: 1px solid #bfdbfe;
            border-radius: 10px;
            padding: 20px;
        }

    </style>

</head>


<body>


<!-- HEADER -->

<jsp:include page="header.jsp" />


<div class="max-w-5xl mx-auto
            px-6 py-10">


    <p class="text-sm text-gray-500">

        Home / Checkout

    </p>


    <h1 class="text-3xl font-bold
               text-gray-900 mt-2 mb-8">

        Checkout

    </h1>


    <div class="checkout-box p-8">


<%
    if (purchaseMessage != null) {
%>

        <div class="success mb-6">

            &#10003;

            <%= purchaseMessage %>

        </div>

<%
    }
%>


        <h2 class="text-2xl font-bold mb-5">

            Your Order

        </h2>


<%
    if (cart.size() == 0) {
%>


        <div class="bg-gray-50
                    rounded-lg
                    p-6 text-center">

            <h3 class="text-xl font-semibold">

                Your cart is empty.

            </h3>


            <p class="text-gray-500 mt-2">

                Add products before proceeding
                to checkout.

            </p>


            <a href="catalog.jsp"
               class="inline-block mt-5
                      bg-blue-600
                      hover:bg-blue-700
                      text-white
                      font-semibold
                      px-6 py-3
                      rounded-lg">

                Continue Shopping

            </a>

        </div>


<%
    } else {
%>


        <!-- ORDER ITEMS -->

        <ul class="space-y-3 mb-6">

<%
        for (String item : cart) {
%>

            <li class="bg-gray-50
                       border
                       rounded-lg
                       px-5 py-4">

                <%= item %>

            </li>

<%
        }
%>

        </ul>


        <p class="text-lg mb-6">

            Total Items:

            <b class="text-blue-600">

                <%= cart.size() %>

            </b>

        </p>


        <!-- CONFIRM PURCHASE -->

        <form action="checkout.jsp"
              method="post">

            <input
                type="hidden"
                name="action"
                value="buy">


            <button
                type="submit"
                class="bg-green-600
                       hover:bg-green-700
                       text-white
                       font-semibold
                       px-7 py-3
                       rounded-lg">

                Confirm Purchase

            </button>

        </form>


<%
    }
%>


        <!-- APPLICATION SCOPE -->

        <div class="stats mt-8">

            <h2 class="text-xl font-bold
                       text-gray-900">

                Store-Wide Statistics

            </h2>


            <p class="mt-3">

                Total Items Sold Across
                All Users:

                <b class="text-blue-600">

                    <%= totalSold %>

                </b>

            </p>


            <p class="text-sm text-gray-500 mt-2">

                This value uses the
                <b>application</b>
                implicit object.

            </p>

        </div>


        <div class="mt-6">

            <a href="catalog.jsp"
               class="text-blue-600
                      font-semibold">

                &larr; Go to Catalog

            </a>

        </div>


    </div>

</div>


<!-- FOOTER -->

<jsp:include page="footer.jsp" />


</body>

</html>