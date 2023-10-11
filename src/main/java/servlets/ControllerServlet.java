package servlets;

import exceptions.IncorrectDataException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import storage.CustomResponseWrapper;
import storage.Result;
import storage.Results;

import java.io.IOException;

@WebServlet("/ControllerServlet")
public class ControllerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CustomResponseWrapper wrapper = new CustomResponseWrapper(resp);
        try {
            req.getRequestDispatcher("/AreaCheckServlet").include(req, wrapper);
            if (!"".equals(req.getParameter("error_message"))) {
                throw new IncorrectDataException(req.getParameter("error_message"));
            } else {
                req.getRequestDispatcher("main.jsp").forward(req, resp);
            }
        } catch (RuntimeException | IncorrectDataException e) {
            req.getRequestDispatcher("main.jsp").forward(req, resp);
        }

    }
}
