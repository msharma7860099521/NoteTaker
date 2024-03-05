package Servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import entities.Note;
import helper.FectoryProvider;

/**
 * Servlet implementation class DeleteServlet
 */
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			int id=Integer.parseInt(request.getParameter("note_id").trim());
			Session s=FectoryProvider.getFactory().openSession();
		    Note note=(Note)s.get(Note.class, id);
		    Transaction tx=s.beginTransaction();
			s.delete(note);
			tx.commit();
			s.close();
			response.sendRedirect("all_notes.jsp");
		} catch (Exception e) {
			
			System.out.println("Error::"+e);
			
		}
		
		
		
	}


}
