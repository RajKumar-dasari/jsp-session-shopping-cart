<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    String errorMessage = null;

    if (username != null && password != null) {

        if ("student".equals(username) && "1234".equals(password)) {

            session.setAttribute("loggedIn", true);
            session.setAttribute("username", username);
%>

            <jsp:forward page="catalog.jsp" />

<%
        } else {

            errorMessage = "Invalid Username or Password!";

        }
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Sign In - My Online Store</title>

    <style>

        * {
            box-sizing: border-box;
        }

        /* =====================================================
           PAGE BACKGROUND
           ===================================================== */

        body {
            margin: 0;
            min-block-size: 100vh;

            display: flex;
            justify-content: center;
            align-items: center;

            background-color: #ffffff;

            background-image:
                url("images/pexels-karola-g-5625005.jpg");

            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;

            font-family:
                "Trebuchet MS",
                "Lucida Sans Unicode",
                "Lucida Grande",
                "Lucida Sans",
                Arial,
                sans-serif;
        }


        /* =====================================================
           LOGIN CARD
           ===================================================== */

        .card {

            --p: 32px;
            --h-form: auto;
            --w-form: 380px;
            --input-px: 0.75rem;
            --input-py: 0.65rem;
            --submit-h: 38px;
            --blind-w: 64px;
            --space-y: 0.5rem;

            inline-size: var(--w-form);
            block-size: var(--h-form);
            max-inline-size: 100%;

            border-radius: 16px;

            background: #212121;

            position: relative;

            display: flex;
            align-items: center;
            justify-content: space-evenly;
            flex-direction: column;

            overflow-y: auto;

            padding: var(--p);

            scrollbar-width: none;

            -webkit-overflow-scrolling: touch;
            -webkit-font-smoothing: antialiased;

            -webkit-user-select: none;
            user-select: none;

            font-family:
                "Trebuchet MS",
                "Lucida Sans Unicode",
                "Lucida Grande",
                "Lucida Sans",
                Arial,
                sans-serif;

            box-shadow:
                0 10px 30px rgba(0, 0, 0, 0.35);
        }


        /* =====================================================
           AVATAR
           ===================================================== */

        .avatar {

            --sz-avatar: 166px;

            order: 0;

            inline-size: var(--sz-avatar);
            min-inline-size: var(--sz-avatar);
            max-inline-size: var(--sz-avatar);

            block-size: var(--sz-avatar);
            min-block-size: var(--sz-avatar);
            max-block-size: var(--sz-avatar);

            border: 1px solid #707070;
            border-radius: 9999px;

            overflow: hidden;

            cursor: pointer;

            z-index: 2;

            perspective: 80px;

            position: relative;

            margin: 0;

            display: flex;
            justify-content: center;
            align-items: center;

            --sz-svg: calc(var(--sz-avatar) - 10px);
        }


        .avatar svg {

            position: absolute;

            transition:
                transform 0.2s ease-in,
                opacity 0.1s;

            transform-origin: 50% 100%;

            block-size: var(--sz-svg);
            inline-size: var(--sz-svg);

            pointer-events: none;
        }


        .avatar svg#monkey {
            z-index: 1;
        }


        .avatar svg#monkey-hands {

            z-index: 2;

            transform-style: preserve-3d;

            transform:
                translateY(calc(var(--sz-avatar) / 1.25))
                rotateX(-21deg);
        }


        /* =====================================================
           MONKEY MOUTH
           ===================================================== */

        .avatar::before {

            content: "";

            border-radius: 45%;

            inline-size:
                calc(var(--sz-svg) / 3.889);

            block-size:
                calc(var(--sz-svg) / 5.833);

            border: 0;

            border-block-end:
                calc(var(--sz-svg) * (4 / 100))
                solid #3c302a;

            inset-block-end: 20%;

            position: absolute;

            transition: all 0.2s ease;

            z-index: 3;
        }


        .blind-check:checked ~ .avatar::before {

            inline-size:
                calc(var(--sz-svg) * (9 / 100));

            block-size: 0;

            border-radius: 50%;

            border-block-end:
                calc(var(--sz-svg) * (10 / 100))
                solid #3c302a;
        }


        /* =====================================================
           MONKEY BLINK
           ===================================================== */

        .avatar svg#monkey .monkey-eye-r,
        .avatar svg#monkey .monkey-eye-l {

            animation:
                blink 10s 1s infinite;

            transition: all 0.2s ease;
        }


        @keyframes blink {

            0%,
            2%,
            4%,
            26%,
            28%,
            71%,
            73%,
            100% {

                ry: 4.5;
                cy: 31.7;
            }

            1%,
            3%,
            27%,
            72% {

                ry: 0.5;
                cy: 30;
            }
        }


        /* =====================================================
           WHEN HIDE IS ACTIVE - CLOSE EYES
           ===================================================== */

        .blind-check:checked
        ~ .avatar
        svg#monkey
        .monkey-eye-r,

        .blind-check:checked
        ~ .avatar
        svg#monkey
        .monkey-eye-l {

            ry: 0.5;
            cy: 30;
        }


        /* =====================================================
           WHEN HIDE IS ACTIVE - HANDS COVER EYES
           ===================================================== */

        .blind-check:checked
        ~ .avatar
        svg#monkey-hands {

            transform:
                translate3d(0, 0, 0)
                rotateX(0deg);
        }


        /* =====================================================
           ORIGINAL TRANSITIONS
           ===================================================== */

        .avatar svg#monkey,
        .avatar::before,
        .avatar svg#monkey .monkey-eye-nose,
        .avatar svg#monkey .monkey-eye-r,
        .avatar svg#monkey .monkey-eye-l {

            transition: all 0.2s ease;
        }


        /* =====================================================
           FOCUS ANIMATION
           ===================================================== */

        .blind-check:checked
        ~ .form:focus-within
        ~ .avatar svg#monkey,

        .blind-check:checked
        ~ .form:focus-within
        ~ .avatar::before,

        .blind-check:checked
        ~ .form:focus-within
        ~ .avatar
        svg#monkey
        .monkey-eye-nose,

        .blind-check:checked
        ~ .form:focus-within
        ~ .avatar
        svg#monkey
        .monkey-eye-r,

        .blind-check:checked
        ~ .form:focus-within
        ~ .avatar
        svg#monkey
        .monkey-eye-l {

            animation: none;
        }


        .form:focus-within
        ~ .avatar svg#monkey {

            animation:
                slick 3s ease infinite 1s;

            --center: rotateY(0deg);
            --left: rotateY(-4deg);
            --right: rotateY(4deg);
        }


        .form:focus-within
        ~ .avatar::before,

        .form:focus-within
        ~ .avatar
        svg#monkey
        .monkey-eye-nose,

        .blind-check:not(:checked)
        ~ .form:focus-within
        ~ .avatar
        svg#monkey
        .monkey-eye-r,

        .blind-check:not(:checked)
        ~ .form:focus-within
        ~ .avatar
        svg#monkey
        .monkey-eye-l {

            ry: 3;
            cy: 35;

            animation:
                slick 3s ease infinite 1s;

            --center: translateX(0);
            --left: translateX(-0.5px);
            --right: translateX(0.5px);
        }


        @keyframes slick {

            0%,
            100% {

                transform: var(--center);
            }

            25% {

                transform: var(--left);
            }

            75% {

                transform: var(--right);
            }
        }


        /* =====================================================
           SHOW / HIDE BUTTON
           ===================================================== */

        .card label.blind_input {

            -webkit-user-select: none;
            user-select: none;

            cursor: pointer;

            z-index: 4;

            position: absolute;

            border: none;

            inset-inline-end:
                calc(
                    var(--p)
                    + (var(--input-px) / 2)
                );

            inset-block-end:
                calc(
                    var(--p)
                    + var(--submit-h)
                    + var(--space-y)
                    + (var(--input-py) / 1)
                    + 3px
                );

            padding: 4px 0;

            inline-size: var(--blind-w);

            border-radius: 4px;

            background-color: #fff;

            color: #4d4d4d;

            display: inline-flex;

            align-items: center;
            justify-content: center;

            /* ONLY CHANGE REQUESTED:
               MOVE HIDE/SHOW UP */
            transform: translateY(-20px);
        }


        .card label.blind_input:before {

            content: "";

            position: absolute;

            inset-inline-start:
                calc(
                    (var(--input-px) / 2) * -1
                );

            inset-block-start: 0;

            block-size: 100%;
            inline-size: 1px;

            background: #8f8f8f;
        }


        .card label.blind_input:hover {

            color: #262626;

            background-color: #f2f2f2;
        }


        /* =====================================================
           SHOW / HIDE TEXT
           ===================================================== */

        .blind-check
        ~ label.blind_input
        span.show,

        .blind-check:checked
        ~ label.blind_input
        span.hide {

            display: none;
        }


        .blind-check
        ~ label.blind_input
        span.hide,

        .blind-check:checked
        ~ label.blind_input
        span.show {

            display: block;
        }


        /* =====================================================
           FORM
           ===================================================== */

        .form {

            order: 1;

            position: relative;

            display: flex;

            align-items: center;

            justify-content: space-evenly;

            flex-direction: column;

            inline-size: 100%;
        }


        /* =====================================================
           TITLE
           ===================================================== */

        .form .title {

            inline-size: 100%;

            font-size: 1.5rem;

            font-weight: 600;

            margin-block-start: 0;
            margin-block-end: 1rem;

            padding-block-start: 0;
            padding-block-end: 1rem;

            color: #ffffff;

            border-block-end:
                2px solid rgba(255, 255, 255, 0.3);
        }


        /* =====================================================
           LABELS
           ===================================================== */

        .form .label_input {

            white-space: nowrap;

            font-size: 1rem;

            margin-block-start:
                calc(var(--space-y) / 2);

            color: #ffffff;

            font-weight: 600;

            display: inline;

            text-align: start;

            margin-inline-end: auto;

            position: relative;

            z-index: 99;

            -webkit-user-select: none;
            user-select: none;
        }


        /* =====================================================
           INPUTS
           ===================================================== */

        .form .input {

            resize: vertical;

            background: white;

            border: 1px solid #8f8f8f;

            border-radius: 6px;

            outline: none;

            padding:
                var(--input-py)
                var(--input-px);

            font-size: 18px;

            inline-size: 100%;

            color: #000000;

            margin:
                var(--space-y) 0;

            transition:
                all 0.25s ease;
        }


        .form .input#password-input {

            padding-inline-end:
                calc(
                    var(--blind-w)
                    + var(--input-px)
                    + 4px
                );
        }


        .form .input:focus {

            border: 1px solid #0969da;

            outline: 0;

            box-shadow:
                0 0 0 2px #0969da;
        }


        /* =====================================================
           FORGOT PASSWORD
           ===================================================== */

        .form .frg_pss {

            inline-size: 100%;

            display: inline-flex;

            align-items: center;
        }


        .form .frg_pss a {

            background-color: transparent;

            cursor: pointer;

            text-decoration: underline;

            transition:
                color 0.25s ease;

            color: #d1d5db;

            font-weight: 500;

            float: inline-end;
        }


        .form .frg_pss a:hover {

            color: #60a5fa;
        }


        /* =====================================================
           UIVERSE SUBMIT BUTTON
           ORIGINAL GREEN COLOR PRESERVED
           ===================================================== */

        .form .submit {

            outline: none;

            cursor: pointer;

            border: none;

            padding: 0.9rem 2rem;

            margin: 10px 0 0 0;

            font-family: inherit;

            font-size: 17px;

            position: relative;

            display: inline-block;

            inline-size: 100%;

            letter-spacing: 0.05rem;

            font-weight: 700;

            border-radius: 500px;

            overflow: hidden;

            background: #66ff66;

            color: ghostwhite;
        }


        .form .submit span {

            position: relative;

            z-index: 10;

            transition: color 0.4s;
        }


        .form .submit:hover span {

            color: black;
        }


        .form .submit::before,
        .form .submit::after {

            position: absolute;

            inset-block-start: 0;
            inset-inline-start: 0;

            inline-size: 100%;
            block-size: 100%;

            z-index: 0;
        }


        .form .submit::before {

            content: "";

            background: #000;

            inline-size: 120%;

            inset-inline-start: -10%;

            transform: skew(30deg);

            transition:
                transform 0.4s
                cubic-bezier(0.3, 1, 0.8, 1);
        }


        .form .submit:hover::before {

            transform:
                translate3d(100%, 0, 0);
        }


        /* =====================================================
           PASSWORD MASK
           ===================================================== */

        .blind-check:checked
        ~ .form
        .input[type="text"] {

            -webkit-text-security: disc;
        }


        /* =====================================================
           ERROR MESSAGE
           ===================================================== */

        .error-message {

            inline-size: 100%;

            margin-block-end: 8px;

            padding: 10px;

            border-radius: 6px;

            background: #ffe5e5;

            color: #c00000;

            text-align: center;

            font-size: 14px;

            font-weight: 600;
        }


        /* =====================================================
           MOBILE
           ===================================================== */

        @media (max-inline-size: 500px) {

            .card {

                --w-form: 95%;

                padding: 25px;
            }


            .avatar {

                --sz-avatar: 140px;
            }
        }

    </style>

