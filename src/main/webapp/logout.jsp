<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Logged Out - Inventory Management System</title>

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>

* {
    box-sizing: border-box;
}

body {
    margin: 0;
    min-height: 100vh;

    font-family: "Segoe UI", Arial, sans-serif;

    background: linear-gradient(135deg, #eff6ff, #dbeafe);

    display: flex;
    align-items: center;
    justify-content: center;
}

.logout-container {
    width: 430px;
    max-width: 90%;

    background: white;

    padding: 45px 35px;

    border-radius: 15px;

    text-align: center;

    box-shadow: 0 12px 35px rgba(0, 0, 0, 0.12);
}

.logout-icon {
    width: 70px;
    height: 70px;

    margin: 0 auto 20px;

    background: #2563eb;

    color: white;

    border-radius: 15px;

    display: flex;
    align-items: center;
    justify-content: center;

    font-size: 30px;
}

.logout-container h1 {
    margin: 0 0 10px;

    color: #1e293b;

    font-size: 24px;
}

.logout-container p {
    color: #64748b;

    font-size: 14px;

    margin-bottom: 25px;
}

.login-btn {
    display: inline-block;

    padding: 12px 25px;

    background: #2563eb;

    color: white;

    text-decoration: none;

    border-radius: 8px;

    font-size: 14px;

    font-weight: 600;

    transition: 0.2s;
}

.login-btn:hover {
    background: #1d4ed8;

    transform: translateY(-1px);
}

.login-btn i {
    margin-right: 7px;
}

.footer {
    margin-top: 25px;

    color: #94a3b8;

    font-size: 12px;
}

</style>

</head>

<body>

<div class="logout-container">

    <div class="logout-icon">
        <i class="fa-solid fa-box"></i>
    </div>

    <h1>You have been logged out</h1>

    <p>
        Thank you for using Inventory Management System.
    </p>

    <a href="index.html" class="login-btn">
        <i class="fa-solid fa-right-to-bracket"></i>
        Login Again
    </a>

    <div class="footer">
        Inventory Management System
    </div>

</div>

</body>
</html>