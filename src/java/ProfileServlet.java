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
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String u_name = (String) session.getAttribute("u_name");
        List<Review> userReviews = new ArrayList<>();

        if (u_name != null) {
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_database_name", "username", "password");
                 PreparedStatement stmt = conn.prepareStatement("SELECT * FROM reviews WHERE u_name = ?")) {
                stmt.setString(1, u_name);
                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        String mountain = rs.getString("mountain");
                        int rating = rs.getInt("rating");
                        String reviewText = rs.getString("review_text");
                        // Create a Review object and add it to the list
                        Review review = new Review(mountain, rating, reviewText);
                        userReviews.add(review);
                    }
                }
            } catch (SQLException e) {
                // Log the exception
                e.printStackTrace();
                // You can also add additional logging or handle the error in other ways
                request.setAttribute("error", "An error occurred while fetching the reviews.");
            }
        } else {
            // Handle the case where u_name is null
            request.setAttribute("error", "Username is not set in the session.");
        }

        request.setAttribute("u_name", u_name);
        request.setAttribute("userReviews", userReviews);
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }
}
