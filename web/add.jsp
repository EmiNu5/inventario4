<%-- 
    Document   : add
    Created on : 30/11/2022, 22:34:40
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body> 
        <%@include file="header.jsp" %>
        <form action="controlador" method="POST">
            <div class="container mt-4">
                <center>
                    <div class="card border-dark mx-5"style="max-width: 18rem;">
                        <div class="card-header">Agregar dispositivo</div>
                        <div class="card-body texto-info">
                            <div class="form-group">
                                <label>Nombre</label>
                                <input type="text" name="textNombre" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Marca</label>
                                <input type="text" name="textMarca" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Fec. Alta</label>
                                <input type="date" name="fecAlta" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Mail proveedor</label>
                                <input type="email" name="textMail" class="form-control">
                            </div> 
                            <div class="form-group">
                                <label>Observacion</label>
                                <textarea type="text" name="textObservacion" class="form-control" rows="3"></textarea>

                            </div>
                        </div>
                        <div class="card-footer">
                            <input type="submit" value="Agregar" name="accion" class="btn btn-block btn-outline-success">
                            <a href="index.jsp" class="btn-link m1-2">Volver</a>
                        </div>
                    </div>
                </center>
            </div>
        </form>
        <%@include file="footer.jsp" %>
    </body>
</html>
