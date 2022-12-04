package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.clsDispositivo;
import modelo.clsEstado;
import modeloDAO.modeloDispositivoDAO;
import modeloDAO.modeloEstadoDAO;

@WebServlet(name = "controlador", urlPatterns = {"/controlador"})
public class controlador extends HttpServlet {

    modeloEstadoDAO dao;
    modeloDispositivoDAO daoD;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        try {
            switch (accion) {
                case "main":
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    break;
                case "nuevo":
                    request.getRequestDispatcher("add.jsp").forward(request, response);
                    break;
                case "Buscar":
                    listar(request, response);
                    break;
                case "Agregar":
                    int r = 0;//resultado
                    String nombre = request.getParameter("textNombre");
                    String marca = request.getParameter("textMarca");
                    String fecAlta = request.getParameter("fecAlta");
                    String mail = request.getParameter("textMail");
                    String observaciones = request.getParameter("textObservacion");
                    clsDispositivo d = new clsDispositivo();
                    d.setNombre(nombre);
                    d.setMarca(marca);
                    d.setEstado("1");
                    d.setFechaAlta(fecAlta);
                    d.setProveedor(mail);
                    d.setDestino(" ");
                    d.setFechaUltMod(" ");
                    d.setObservacion(observaciones);
                    r = daoD.registrarDispositivo(d);
                    if (r != 0) {
                        request.setAttribute("config", "alert alert-success");
                        request.setAttribute("mensaje", "Se agregó con éxito!!");
                        request.getRequestDispatcher("mensaje.jsp").forward(request, response);
                    } else {
                        request.setAttribute("config", "alert alert-danger");
                        request.setAttribute("mensaje", "Dale McFly!!!");
                        request.getRequestDispatcher("mensaje.jsp").forward(request, response);
                    }
                    break;
                default:
                    break;
            }

        } catch (Exception e) {
            System.out.print(e);
        }
    }

    private void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filtro = request.getParameter("filtro");
        List<modelo.clsDispositivo> dispositivo = null;
        daoD = new modeloDispositivoDAO();
        dispositivo = daoD.listar(filtro);
        request.setAttribute("estado", filtro);
        request.setAttribute("Dispositivos", dispositivo);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
       // ArrayList<modelo.clsEstado> categorias = null;
       // dao = new modeloEstadoDAO();
       // categorias = (ArrayList<clsEstado>) dao.getAllEstado();
       // request.setAttribute("categorias", categorias);
        // en que JSP esta el combobox
       // request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
