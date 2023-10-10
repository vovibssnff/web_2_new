package storage;

import java.time.LocalTime;

public class Result {
    private int x;
    private int y;
    private int r;
    private LocalTime currentTime;
    private long executionTime;
    private Boolean result;

    public Result(int x, int y, int r, LocalTime currentTime, long startTimestamp, boolean result) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.currentTime = currentTime;
        this.executionTime = startTimestamp;
        this.result = result;
    }

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }

    public int getR() {
        return r;
    }

    public LocalTime getCurrentTime() {return currentTime;}

    public long getExecutionTime() {
        return executionTime;
    }

    public Boolean getResult() {
        return result;
    }

    public void setExecutionTime(long executionTime) {this.executionTime=executionTime;}

}
