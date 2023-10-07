package storage;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpServletResponseWrapper;

public class CustomResponseWrapper extends HttpServletResponseWrapper {
    private Result res;
    public CustomResponseWrapper(HttpServletResponse resp) {
        super(resp);
    }

    public Result getRes() {
        return res;
    }

    public void setRes(Result res) {
        this.res = res;
    }
}
