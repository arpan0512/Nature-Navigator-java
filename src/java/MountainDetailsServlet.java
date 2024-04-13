import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

@WebServlet("/MountainDetailsServlet")
public class MountainDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mountainNameFromDatabase = "";
        double distanceFromDatabase = 0.0;
        double averageTimeFromDatabase = 0.0;
        double averagePaceFromDatabase = 0.0;
        String weatherConditionFromDatabase = "";
        
        // Assuming you have fetched these values from the database
        
        // Set attributes in the request
        request.setAttribute("mountainNameFromDatabase", mountainNameFromDatabase);
        request.setAttribute("distanceFromDatabase", distanceFromDatabase);
        request.setAttribute("averageTimeFromDatabase", averageTimeFromDatabase);
        request.setAttribute("averagePaceFromDatabase", averagePaceFromDatabase);
        request.setAttribute("weatherConditionFromDatabase", weatherConditionFromDatabase);
        
        // Forward the request to the JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/mountain_details.jsp");
        dispatcher.forward(request, response);
    }
}
