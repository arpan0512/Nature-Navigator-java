public class Mountain {
    private String name;
    private double distance;
    private double averageTime;
    private double averagePace;
    private String weatherCondition;

    public Mountain(String name, double distance, double averageTime, double averagePace, String weatherCondition) {
        this.name = name;
        this.distance = distance;
        this.averageTime = averageTime;
        this.averagePace = averagePace;
        this.weatherCondition = weatherCondition;
    }

    // Getters and setters
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getDistance() {
        return distance;
    }

    public void setDistance(double distance) {
        this.distance = distance;
    }

    public double getAverageTime() {
        return averageTime;
    }

    public void setAverageTime(double averageTime) {
        this.averageTime = averageTime;
    }

    public double getAveragePace() {
        return averagePace;
    }

    public void setAveragePace(double averagePace) {
        this.averagePace = averagePace;
    }

    public String getWeatherCondition() {
        return weatherCondition;
    }

    public void setWeatherCondition(String weatherCondition) {
        this.weatherCondition = weatherCondition;
    }
}
