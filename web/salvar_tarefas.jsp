<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.time.LocalDate, java.time.LocalTime"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f1f1f1;
            }

            .success-message {
                background-color: #4caf50; /* Cor de fundo verde */
                color: #fff; /* Texto branco */
                text-align: center;
                padding: 10px;
                border-radius: 5px;
                margin: 20px auto;
                max-width: 400px;
                font-size: 18px;
            }
        </style>
    </head>
    <body>
        <%
            String nome = request.getParameter("nome");
            String horaStr = request.getParameter("hora");
            String datasStr = request.getParameter("datas");
            String descri = request.getParameter("descri");

            LocalDate datas = LocalDate.parse(datasStr);
            LocalTime hora = LocalTime.parse(horaStr);

            Connection conecta = null;
            PreparedStatement st = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud", "root", "2127");
                st = conecta.prepareStatement("INSERT INTO tarefa (nome, hora, datas, descri) VALUES (?, ?, ?, ?)");
                st.setString(1, nome);
                st.setObject(2, hora);
                st.setObject(3, datas);
                st.setString(4, descri);
                st.executeUpdate();
        %>
        <div class="success-message">Tarefa cadastrada com sucesso</div>
        <%
        } catch (Exception e) {
            e.printStackTrace();
        %>
        <div class="error-message">Erro: <%= e.getMessage()%></div>
        <%
            } finally {
                if (conecta != null) {
                    conecta.close();
                }
            }
        %>
    </body>
</html>