<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.clsEstado"%>
<%@page import="controlador.controlador"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SistemaInventario</title>
        <!-- Boostrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">  
        <!-- CSS -->
        <link href="css/styles.css" rel="stylesheet" />
        <!-- Custom styles for this template -->
        <link href="sticky-footer.css" rel="stylesheet">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container-fluid p-0">
            <center>
                <a href="controlador?accion=nuevo" class="my-2 btn btn-primary">Nuevo</a>
                <a type="button" class="btn btn-success" id="download_xls" download="filename.xls" href="#">Exportar</a>
                <div class="form-group form-group-lg">
                    <label class="col-sm-2 control-label" for="lg" for="categorias" >Categoria</label>
                    <div class="col-sm-4">
                        <form method="post" action="controlador">
                            <select class="form-control" id="cboCategoriaEstado" name="filtro">
                                <option class="text-center">Seleccione</option>
                                <%
                                    try {
                                        String sql = "select * from estados";
                                        Class.forName("com.mysql.jdbc.Driver").newInstance();//ruta del driver
                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventario", "root", "");
                                        Statement st = con.createStatement();
                                        ResultSet rs = st.executeQuery(sql);
                                        while (rs.next()) {
                                %>
                                <option value="<%= rs.getInt("idEstado")%>" class="text-center"><%=rs.getString("DescEstado")%></option>  
                                <%
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>
                                <input type="submit"  name="accion" value="Buscar" class="btn btn-info"></input>
                            </select>
                        </form>
                    </div>
                </div>
            </center>
            <div class="my-3 card-group">             
                <div class="container">
                    <table id="datatable" class="table table-striped text-center border border-dark">
                        <tr>
                            <th>
                                #
                            </th>
                            <th>
                                Nombre
                            </th>
                            <th>
                                Marca
                            </th>
                            <th>
                                Estado
                            </th>
                            <th>
                                Acciones
                            </th>
                        </tr>
                        <c:forEach var="dispositivo" items="${Dispositivos}">
                            <tr>
                                <td>
                                    ${dispositivo.idDispositivo}
                                </td>
                                <td>
                                    ${dispositivo.nombre}
                                </td>
                                <td>
                                    ${dispositivo.marca}
                                </td>
                                <td>
                                    ${dispositivo.estado}
                                </td>
                                <td>
                                    <a href="Controlador?accion=Editar&id=${dispositivo.idDispositivo}" class="btn btn-outline-warning"><i class="fa-solid fa-pen"></i></a> 
                                    <a href="Controlador?accion=Ver&id=${dispositivo.observacion}" class="btn btn-outline-info"><i class="fa-solid fa-circle-info"></i></a> 
                                    <a href="Controlador?accion=Delete&id=${dispositivo.idDispositivo}" class="btn btn-outline-danger"><i class="fa-solid fa-trash"></i></a> 
                                </td>
                            </tr>
                        </c:forEach>
                    </table> 
                </div>
            </div>
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
