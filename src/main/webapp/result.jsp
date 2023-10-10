<%@ page import="storage.Result" %>
<%@ page import="storage.Results"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    Results results = (Results) application.getAttribute("results");
%>

<html>
<head>
    <meta charset="utf-8">
</head>
<body>
<div class="back-container">
        <%@ include file="main.jsp" %>
        <div id="result-table-container" align="center">
<%--            <script src="js/main.js"></script>--%>
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
                    for (Result res : results.getResults()) {
                        out.println("<tr>");
                        out.println(String.format("<td>%.2f</td>", res.getX()));
                        out.println(String.format("<td>%.2f</td>", res.getY()));
                        out.println(String.format("<td>%.2f</td>", res.getR()));
                        out.println(String.format("<td>%s</td>", res.getExecutionTime()));
                        out.println(String.format("<td>%s</td>", res.getExecutionTime()));
                        out.println(String.format("<td>%s</td>", res.getResult()));
                        out.println("</tr>");
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>