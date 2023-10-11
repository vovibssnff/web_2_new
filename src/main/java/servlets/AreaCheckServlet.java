package servlets;

import exceptions.IncorrectDataException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import storage.CustomResponseWrapper;
import storage.Result;
import storage.Results;

import java.io.IOException;
import java.time.LocalTime;

@WebServlet("/AreaCheckServlet")
public class AreaCheckServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            int x = Integer.parseInt(req.getParameter("val_x"));
            int y = Integer.parseInt(req.getParameter("val_y"));
            int r = Integer.parseInt(req.getParameter("val_r"));
            if (validate((char) x, x, -5, 3) &&
            validate((char) y, y, -5, 5) &&
            validate((char) r, r, 1, 4)) {
                boolean res = checkArea(x, y, r);
                Result result = new Result(x, y, r, LocalTime.now(), res);
                CustomResponseWrapper wrapper = (CustomResponseWrapper) resp;
                wrapper.setRes(result);
                Results results = null;
                try {
                    results = (Results) req.getServletContext().getAttribute("results");
                    results.addResult(result);
                    req.getServletContext().setAttribute("results", results);
                } catch (NullPointerException e) {
                    results = new Results();
                    results.addResult(result);
                    req.getServletContext().setAttribute("results", results);
                }
            }
        } catch (IncorrectDataException e) {
            req.getServletContext().setAttribute("error_message", e.getMessage());
        }
    }

    private boolean checkArea(int x, int y, int r) {
        if ((x>=-r && x<=0 && y>=0 && y<=r) ||
                (x*x+y*y<=(r*r)/4 && x<0 && y<0) ||
                (y>=x-r && x>=0 && y<=0)) {
            return true;
        } else {
            return false;
        }
    }
    private boolean validate(char var, Integer val, int lowerVal, int higherVal) throws IncorrectDataException {
        if (val != null &&val>=lowerVal&&val<=higherVal) { return true; }
        throw new IncorrectDataException("Invalid " + var + " value");
    }
}
