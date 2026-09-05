<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    // Check login
    Boolean loggedIn =
        (Boolean) session.getAttribute("loggedIn");

    if (loggedIn == null || !loggedIn) {
%>
        <jsp:forward page="login.jsp" />
<%
        return;
    }


    // Get session cart
    ArrayList<String> cart =
        (ArrayList<String>) session.getAttribute("cart");

    if (cart == null) {
        cart = new ArrayList<String>();
        session.setAttribute("cart", cart);
    }


    // Get product from request
    String product = request.getParameter("product");

    String message = null;


    // Add product to cart
    if (product != null && !product.trim().equals("")) {

        cart.add(product);

        message = product + " added to your cart!";
    }


    // Cart count
    int cartCount = cart.size();
%>


<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Product Catalog</title>

    <script src="https://cdn.tailwindcss.com"></script>

    <style>

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f8fafc;
        }

        .product-card {
            transition: 0.3s;
        }

        .product-card:hover {
            transform: translateY(-5px);
        }

    </style>

</head>


<body>


<!-- HEADER -->

<jsp:include page="header.jsp" />


<div class="max-w-7xl mx-auto px-6 py-8">


    <!-- PAGE HEADER -->

    <div class="flex flex-col md:flex-row
                justify-between items-center mb-8">


        <div>

            <p class="text-sm text-gray-500 mb-2">
                Home / Catalog
            </p>

            <h1 class="text-3xl font-bold text-gray-900">
                Product Catalog
            </h1>

            <p class="text-gray-500 mt-2">
                Choose your products and add them to your cart.
            </p>

        </div>


        <!-- VIEW CART -->

        <div class="mt-5 md:mt-0">

            <a href="cart.jsp"
               class="inline-flex items-center gap-3
                      bg-blue-600 hover:bg-blue-700
                      text-white font-semibold
                      px-6 py-3 rounded-lg shadow">

                View Cart

                <span class="bg-white text-blue-600
                             font-bold rounded-full
                             min-w-[28px] h-[28px]
                             flex items-center
                             justify-center px-2">

                    <%= cartCount %>

                </span>

            </a>

        </div>

    </div>


    <!-- SUCCESS MESSAGE -->

<%
    if (message != null) {
%>

    <div class="mb-6 p-4 rounded-lg
                bg-green-100
                border border-green-300
                text-green-800
                font-semibold">

        <%= message %>

    </div>

<%
    }
