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

@WebServlet("/arrpiServlet/PagoEnLinea")
public class PagoEnLineaServlet extends HttpServlet{

	@Override
	public void doGet(HttpServletRequest request,
	HttpServletResponse response)
	throws ServletException, IOException
	{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String inputCod = request.getParameter("input_codfac");
		String inputNombre = request.getParameter("input_nombre");
		String inputFecha = request.getParameter("input_fecha");
		String inputCantidad = request.getParameter("input_cantidad");

		try (
		Connection conexion =
		DriverManager.getConnection (
		"jdbc:postgresql://localhost:5432/arrpi" ,
		"postgres" ,
		"postgres" ) ) {
		Statement statement = conexion.createStatement();

		out.println("<HEAD><TITLE>Conectado</TITLE></HEAD>");
		String atributos = "nombre";  
		String relacion = "Pagar";

		if(inputCantidad != null && inputCod != null && inputFecha != null && inputNombre != null){
			statement.executeUpdate("insert into "+relacion+" values"+ "('" + inputNombre + "', '"+ inputCod + "', '" + inputFecha + "', '" + inputCantidad + "')" + ";");
	
			statement.executeUpdate("update App_Usuario set saldo = saldo::integer - " + inputCantidad + " where usuario = '" + inputNombre + "' ;");
		}
		String outp = "¡Exitoso!";
		request.setAttribute("confirm", outp);
		request.getRequestDispatcher("/WEB-INF/pago_en_linea.jsp").forward(request, response);

		out.println("<p> No deberíamos llegar acá. </p>");
		out.println("</BODY>");

	} catch (SQLException e) {
		String outp = "Algo salió mal.";
		request.setAttribute("confirm", outp);
		request.getRequestDispatcher("/WEB-INF/pago_en_linea.jsp").forward(request, response);
		e.printStackTrace () ;
		}
	}
}
