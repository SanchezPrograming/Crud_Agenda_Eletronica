<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Listagem de produtos</title>
        <style>
            body {
                background-color: #f4f4f4;
                font-family: Arial, sans-serif;
                text-align: center;
            }

            table {
                width: 70%;
                background-color: #fff;
                border: 1px solid #c0c0c0;
                margin: 20px auto;
                border-collapse: collapse;
            }

            th {
                background-color: #333;
                color: white;
                text-align: left;
                padding: 10px;
            }

            td {
                border: 1px solid #ededed;
                padding: 10px;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #ddd;
            }

            th, td {
                min-width: 100px;
            }
        </style>

    </head>
    <body>
        <%
            try {
                //Fazer a conexão com o Banco de Dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud", "root", "2127");
                //Listar os dados da tabela produto do banco de dados 
                st = conecta.prepareStatement("SELECT * FROM tarefa");
                ResultSet rs = st.executeQuery();
        %>
        <table border="1">
            <tr>
                <th>ID</th><th>Nome</th><th>Horario</th><th>Dia</th><th>Descrição</th>
            </tr>                
            <%
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id")%></td>
                <td><%= rs.getString("nome")%></td>
                <td><%= rs.getString("hora")%></td>
                <td><%= rs.getString("datas")%></td>
                <td><%= rs.getString("descri")%></td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            } catch (Exception x) {
                out.print("Mensagem de erro:" + x.getMessage());
            }
        %>   
    </body>
</html>
