package storage;

import java.util.Date;

public class Result {
    private double x;
    private double y;
    private double r;
    private boolean result;
    private Date queryTime;

    public Result(double x, double y, double r, boolean result, Date queryTime) {
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

    public boolean getResult() {
        return result;
    }

    public Date getQueryTime() {
        return queryTime;
    }
}
