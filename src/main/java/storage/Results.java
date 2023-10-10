package storage;

import java.text.SimpleDateFormat;
import java.util.ArrayDeque;

public class Results {
    private ArrayDeque<Result> results = null;

    public Results() {
        results = new ArrayDeque<>();
    }

    public ArrayDeque<Result> getResults() {
        return results;
    }

    public void addResult(Result result) {
        results.addLast(result);
    }

    public Result getLastResult() {return results.getLast();}

}