%>


    <!-- FILTER BAR -->

    <div class="bg-white rounded-lg shadow
                p-5 mb-8">

        <div class="flex flex-wrap gap-4">

            <button
                class="px-5 py-2 border rounded-lg
                       hover:bg-gray-100">

                All Products

            </button>

            <button
                class="px-5 py-2 border rounded-lg
                       hover:bg-gray-100">

                Electronics

            </button>

            <button
                class="px-5 py-2 border rounded-lg
                       hover:bg-gray-100">

                Best Sellers

            </button>

            <button
                class="px-5 py-2 border rounded-lg
                       hover:bg-gray-100">

                Offers

            </button>

        </div>

    </div>


    <!-- PRODUCT GRID -->

    <div class="grid grid-cols-1
                sm:grid-cols-2
                lg:grid-cols-4
                gap-6">
        <!-- PRODUCT 2 -->

        <div class="product-card bg-white
                    rounded-xl shadow p-5">

            <img
                src="https://images.unsplash.com/photo-1511707171634-5f897ff02aa9"
                class="w-full h-48 object-cover rounded-lg"
                alt="iPhone">

            <h2 class="text-lg font-bold mt-4">
                Apple iPhone 15 Pro Max
            </h2>

            <p class="text-gray-500 text-sm mt-2">
                Premium smartphone with advanced camera.
            </p>

            <div class="mt-3 text-yellow-500">
                5/5 Rating
            </div>

            <p class="text-green-600
                      font-bold text-xl mt-3">

                Rs. 1,35,000

            </p>

            <form action="catalog.jsp"
                  method="post"
                  class="mt-4">

                <input
                    type="hidden"
                    name="product"
                    value="Apple iPhone 15 Pro Max">

                <button
                    type="submit"
                    class="w-full bg-blue-600
                           hover:bg-blue-700
                           text-white font-semibold
                           py-3 rounded-lg">

                    Add to Cart

                </button>

            </form>

        </div>


        <!-- PRODUCT 3 -->

        <div class="product-card bg-white
                    rounded-xl shadow p-5">

            <img
                src="https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0"
                class="w-full h-48 object-cover rounded-lg"
                alt="iPad">

            <h2 class="text-lg font-bold mt-4">
                iPad Pro
            </h2>

            <p class="text-gray-500 text-sm mt-2">
                High-performance tablet with stunning display.
            </p>

            <div class="mt-3 text-yellow-500">
                5/5 Rating
            </div>

            <p class="text-green-600
                      font-bold text-xl mt-3">

                Rs. 89,000

            </p>

            <form action="catalog.jsp"
                  method="post"
                  class="mt-4">

                <input
                    type="hidden"
                    name="product"
                    value="iPad Pro">

                <button
                    type="submit"
                    class="w-full bg-blue-600
                           hover:bg-blue-700
                           text-white font-semibold
                           py-3 rounded-lg">

                    Add to Cart

                </button>

            </form>

        </div>


        <!-- PRODUCT 4 -->

        <div class="product-card bg-white
                    rounded-xl shadow p-5">

            <img
                src="https://images.unsplash.com/photo-1607853202273-797f1c22a38e"
                class="w-full h-48 object-cover rounded-lg"
                alt="PlayStation">

            <h2 class="text-lg font-bold mt-4">
                PlayStation 5
            </h2>

            <p class="text-gray-500 text-sm mt-2">
                Next-generation gaming console.
            </p>

            <div class="mt-3 text-yellow-500">
                5/5 Rating
            </div>

            <p class="text-green-600
                      font-bold text-xl mt-3">

                Rs. 49,999

            </p>

            <form action="catalog.jsp"
                  method="post"
                  class="mt-4">

                <input
                    type="hidden"
                    name="product"
                    value="PlayStation 5">

                <button
                    type="submit"
                    class="w-full bg-blue-600
                           hover:bg-blue-700
                           text-white font-semibold
                           py-3 rounded-lg">

                    Add to Cart

                </button>

            </form>

        </div>


        <!-- PRODUCT 5 -->

        <div class="product-card bg-white
                    rounded-xl shadow p-5">

            <img
                src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e"
                class="w-full h-48 object-cover rounded-lg"
                alt="Headphones">

            <h2 class="text-lg font-bold mt-4">
                Premium Headphones
            </h2>

            <p class="text-gray-500 text-sm mt-2">
                Wireless headphones with rich sound.
            </p>

            <div class="mt-3 text-yellow-500">
                4/5 Rating
            </div>

            <p class="text-green-600
                      font-bold text-xl mt-3">

                Rs. 2,999

            </p>

            <form action="catalog.jsp"
                  method="post"
                  class="mt-4">

                <input
                    type="hidden"
                    name="product"
                    value="Premium Headphones">

                <button
                    type="submit"
                    class="w-full bg-blue-600
                           hover:bg-blue-700
                           text-white font-semibold
                           py-3 rounded-lg">

                    Add to Cart

                </button>

            </form>

        </div>


        <!-- PRODUCT 6 -->

        <div class="product-card bg-white
                    rounded-xl shadow p-5">

            <img
                src="https://images.unsplash.com/photo-1496181133206-80ce9b88a853"
                class="w-full h-48 object-cover rounded-lg"
                alt="Dell Laptop">

            <h2 class="text-lg font-bold mt-4">
                Dell Laptop
            </h2>

            <p class="text-gray-500 text-sm mt-2">
                Reliable laptop for everyday productivity.
            </p>

            <div class="mt-3 text-yellow-500">
                4/5 Rating
            </div>

            <p class="text-green-600
                      font-bold text-xl mt-3">

                Rs. 65,000

            </p>

            <form action="catalog.jsp"
                  method="post"
                  class="mt-4">

                <input
                    type="hidden"
                    name="product"
                    value="Dell Laptop">

                <button
                    type="submit"
                    class="w-full bg-blue-600
                           hover:bg-blue-700
                           text-white font-semibold
                           py-3 rounded-lg">

                    Add to Cart

                </button>

            </form>

        </div>


        <!-- PRODUCT 7 -->

        <div class="product-card bg-white
                    rounded-xl shadow p-5">

            <img
                src="https://images.unsplash.com/photo-1546868871-7041f2a55e12"
                class="w-full h-48 object-cover rounded-lg"
                alt="Smart Watch">

            <h2 class="text-lg font-bold mt-4">
                Smart Watch
            </h2>

            <p class="text-gray-500 text-sm mt-2">
                Smart watch with health and fitness features.
            </p>

            <div class="mt-3 text-yellow-500">
                4/5 Rating
            </div>

            <p class="text-green-600
                      font-bold text-xl mt-3">

                Rs. 18,999

            </p>

            <form action="catalog.jsp"
                  method="post"
                  class="mt-4">

                <input
                    type="hidden"
                    name="product"
                    value="Smart Watch">

                <button
                    type="submit"
                    class="w-full bg-blue-600
                           hover:bg-blue-700
                           text-white font-semibold
                           py-3 rounded-lg">

                    Add to Cart

                </button>

            </form>

        </div>


        <!-- PRODUCT 8 -->

        <div class="product-card bg-white
                    rounded-xl shadow p-5">

            <img
                src="https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0"
                class="w-full h-48 object-cover rounded-lg"
                alt="Android Tablet">

            <h2 class="text-lg font-bold mt-4">
                Android Tablet
            </h2>

            <p class="text-gray-500 text-sm mt-2">
                Lightweight tablet for entertainment and study.
            </p>

            <div class="mt-3 text-yellow-500">
                4/5 Rating
            </div>

            <p class="text-green-600
                      font-bold text-xl mt-3">

                Rs. 19,999

            </p>

            <form action="catalog.jsp"
                  method="post"
                  class="mt-4">

                <input
                    type="hidden"
                    name="product"
                    value="Android Tablet">

                <button
                    type="submit"
                    class="w-full bg-blue-600
                           hover:bg-blue-700
                           text-white font-semibold
                           py-3 rounded-lg">

                    Add to Cart

                </button>

            </form>

        </div>

    </div>


    <!-- CART SUMMARY -->

    <div class="mt-10 bg-white
                rounded-xl shadow p-6
                flex flex-col md:flex-row
                justify-between items-center">


        <div>

            <h2 class="text-xl font-bold text-gray-900">

                Your Shopping Cart

            </h2>


            <p class="text-gray-500 mt-1">

                You currently have

                <strong class="text-blue-600">

                    <%= cartCount %>

                </strong>

                item(s) in your cart.

            </p>

        </div>


        <a href="cart.jsp"
           class="mt-4 md:mt-0
                  bg-green-600 hover:bg-green-700
                  text-white font-semibold
                  px-7 py-3 rounded-lg">

            View Cart
            (<%= cartCount %>)

        </a>

    </div>

</div>


<!-- FOOTER -->

<jsp:include page="footer.jsp" />


</body>

</html>