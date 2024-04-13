import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class ContactUsServlet extends HttpServlet {
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // Retrieve form data
        String msg = request.getParameter("msg");
        
        // Retrieve username and email from session
        String uname = null;
        String email = null;
        HttpSession session = request.getSession(false); // Retrieve existing session, don't create new
        
        if (session != null) {
            uname = (String) session.getAttribute("u_name"); // Assuming the session attribute is "u_name"
            email = (String) session.getAttribute("email"); // Assuming the session attribute is "email"
        }
        
        // JDBC connection parameters
        String url = "jdbc:mysql://localhost:3306/mysql";
        String dbUsername = "root";
        String dbPassword = "";
        
        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish connection
            Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword);
            
            // Create SQL query
            String sql = "INSERT INTO contact_us (u_name, email, message) VALUES (?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, uname);
            pstmt.setString(2, email);
            pstmt.setString(3, msg);
            
            // Execute the query
            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                // Close resources
                pstmt.close();
                conn.close();
                
                // Send JavaScript alert to the client
                out.println("<script>alert('Your message has been submitted successfully!');</script>");
                response.sendRedirect("home.jsp"); // Redirect to contactus.jsp page
            } else {
                out.println("<h2>Failed to submit your message.</h2>");
            }
            
        } catch (Exception ex) {
            out.println("<h2>Error: " + ex.getMessage() + "</h2>");
            ex.printStackTrace();
        }
    }
}
