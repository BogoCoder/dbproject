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

@WebServlet("/arrpiServlet/BusquedaPorNombre")
public class BusquedaPorNombreServlet extends HttpServlet{

	@Override
	public void doGet(HttpServletRequest request,
	HttpServletResponse response)
	throws ServletException, IOException
	{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String inputNombre = request.getParameter("input_restaurante");

		try (
		Connection conexion =
		DriverManager.getConnection (
		"jdbc:postgresql://localhost:5432/arrpi" ,
		"postgres" ,
		"135890" ) ) {
		Statement statement = conexion.createStatement();

		out.println("<HEAD><TITLE>Conectado</TITLE></HEAD>");
		//Ejemplo 1 consulta parametrizada
		String atributos = "nombre";  
		String relacion = "Restaurante";
		ResultSet resultSet = statement.executeQuery("select "+atributos+" from "+relacion+ " where " + atributos + "=" + "'" +inputNombre + "'" + ";");
		String nombre_out = "";
		while (resultSet.next()) {
			nombre_out = "<tr>" + "<td>" + resultSet.getString("nombre") + "</td> </tr>";
		}

		if(nombre_out == ""){nombre_out = "¡Ese restaurante no existe!";}

		request.setAttribute("nombreConsulta", nombre_out);
		request.getRequestDispatcher("/WEB-INF/busqueda_por_nombre.jsp").forward(request, response);

		out.println("<p> No deberíamos llegar acá. </p>");
		out.println("</BODY>");

	} catch (SQLException e) {
		String nombre_out = "Algo salió mal.";
		request.setAttribute("nombreConsulta", nombre_out);
		request.getRequestDispatcher("/WEB-INF/busqueda_por_nombre.jsp").forward(request, response);
		e.printStackTrace () ;
		}
	}
}
