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

@WebServlet("/arrpiServlet/EncuentraTuRestaurante")
public class EncuentraTuRestauranteServlet extends HttpServlet{

	@Override
	public void doGet(HttpServletRequest request,
	HttpServletResponse response)
	throws ServletException, IOException
	{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String inputComida = request.getParameter("input_comida");
		String inputPresupuesto = request.getParameter("input_presupuesto");
		String inputZona = request.getParameter("input_zona");

		try (
		Connection conexion =
		DriverManager.getConnection (
		"jdbc:postgresql://localhost:5432/arrpi" ,
		"postgres" ,
		"135890" ) ) {
		Statement statement = conexion.createStatement();

		out.println("<HEAD><TITLE>Conectado</TITLE></HEAD>");
		// out.println("<p> insert into "+relacion+" values"+ "(" + inputNombre + ", "+ inputCod + "," + inputFecha + "," + inputCantidad + ")" + ";</p>");
		ResultSet resultSet = statement.executeQuery("select * from Restaurante where tipo_comida = '" + inputComida + "' AND '" + inputPresupuesto + "' >= precios AND direccion = '" + inputZona + "';");

		String outp = "<tr>" ;
		while (resultSet.next()) {
			outp +="<td>" + resultSet.getString("nombre") + "</td>";
		}
		outp +=  "</tr>";

		
		request.setAttribute("confirm", outp);
		request.getRequestDispatcher("/WEB-INF/encuentra_tu_restaurante.jsp").forward(request, response);

		out.println("<p> No deberíamos llegar acá. </p>");
		out.println("</BODY>");

	} catch (SQLException e) {
		String outp = "Algo salió mal.";
		request.setAttribute("confirm", outp);
		request.getRequestDispatcher("/WEB-INF/encuentra_tu_restaurante.jsp").forward(request, response);
		e.printStackTrace () ;
		}
	}
}
