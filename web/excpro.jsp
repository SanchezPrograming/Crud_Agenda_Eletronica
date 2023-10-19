
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir produtos</title>
    </head>
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
            margin-bottom: 5px;

        }

        input[type="text"] {
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
        }

        input[type="submit"]:hover {
            background-color: #45A049;
        }

        p {
            color: red;
        }
    </style>
    <body>
        <form action="excpro.jsp" method="GET">
            <label for="id">Informe o ID para excluir:</label>
            <input type="text" id="id" name="id">
            <input type="submit" value="Excluir Produto">
        </form>
        <%
            String idParameter = request.getParameter("id");
            if (idParameter != null && !idParameter.isEmpty()) {
                int cod = Integer.parseInt(idParameter);
                try {
                    //Conecta ao banco de dados chamado banco
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud", "root", "2127");
                    // Excluem o produto de código informado
                    PreparedStatement st = conecta.prepareStatement("DELETE FROM tarefa WHERE id=?");
                    st.setInt(1, cod);
                    int resultado = st.executeUpdate(); // Executa o comando DELETE
                    //Verifica se o produto foi ou não excluído
                    if (resultado == 0) {
                        out.print("Este produto não está cadastrado");
                    } else {
                        out.print("O produto de código " + cod + " foi excluído com sucesso");
                    }
                } catch (Exception erro) {
                    String mensagemErro = erro.getMessage();
                    out.print("Entre em contato com o suporte e informe o erro " + mensagemErro);
                }
            } else {
                out.print("");
            }
        %>   
    </body>
</html>
