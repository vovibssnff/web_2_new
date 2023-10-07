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

import java.io.IOException;

@WebServlet("/ControllerServlet")
public class ControllerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CustomResponseWrapper wrapper = new CustomResponseWrapper(resp);
        //req.getRequestDispatcher("/AreaCheckServlet").include(req, wrapper);

//        String resultString = wrapper.getRes().getResult().toString();
//        String queryTimeString = wrapper.getRes().getQueryTime().toString();
//        resp.setContentType("text/plain");
//        resp.getWriter().write(queryTimeString + ", " + resultString);
//        resp.getWriter().close();
//        resp.getWriter().flush();
//        resp.getWriter().close();

        String resultString = "hi_cutie, omg_my_app_works";
        resp.setContentType("text/plain");
        resp.getWriter().print(resultString);
//        resp.setStatus(HttpServletResponse.SC_OK);
    }
}
