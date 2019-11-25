package arrpiServlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/arrpiServlet/Calificar")
public class CalificacionServlet extends HttpServlet{

	public void doGet(HttpServletRequest request,
	HttpServletResponse response)
	throws ServletException, IOException
	{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String inputNombre = request.getParameter("input_nombre");
		String inputCod = request.getParameter("input_codfac");
		String inputCalificacion = request.getParameter("rating");
		String inputSugerencias = request.getParameter("sug");

		inputSugerencias.replace("\r\n", "");
		try (
		Connection conexion =
		DriverManager.getConnection (
		"jdbc:postgresql://localhost:5432/arrpi" ,
		"postgres" ,
		"postgres" ) ) {
		Statement statement = conexion.createStatement();

		out.println("<HEAD><TITLE>Conectado</TITLE></HEAD>");

		String outp = "";
		if(inputNombre != null && inputCod != null && inputCalificacion != null){
			statement.executeUpdate("insert into Calificar values"+ "('" + inputNombre + "', '"+ inputCod + "', '" + inputCalificacion + "', '" + inputSugerencias + "')" + ";");

			outp = "¡Exitoso!";
		}
		request.setAttribute("confirm", outp);
		request.getRequestDispatcher("/WEB-INF/calificacion.jsp").forward(request, response);

		out.println("<p> No deberíamos llegar acá. </p>");
		out.println("</BODY>");

	} catch (SQLException e) {
		String outp = "Algo salió mal. Seguramente ya calificaste a este restaurante.";
		request.setAttribute("confirm", outp);
		request.getRequestDispatcher("/WEB-INF/calificacion.jsp").forward(request, response);
		e.printStackTrace () ;
		}
	}
}
