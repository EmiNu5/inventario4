
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-4">
            <div class="${config}" role="alert">
                ${mensaje}!
            </div>
            <div>
                <a href="controlador?accion=main">Volver         
                </a>
            </div>
        </div>
    </body>
</html>
