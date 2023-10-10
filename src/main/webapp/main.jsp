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
            <h3>Бессонов Владимир Юрьевич<br>P3212<br>2238</h3>
        </div>
    </div>
    <c:if test="${not empty error_message}">
        <div class="error-message">
            <p>${error_message}</p>
        </div>
    </c:if>
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

<%--            <svg height="300" width="300" xmlns="http://www.w3.org/2000/svg">--%>
<%--                <!-- Стерлки и оси -->--%>
<%--                <line stroke="black" x1="0" x2="300" y1="150" y2="150"></line>--%>
<%--                <line stroke="black" x1="150" x2="150" y1="0" y2="300"></line>--%>
<%--                <polygon fill="black" points="150,0 144,15 156,15" stroke="black"></polygon>--%>
<%--                <polygon fill="black" points="300,150 285,156 285,144" stroke="black"></polygon>--%>

<%--                <!-- Деления -->--%>
<%--                <line stroke="black" x1="200" x2="200" y1="155" y2="145"></line>--%>
<%--                <line stroke="black" x1="250" x2="250" y1="155" y2="145"></line>--%>

<%--                <line stroke="black" x1="50" x2="50" y1="155" y2="145"></line>--%>
<%--                <line stroke="black" x1="100" x2="100" y1="155" y2="145"></line>--%>

<%--                <line stroke="black" x1="145" x2="155" y1="100" y2="100"></line>--%>
<%--                <line stroke="black" x1="145" x2="155" y1="50" y2="50"></line>--%>

<%--                <line stroke="black" x1="145" x2="155" y1="200" y2="200"></line>--%>
<%--                <line stroke="black" x1="145" x2="155" y1="250" y2="250"></line>--%>

<%--                <!-- Подписи к делениям и осям -->--%>
<%--                <text fill="black" x="195" y="140">R/2</text>--%>
<%--                <text fill="black" x="250" y="140">R</text>--%>

<%--                <text fill="black" x="40" y="140">-R</text>--%>
<%--                <text fill="black" x="85" y="140">-R/2</text>--%>

<%--                <text fill="black" x="160" y="55">R</text>--%>
<%--                <text fill="black" x="160" y="105">R/2</text>--%>

<%--                <text fill="black" x="160" y="204">-R/2</text>--%>
<%--                <text fill="black" x="160" y="255">-R</text>--%>

<%--                <text fill="black" x="285" y="140">X</text>--%>
<%--                <text fill="black" x="160" y="15">Y</text>--%>

<%--                <!-- Первая фигура (1 четверть) -->--%>
<%--                <polygon fill="purple"--%>
<%--                         fill-opacity="0.2"--%>
<%--                         stroke="blue"--%>
<%--                         points="150,150 250,150 150,250"></polygon>--%>

<%--                <!-- Вторая фигура (2 четверть) -->--%>
<%--                <polygon fill="purple"--%>
<%--                         fill-opacity="0.2"--%>
<%--                         stroke="blue"--%>
<%--                         points="50,50 50,150 150,150 150,50"></polygon>--%>

<%--                <!-- Третья фигура (3 четверть) -->--%>
<%--                <!-- Third figure (3rd coordinate plane) -->--%>
<%--                <path fill="purple"--%>
<%--                      fill-opacity="0.2"--%>
<%--                      stroke="blue"--%>
<%--                      d="M 100 150 A 49 49, 90, 0, 0, 150 200 L 150 150 Z"></path>--%>



<%--                <!-- Точки на графике -->--%>

<%--                <%--%>
<%--                    try {--%>
<%--                        for (Result res : results.getResults()) {--%>
<%--                %>--%>
<%--                <circle--%>
<%--                        cx="<%= 300/2 + (res.getX() + 0.02) / res.getR() * 100 %>"--%>
<%--                        cy="<%= 300/2 + (res.getY() - 0.02) / res.getR() * -100 %>"--%>
<%--                        r="3.5"--%>
<%--                        id="target-dot"--%>
<%--                        fill="<%= res.getResult() ? "green" : "red"%>">--%>
<%--                </circle>--%>
<%--                <%--%>
<%--                    }--%>
<%--                        } catch (NullPointerException e) {--%>
<%--                    }--%>
<%--                %>--%>
<%--            </svg>--%>
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
                <th>Execution time (ms)</th>
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
                        out.println(String.format("<td>%s</td>", res.getExecutionTime()));
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