<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f1f1f1;
        }

        .success-message {
            background-color: #4caf50;
            color: #fff;
            text-align: center;
            padding: 10px;
            border-radius: 5px;
            margin: 20px auto;
            max-width: 400px;
            font-size: 18px;
        }
    </style>
    <title>Alteração de Tarefas</title>
</head>
<body>
    <%
        // Receber os dados ALTERADOS no formulário carregaprod.jsp
        int id;
        String novoNome, novoHorario, novaData, novaDescricao;
        id = Integer.parseInt(request.getParameter("id"));
        novoNome = request.getParameter("nome");
        novoHorario = request.getParameter("hora");
        novaData = request.getParameter("datas");
        novaDescricao = request.getParameter("descri");

        try {
            // Fazer a conexão com o Banco de Dados
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud", "root", "2127");
            // Alterar os dados na tabela tarefa do BD
            st = conecta.prepareStatement("UPDATE tarefa SET nome = ?, hora = ?, datas = ?, descri = ? WHERE id = ?");
            st.setString(1, novoNome);
            st.setString(2, novoHorario);
            st.setString(3, novaData);
            st.setString(4, novaDescricao);
            st.setInt(5, id);
            st.executeUpdate(); // Executa o UPDATE
    %>
            <div class="success-message">
                Os dados da tarefa com ID <%= id %> foram alterados com sucesso
            </div>
    <%
        } catch (Exception erro) {
    %>
            <div class="error-message">
                Erro: <%= erro.getMessage() %>
            </div>
    <%
        }
    %>
</body>
</html>
