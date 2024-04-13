import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class AddReviewServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieve form data
        String mountain = request.getParameter("mountain");
        int rating = Integer.parseInt(request.getParameter("rating"));
        String review = request.getParameter("review");

        // Retrieve username from session
        String username = null;
        HttpSession session = request.getSession(false); // Retrieve existing session, don't create new

        if (session != null) {
            username = (String) session.getAttribute("u_name"); // Assuming the session attribute is "u_name"
        }

        // JDBC connection parameters
        String url = "jdbc:mysql://localhost:3306/mysql";
        String dbUsername = "root";
        String dbPassword = "";

        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish connection
            Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword);

            // Create SQL query
            String sql = "INSERT INTO reviews (u_name, mountain, rating, review) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, mountain);
            pstmt.setInt(3, rating);
            pstmt.setString(4, review);

            // Execute the query
            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                // Close resources
                pstmt.close();
                conn.close();

                // Redirect back to the mountain details page with the added review
                response.sendRedirect("mountain_details.jsp?mountain=" + mountain);
            } else {
                out.println("<h2>Failed to add review.</h2>");
            }

        } catch (Exception ex) {
            out.println("<h2>Error: " + ex.getMessage() + "</h2>");
            ex.printStackTrace();
        }
    }
}
