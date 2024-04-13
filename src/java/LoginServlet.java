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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Establish database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "");

            // Prepare SQL statement to fetch user by email
            String sql = "SELECT u_name, password FROM registor WHERE email = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);

            // Execute query
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // User with the provided email exists
                String dbPassword = rs.getString("password");
                String u_name = rs.getString("u_name");
                // Check if the provided password matches the one in the database
                if (password.equals(dbPassword)) {
                    // Authentication successful
                    // Create a session
                    HttpSession session = request.getSession();
                    // Set session attributes
                    session.setAttribute("email", email);
                    session.setAttribute("u_name", u_name);
                    // Redirect to home page or some other page
                    response.sendRedirect("home.jsp");
                } else {
                    // Authentication failed
                    out.println("Invalid email or password. Please try again.");
                }
            } else {
                // User with the provided email does not exist
                out.println("User not found. Please register.");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle any database errors
            out.println("Error connecting to database.");
        } finally {
            // Close the resources
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
