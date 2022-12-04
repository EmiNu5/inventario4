<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
    <center>
        <form action="controlador" method="POST">
            <div class="container mt-4">
                <div class="card border-info mb-3" style="max-width: 18rem;">
                    <div class="card-header">Actualizar dispositivo</div>
                    <div class="card-body texto-info">
                        <div class="form-group">
                            <label>idDispositivo</label>
                            <input type="text" value="${d1.idDispositivo}" readonly="" name="textIDispositivo" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Dispositivo</label>
                            <input type="text" value="${d1.nombre}" name="textNombre" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Marca</label>
                            <input type="text" value="${d1.marca}" name="textMarca" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>mail Proveedor</label>
                            <input type="email" value="${d1.proveedor}" name="textMail" class="form-control">
                        </div>
                    </div>
                    <div class="card-footer">
                        <input type="submit" value="Actualizar" name="accion" class="btn btn-outline-success">
                        <a href="controlador?accion=main" class="btn-link m1-2">Volver</a>
                    </div>
                </div>
            </div>
        </form>
    </center>
    <%@include file="footer.jsp" %>
</body>
</html>
