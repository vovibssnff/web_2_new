package servlets;

import exceptions.IncorrectDataException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpServletResponseWrapper;
import storage.CustomResponseWrapper;
import storage.Result;

import java.io.IOException;
import java.time.LocalTime;

@WebServlet("/AreaCheckServlet")
public class AreaCheckServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Retrieve the values of x, y, and r from the req
        int x = Integer.parseInt(req.getParameter("val_x"));
        int y = Integer.parseInt(req.getParameter("val_y"));
        int r = Integer.parseInt(req.getParameter("val_r"));

        // Perform your logic to check the area based on x, y, and r
        try {
            if (validate((char) x, x, -5, 3) &&
            validate((char) y, y, -5, 5) &&
            validate((char) r, r, 1, 4)) {
                Result result = new Result(x, y, r, checkArea(x, y, r), LocalTime.now()); //TODO время
                CustomResponseWrapper wrapper = (CustomResponseWrapper) resp;
                wrapper.setRes(result);
                resp = wrapper;
//                req.getRequestDispatcher("/main.jsp").include(req, wrapper);
            }
        } catch (IncorrectDataException e) {
            req.setAttribute("error_message", e.getMessage());
            getServletContext().getRequestDispatcher("/error.jsp").forward(req, resp);
        }
    }

    // Your logic to check the area goes here
    private boolean checkArea(int x, int y, int r) {
        // Perform the area calculation or other logic and return the result as a String
        // Example logic:
        if ((x >= 0 && x <= r) && (y >= 0 && y <= r / 2)) {
            return true;
        } else {
            return false;
        }
    }
    private boolean validate(char var, Integer val, int lowerVal, int higherVal) throws IncorrectDataException {
        if (!val.equals(null)&&val>=lowerVal&&val<=higherVal) { return true; }
        throw new IncorrectDataException("Invalid " + var + " value");
    }
}
