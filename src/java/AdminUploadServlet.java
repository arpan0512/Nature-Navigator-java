import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/AdminUploadServlet")
@MultipartConfig(maxFileSize = 16177215)
public class AdminUploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            
            throws ServletException, IOException {
         Part filePart = request.getPart("imageFile");
        String fileName = filePart.getSubmittedFileName();
        InputStream fileContent = filePart.getInputStream();
        // Retrieve form data
        String mountainName = request.getParameter("mountainName");
        double distance = Double.parseDouble(request.getParameter("distance"));
        double averageTime = Double.parseDouble(request.getParameter("averageTime"));
        double averagePace = Double.parseDouble(request.getParameter("averagePace"));
        String weatherCondition = request.getParameter("weatherCondition");

        // JDBC URL, username, and password
        String jdbcUrl = "jdbc:mysql://localhost:3306/mysql";
        String username = "root";
        String password = "";

        // SQL query to insert data
        String sql = "INSERT INTO mountains (image, mountain_name, distance, average_time, average_pace, weather_condition) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
} catch (ClassNotFoundException e) {
    e.printStackTrace();
}
        try (Connection conn = DriverManager.getConnection(jdbcUrl, username, password);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            // Set parameters for the PreparedStatement
            // Set parameters for the PreparedStatement
stmt.setBlob(1, fileContent); // Set the image blob as the first parameter
stmt.setString(2, mountainName);
stmt.setDouble(3, distance);
stmt.setDouble(4, averageTime);
stmt.setDouble(5, averagePace);
stmt.setString(6, weatherCondition);

            // Execute the query
            int rowsAffected = stmt.executeUpdate();

            // Set a message attribute based on the result of the insert operation
            if (rowsAffected > 0) {
                request.setAttribute("message", "Mountain data uploaded successfully!");
            } else {
                request.setAttribute("message", "Failed to upload mountain data. Please try again.");
            }
       } catch (SQLException e) {
    // Handle specific SQL exceptions
    String errorMessage = "An error occurred while uploading mountain data: " + e.getMessage();
    request.setAttribute("message", errorMessage);
    e.printStackTrace();
}

        // Forward the request to the JSP page
        request.getRequestDispatcher("admin_upload.jsp").forward(request, response);
    }
}
