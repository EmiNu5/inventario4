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
        <div class="container-fluid p-0">
          <%@include file="navbarmain.jsp" %>
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
            <footer class="footer footer-expand-sm bg-dark footer-dark fixed-bottom text-muted text-center text-small">
                <div class="container">
                    <p class="mb-1"><i class="fa-brands fa-github"></i> 2022 EmiNu5</p>
                </div>
            </footer>

            <!-- js section -->
            <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
            <!-- js navbar logout -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
            
            <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/excellentexport@3.4.3/dist/excellentexport.min.js"></script>
            <script>

                let download_xls = document.querySelector("#download_xls")
                download_xls.addEventListener("click", () => {
                    ExcellentExport.excel(download_xls, 'datatable')
                })

            </script>
            <!-- Optional JavaScript -->
            <!-- jQuery first, then Popper.js, then Bootstrap JS -->
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        </div>
    </body>
</html>
