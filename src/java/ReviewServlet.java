import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ReviewServlet")
public class ReviewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Not used for fetching user-specific reviews
    }

    // Method to retrieve reviews by username
    public List<Review> getReviewsByUsername(String username) {
        List<Review> reviews = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "");
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM reviews WHERE u_name = ?")) {
            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    String mountain = rs.getString("mountain");
                    double rating = rs.getDouble("rating");
                    String reviewText = rs.getString("review");
                    Review review = new Review(mountain, rating, reviewText);
                    reviews.add(review);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Log or handle the error appropriately
        }

        return reviews;
    }
}
