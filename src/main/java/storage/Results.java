package storage;

import java.text.SimpleDateFormat;
import java.util.ArrayDeque;

public class Results {
    private ArrayDeque<Result> results = null;
    private final SimpleDateFormat simpleDateFormat;

    public Results() {
        results = new ArrayDeque<>();
        simpleDateFormat = new SimpleDateFormat("HH:mm:ss");
    }

    public ArrayDeque<Result> getResults() {
        return results;
    }

    public void addResult(Result result) {
        results.addFirst(result);
    }

    public SimpleDateFormat getSimpleDateFormat() {
        return simpleDateFormat;
    }
}
