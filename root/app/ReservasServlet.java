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

@WebServlet("/arrpiServlet/Reservas")
public class ReservasServlet extends HttpServlet{

	public void doGet(HttpServletRequest request,
	HttpServletResponse response)
	throws ServletException, IOException
	{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String inputNombre = request.getParameter("input_nombre");
		String inputCod = request.getParameter("input_codfac");
		String inputDocumento = request.getParameter("input_documento");
		String inputNumero = request.getParameter("input_numpe");
		String inputHora = request.getParameter("input_hora");
		try (
		Connection conexion =
		DriverManager.getConnection (
		"jdbc:postgresql://localhost:5432/arrpi" ,
		"postgres" ,
		"135890" ) ) {
		Statement statement = conexion.createStatement();

		out.println("<HEAD><TITLE>Conectado</TITLE></HEAD>");

		String outp = "";
		if(inputNombre != null && inputCod != null && inputDocumento != null && inputNumero != null && inputHora != null){
			statement.executeUpdate("insert into Reservar values"+ "('" + inputNombre + "', '"+ inputCod + "', '" + inputNumero + "', '" + inputHora + "')" + ";");

			outp = "¡Exitoso!";
		}
		request.setAttribute("confirm", outp);
		request.getRequestDispatcher("/WEB-INF/reservas.jsp").forward(request, response);

		out.println("<p> No deberíamos llegar acá. </p>");
		out.println("</BODY>");

	} catch (SQLException e) {
		String outp = "Algo salió mal.";
		request.setAttribute("confirm", outp);
		request.getRequestDispatcher("/WEB-INF/reservas.jsp").forward(request, response);
		e.printStackTrace () ;
		}
	}
}