</head>


<body>


<div class="card">


    <!-- =====================================================
         ORIGINAL UIVERSE CHECKBOX
         ===================================================== -->

    <input
        value=""
        class="blind-check"
        type="checkbox"
        id="blind-input"
        name="blindcheck"
        hidden=""
    />


    <!-- =====================================================
         SHOW / HIDE
         ===================================================== -->

    <label
        for="blind-input"
        class="blind_input">

        <span class="hide">
            Hide
        </span>

        <span class="show">
            Show
        </span>

    </label>


    <!-- =====================================================
         LOGIN FORM
         ===================================================== -->

    <form
        class="form"
        action="login.jsp"
        method="post">


        <div class="title">

            Sign In

        </div>


        <!-- ERROR MESSAGE -->

        <%
            if (errorMessage != null) {
        %>

            <div class="error-message">

                <%= errorMessage %>

            </div>

        <%
            }
        %>


        <!-- =================================================
             USERNAME
             ================================================= -->

        <label
            class="label_input"
            for="username-input">

            Username

        </label>


        <input
            spellcheck="false"
            class="input"
            type="text"
            name="username"
            id="username-input"
            required
            autocomplete="username"
        />


        <!-- =================================================
             PASSWORD
             ================================================= -->

        <div class="frg_pss">

            <label
                class="label_input"
                for="password-input">

                Password

            </label>


            <a href="#">

                Forgot password?

            </a>

        </div>


        <input
            spellcheck="false"
            class="input"
            type="text"
            name="password"
            id="password-input"
            required
            autocomplete="current-password"
        />


        <!-- =================================================
             SUBMIT
             ================================================= -->

        <button
            class="submit"
            type="submit">

            <span>
                Submit
            </span>

        </button>


    </form>


    <!-- =====================================================
         ORIGINAL MONKEY AVATAR
         ===================================================== -->

    <label
        for="blind-input"
        class="avatar">


        <!-- =================================================
             ORIGINAL MONKEY FACE
             ================================================= -->

        <svg
            xmlns="http://www.w3.org/2000/svg"
            width="35"
            height="35"
            viewBox="0 0 64 64"
            id="monkey">


            <ellipse
                cx="53.7"
                cy="33"
                rx="8.3"
                ry="8.2"
                fill="#89664c">
            </ellipse>


            <ellipse
                cx="53.7"
                cy="33"
                rx="5.4"
                ry="5.4"
                fill="#ffc5d3">
            </ellipse>


            <ellipse
                cx="10.2"
                cy="33"
                rx="8.2"
                ry="8.2"
                fill="#89664c">
            </ellipse>


            <ellipse
                cx="10.2"
                cy="33"
                rx="5.4"
                ry="5.4"
                fill="#ffc5d3">
            </ellipse>


            <g fill="#89664c">

                <path
                    d="m43.4 10.8c1.1-.6 1.9-.9 1.9-.9-3.2-1.1-6-1.8-8.5-2.1 1.3-1 2.1-1.3 2.1-1.3-20.4-2.9-30.1 9-30.1 19.5h46.4c-.7-7.4-4.8-12.4-11.8-15.2">
                </path>


                <path
                    d="m55.3 27.6c0-9.7-10.4-17.6-23.3-17.6s-23.3 7.9-23.3 17.6c0 2.3.6 4.4 1.6 6.4-1 2-1.6 4.2-1.6 6.4 0 9.7 10.4 17.6 23.3 17.6s23.3-7.9 23.3-17.6c0-2.3-.6-4.4-1.6-6.4 1-2 1.6-4.2 1.6-6.4">
                </path>

            </g>


            <path
                d="m52 28.2c0-16.9-20-6.1-20-6.1s-20-10.8-20 6.1c0 4.7 2.9 9 7.5 11.7-1.3 1.7-2.1 3.6-2.1 5.7 0 6.1 6.6 11 14.7 11s14.7-4.9 14.7-11c0-2.1-.8-4-2.1-5.7 4.4-2.7 7.3-7 7.3-11.7"
                fill="#e0ac7e">
            </path>


            <g
                fill="#3b302a"
                class="monkey-eye-nose">


                <path
                    d="m35.1 38.7c0 1.1-.4 2.1-1 2.1-.6 0-1-.9-1-2.1 0-1.1.4-2.1 1-2.1.6.1 1 1 1 2.1">
                </path>


                <path
                    d="m30.9 38.7c0 1.1-.4 2.1-1 2.1-.6 0-1-.9-1-2.1 0-1.1.4-2.1 1-2.1.5.1 1 1 1 2.1">
                </path>


                <ellipse
                    cx="40.7"
                    cy="31.7"
                    rx="3.5"
                    ry="4.5"
                    class="monkey-eye-r">
                </ellipse>


                <ellipse
                    cx="23.3"
                    cy="31.7"
                    rx="3.5"
                    ry="4.5"
                    class="monkey-eye-l">
                </ellipse>


            </g>


        </svg>


        <!-- =================================================
             ORIGINAL MONKEY HANDS
             ================================================= -->

        <svg
            xmlns="http://www.w3.org/2000/svg"
            width="35"
            height="35"
            viewBox="0 0 64 64"
            id="monkey-hands">


            <path
                fill="#89664C"
                d="M9.4,32.5L2.1,61.9H14c-1.6-7.7,4-21,4-21L9.4,32.5z">
            </path>


            <path
                fill="#FFD6BB"
                d="M15.8,24.8c0,0,4.9-4.5,9.5-3.9c2.3,0.3-7.1,7.6-7.1,7.6s9.7-8.2,11.7-5.6c1.8,2.3-8.9,9.8-8.9,9.8s10-8.1,9.6-4.6c-0.3,3.8-7.9,12.8-12.5,13.8C11.5,43.2,6.3,39,9.8,24.4C11.6,17,13.3,25.2,15.8,24.8">
            </path>


            <path
                fill="#89664C"
                d="M54.8,32.5l7.3,29.4H50.2c1.6-7.7-4-21-4-21L54.8,32.5z">
            </path>


            <path
                fill="#FFD6BB"
                d="M48.4,24.8c0,0-4.9-4.5-9.5-3.9c-2.3,0.3,7.1,7.6,7.1,7.6s-9.7-8.2-11.7-5.6c-1.8,2.3,8.9,9.8,8.9,9.8s-10-8.1-9.7-4.6c0.4,3.8,8,12.8,12.6,13.8c6.6,1.3,11.8-2.9,8.3-17.5C52.6,17,50.9,25.2,48.4,24.8">
            </path>


        </svg>


    </label>


</div>


</body>

</html>