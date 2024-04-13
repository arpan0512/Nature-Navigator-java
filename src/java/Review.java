public class Review {
    private String mountain;
    private double rating;
    private String reviewText;

    public Review(String mountain, double rating, String reviewText) {
        this.mountain = mountain;
        this.rating = rating;
        this.reviewText = reviewText;
    }

    public String getMountain() {
        return mountain;
    }

    public void setMountain(String mountain) {
        this.mountain = mountain;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public String getReviewText() {
        return reviewText;
    }

    public void setReviewText(String reviewText) {
        this.reviewText = reviewText;
    }
}
