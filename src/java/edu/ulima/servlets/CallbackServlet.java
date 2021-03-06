package edu.ulima.servlets;

import edu.ulima.bean.Jugador;
import edu.ulima.mongo.MongoDB;
import facebook4j.Facebook;
import facebook4j.FacebookException;
import facebook4j.PictureSize;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CallbackServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MongoDB mongo = new MongoDB();
        Facebook facebook = (Facebook) request.getSession().getAttribute("facebook");
        String oauthCode = request.getParameter("code");
        
        try {
            System.out.println(oauthCode);
            facebook.getOAuthAccessToken(oauthCode);
            Jugador j;
            if(mongo.buscarJugadorCorreo(facebook.getMe().getEmail())==null){
                j = new Jugador();
                j.setCorreo(facebook.getMe().getEmail());
                j.setNombre(facebook.getName());
                j.setFbid(facebook.getId());
                j.setImagen(facebook.getPictureURL(PictureSize.large).toString());
                
                j = mongo.crearJugador(j);
            }else{
                j = mongo.buscarJugadorCorreo(facebook.getMe().getEmail());
                j.setNombre(facebook.getName());
                j.setFbid(facebook.getId());
                j.setImagen(facebook.getPictureURL(PictureSize.large).toString());
                mongo.actualizarJugador(j);
                request.getSession().setAttribute("partidosOrganizados",mongo.partidosAdmin(j));
            }
            request.getSession().setAttribute("actual",j);
            
            request.getSession().setAttribute("fName", facebook.getName());
            
            
        } catch (FacebookException e) {
            throw new ServletException(e);
        }
        response.sendRedirect(request.getContextPath() + "/organizador.jsp");
        
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
