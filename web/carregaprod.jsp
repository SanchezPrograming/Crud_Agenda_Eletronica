<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
        }

        form {
            margin: 20px auto;
            max-width: 300px;
            background-color: #fff;
            border: 1px solid #c0c0c0;
            padding: 20px;
        }

        label {
            display: block;
            text-align: left;
            margin-bottom: 10px;
            width: 90%;
            padding: 10px;
        }

        input[type="number"],
        input[type="text"],
        input[type="date"],
        input[type="time"] {
            width: 90%;
            padding: 10px;
            margin-bottom: 15px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            margin-top: 10px;
        }

        input[type="submit"]:hover {
            background-color: #45A049;
        }
    </style>
        <title>Alteração de Tarefas</title>
    </head>
    <body>
        <%
            // Recebe o ID da tarefa a ser alterada
            int id;
            id = Integer.parseInt(request.getParameter("id"));
            // Fazer a conexão com o Banco de Dados
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud", "root", "2127");
            // Buscar a tarefa pelo ID recebido
            st = conecta.prepareStatement("SELECT * FROM tarefa WHERE id = ?");
            st.setInt(1, id);
            ResultSet resultado = st.executeQuery(); // Executa o SELECT
            // Verifica se a tarefa com o ID informado foi encontrada
            if (!resultado.next()) { // se não encontrou a tarefa
                out.print("Esta tarefa não foi encontrada");
            } else { // se encontrou a tarefa
        %>
        <form method="post" action="alterar_produtos.jsp">
            <p>
                <label for="id">ID:</label>
                <input type="number" name="id" id="id" value="<%= resultado.getInt("id") %>" readonly>
            </p>
            <p>
                <label for="nome">Nome da Tarefa:</label>
                <input type="text" name="nome" id="nome" size="50" value="<%= resultado.getString("nome") %>">
            </p>
            <p>
                <label for="hora">Horário:</label>
                <input type="time" name="hora" id="hora" value="<%= resultado.getTime("hora") %>" step="1">
            </p>
            <p>
                <label for="datas">Data:</label>
                <input type="date" name="datas" id="datas" value="<%= resultado.getDate("datas") %>">
            </p>
            <p>
                <label for="descri">Descrição:</label>
                <input type="text" name="descri" id="descri" value="<%= resultado.getString("descri") %>">
            </p>
            <p>
                <input type="submit" value="Salvar Alterações">
            </p>
        </form>
        <%
            }
        %>
    </body>
</html>
