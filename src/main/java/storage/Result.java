package storage;

import java.time.LocalTime;

public class Result {
    private final int x;
    private final int y;
    private final int r;
    private final LocalTime currentTime;
    private final Boolean result;

    public Result(int x, int y, int r, LocalTime currentTime, boolean result) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.currentTime = currentTime;
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

    public Boolean getResult() {
        return result;
    }

}
