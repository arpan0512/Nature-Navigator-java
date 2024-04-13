import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "UploadImageServlet", urlPatterns = {"/UploadImageServlet"})
@MultipartConfig(maxFileSize = 16177215) // 16MB
public class UploadImageServlet extends HttpServlet {

    // Database Connection Details
    private static final String dbURL = "jdbc:mysql://localhost:3306/mysql";
    private static final String dbUser = "root";
    private static final String dbPass = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get image data from request
        Part filePart = request.getPart("imageFile");
        String fileName = filePart.getSubmittedFileName();
        InputStream fileContent = filePart.getInputStream();

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // Insert image into database
            pstmt = conn.prepareStatement("INSERT INTO images (name, image) VALUES (?, ?)");
            pstmt.setString(1, fileName);
            pstmt.setBlob(2, fileContent);
            pstmt.executeUpdate();

            response.sendRedirect("picture.jsp"); // Redirect to success page
        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect("picture.jsp"); // Redirect to error page
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
