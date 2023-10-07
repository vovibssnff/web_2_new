package storage;

import java.time.LocalTime;
import java.util.Date;

public class Result {
    private double x;
    private double y;
    private double r;
    private Boolean result;
    private LocalTime queryTime;

    public Result(double x, double y, double r, boolean result, LocalTime queryTime) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.result = result;
        this.queryTime = queryTime;
    }

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public double getR() {
        return r;
    }

    public Boolean getResult() {
        return result;
    }

    public LocalTime getQueryTime() {
        return queryTime;
    }
}
