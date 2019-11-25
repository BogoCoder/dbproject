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

@WebServlet("/arrpiServlet/Transferencia")
public class TransferenciaServlet extends HttpServlet{

	public void doGet(HttpServletRequest request,
	HttpServletResponse response)
	throws ServletException, IOException
	{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String inputNombre = request.getParameter("input_nombre");
		String inputFecha = request.getParameter("input_hora");
		String inputMonto = request.getParameter("input_monto");
		String inputNombreSend = request.getParameter("input_nombresend");
		try (
		Connection conexion =
		DriverManager.getConnection (
		"jdbc:postgresql://localhost:5432/arrpi" ,
		"postgres" ,
		"postgres" ) ) {
		Statement statement = conexion.createStatement();

		out.println("<HEAD><TITLE>Conectado</TITLE></HEAD>");

		ResultSet resultSet1 = statement.executeQuery("select saldo from App_Usuario where usuario = '" + inputNombre + "';");

		String saldo1 = "";
		while (resultSet1.next()) {
			saldo1 += resultSet1.getString("saldo");
		}

		String outp = "";
		if(inputMonto != null && inputFecha != null && inputNombre != null && inputNombreSend != null){

			statement.executeUpdate("update App_Usuario set saldo = saldo::integer - " + inputMonto + " where usuario = '" + inputNombre + "' ;");

			statement.executeUpdate("update App_Usuario set saldo = saldo::integer + " + inputMonto + " where usuario = '" + inputNombreSend + "' ;");

			outp = "¡Exitoso! Tu saldo anterior era: " + saldo1;
		}
		
		ResultSet resultSet2 = statement.executeQuery("select saldo from App_Usuario where usuario = '" + inputNombre + "';");

		String saldo2 = "";
		while (resultSet2.next()) {
			saldo2 += resultSet2.getString("saldo");
		}
		
		outp += ",ahora es: " + saldo2;
		request.setAttribute("confirm", outp);
		request.getRequestDispatcher("/WEB-INF/transferencia.jsp").forward(request, response);

		out.println("<p> No deberíamos llegar acá. </p>");
		out.println("</BODY>");

	} catch (SQLException e) {
		String outp = "Algo salió mal.";
		request.setAttribute("confirm", outp);
		request.getRequestDispatcher("/WEB-INF/transferencia.jsp").forward(request, response);
		e.printStackTrace () ;
		}
	}
}
