import java.io.IOException;
import java.io.PrintWriter;
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
import javax.servlet.http.HttpSession;

@WebServlet("/Reg")
public class Reg extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        String u_name = request.getParameter("u_name");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "")) {
                // Check if the username or email already exist
                PreparedStatement checkStmt = con.prepareStatement("SELECT * FROM registor WHERE u_name=? OR email=?");
                checkStmt.setString(1, u_name);
                checkStmt.setString(2, email);
                ResultSet rs = checkStmt.executeQuery();
                if (rs.next()) {
                    // If username or email already exist, send response indicating the conflict
                    response.setStatus(HttpServletResponse.SC_CONFLICT); // HTTP status code 409 Conflict
                    response.getWriter().write("Username or email already exists!");
                } else {
                    // Insert the new record if username and email are unique
                    PreparedStatement insertStmt = con.prepareStatement("INSERT INTO registor(u_name, email, password) VALUES (?, ?, ?)");
                    insertStmt.setString(1, u_name);
                    insertStmt.setString(2, email);
                    insertStmt.setString(3, pass);
                    int i = insertStmt.executeUpdate();

                    // Create a session and store uname and email attributes
                    HttpSession session = request.getSession();
                    session.setAttribute("u_name", u_name);
                    session.setAttribute("email", email);

                    // Fetch the u_name from the database and store it in the session
                    PreparedStatement fetchStmt = con.prepareStatement("SELECT u_name FROM registor WHERE email=?");
                    fetchStmt.setString(1, email);
                    ResultSet result = fetchStmt.executeQuery();
                    if (result.next()) {
                        String fetchedUName = result.getString("u_name");
                        session.setAttribute("fetchedUName", fetchedUName);
                    }

                    // Send success response
                    response.setStatus(HttpServletResponse.SC_OK); // HTTP status code 200 OK
                    response.sendRedirect("home.jsp"); // Redirect to home.jsp
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            pw.println(ex);
        }
    }
}
