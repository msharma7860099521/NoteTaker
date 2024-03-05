package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mysql.jdbc.Driver;

import entities.Note;
import helper.FectoryProvider;

public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SaveNoteServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String title= request.getParameter("title");
		String content= request.getParameter("content");
		Note note=new Note(new Random().nextInt(),title,content,new Date());
       Session s= FectoryProvider.getFactory().openSession();
       Transaction tx=s.beginTransaction();
       s.save(note);
       tx.commit();
       s.close();
       
      PrintWriter out=response.getWriter();
     out.println("<h1 style='text-align:center'>Node added Successfully!</h1>");  
     out.println("<h1 style='text-align:center'><a href='all_notes.jsp'>View all Notes</a></h1>");  

     	
	}

}
