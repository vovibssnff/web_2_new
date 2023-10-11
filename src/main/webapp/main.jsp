<%@ page import="storage.Result" %>
<%@ page import="storage.Results" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    Results results = null;
    try {
        results = (Results) application.getAttribute("results");
    } catch (NullPointerException e) {
        results = new Results();
    }
%>
<html>
<head>
    <title>lab_1</title>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8"></meta>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" ></script>
</head>
<body>
<div class="all">
    <div id="header" class="header-container">
        <div class="header-content">
            <img id="avatar" src="images\photo_2023-02-26_00-39-08.jpg" alt="avatar">
        </div>
        <div id="student_info" class="header-content">
            <h3>Bessonov Vladimir Yurievich<br>P3212<br>2238</h3>
        </div>
    </div>
    <form id="form" class="form-container" action="${pageContext.request.contextPath}/ControllerServlet" method="get">
        <div class="form-content">

            <!-- X value (integer from -5 to 3) -->
            <div class="form-subcontent">
                <label for="x">X (between -5 and 3):</label>
                <select name="val_x" id="x">
                    <option value="-5">-5</option>
                    <option value="-4">-4</option>
                    <option value="-3">-3</option>
                    <option value="-2">-2</option>
                    <option value="-1">-1</option>
                    <option value="0">0</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                </select>
            </div>

            <br>

            <div class="form-subcontent">
                <!-- Y value (integer from -5 to 5) -->
                <label for="y">Y (between -5 and 5):</label>
                <input type="number" name="val_y" id="y" min="-5" max="5" required>
            </div>

            <br>
            <div class="form-subcontent">
                <!-- R value (integer from 1 to 4) -->
                <label for="r">R (between 1 and 4):</label>
                <input type="number" name="val_r" id="r" min="1" max="4" required>
            </div>
            <br>
            <input id="submit" type="submit" value="Submit">
        </div>
    </form>
    <div id="plot">
        <div class="svg-wrapper">
            <canvas id="canvas" width="450px" height="450px">

            </canvas>
        </div>
    </div>
    <div id="result-table-container" align="center">
        <table id="result-table">
            <thead>
            <tr>
                <th>X</th>
                <th>Y</th>
                <th>R</th>
                <th>Time</th>
                <th>Result</th>
            </tr>
            </thead>
            <tbody align="center">
            <%
                try {
                    for (Result res : results.getResults()) {
                        out.println("<tr>");
                        out.println(String.format("<td>%d</td>", res.getX()));
                        out.println(String.format("<td>%d</td>", res.getY()));
                        out.println(String.format("<td>%d</td>", res.getR()));
                        out.println(String.format("<td>%s</td>", res.getCurrentTime().toString()));
                        out.println(String.format("<td>%s</td>", res.getResult()));
                        out.println("</tr>");
                    }
                } catch (NullPointerException e) {
                }
            %>
            </tbody>
        </table>
    </div>
</div>
<script src="js/main.js"></script>
<script>

    window.onload = () => {
        document.getElementById("r").value = +location.href.charAt(location.href.length - 1);


        <%  if (results != null) {
            for (Result result : results.getResults()) {%>
        drawPointForJsp(<%= result.getX() %>, <%= result.getY() %>);
        <% }} %>
    }
</script>
</body>
</html>