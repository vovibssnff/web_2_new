package servlets;

import jakarta.json.JsonObject;
import jakarta.json.JsonReader;
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
        req.getRequestDispatcher("/AreaCheckServlet").include(req, wrapper);
        if ("".equals(req.getParameter("error_message"))) {
            Result result = ((Results) req.getServletContext().getAttribute("results")).getLastResult();
            long stop = System.currentTimeMillis();
            result.setExecutionTime(stop - result.getExecutionTime());
            req.getRequestDispatcher("main.jsp").forward(req, resp);
        } else {

            req.getRequestDispatcher("main.jsp").forward(req, resp);
        }
    }
}
