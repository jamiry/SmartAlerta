<%-- 
    Document   : registro
 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <<meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>[Registro] Smart Alerta!</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="robots" content="all,follow">
        <!-- Bootstrap CSS-->
        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome CSS-->
        <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
        <!-- Custom icon font-->
        <link rel="stylesheet" href="css/fontastic.css">
        <!-- Google fonts - Roboto 
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700">
        -->
        <!-- jQuery Circle-->
        <link rel="stylesheet" href="css/grasp_mobile_progress_circle-1.0.0.min.css">
        <!-- Custom Scrollbar-->
        <link rel="stylesheet" href="vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css">
        <!-- theme stylesheet-->
        <link rel="stylesheet" href="css/style.blue.css" id="theme-stylesheet">
        <!-- Custom stylesheet - for your changes-->
        <link rel="stylesheet" href="css/custom.css">
        <!-- Favicon-->
        <link rel="shortcut icon" href="favicon.png">
        <!-- Tweaks for older IEs--><!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    </head>
    <body>
        <div class="page register-page">
            <div class="container">
                <div class="form-outer text-center d-flex align-items-center">
                    <div class="form-inner">
                        <div class="logo text-uppercase"><strong class="text-secondary">Smart</strong><strong class="text-primary">Alerta!</strong></div>
                        <form id="register-form" method="post" action="RegistrarUsuario">
                            <div class="form-group">
                                <label for="register-name" class="label-custom">Nome de Apresentação</label>
                                <input id="register-name" type="text" name="registroNome" required>
                            </div>
                            <div class="form-group">
                                <label for="register-email" class="label-custom">Email</label>
                                <input id="register-email" type="email" name="registroEmail">
                            </div>
                            <div class="form-group">
                                <label for="register-username" class="label-custom">Usuário</label>
                                <input id="register-username" type="text" name="registroUsuario" required>
                            </div>
                            <div class="form-group">
                                <label for="register-passowrd" class="label-custom">Senha</label>
                                <input id="register-passowrd" type="password" name="registroSenha" required>
                            </div><br/>
                            <button id="register" type="submit" class="btn btn-primary">Registrar-se</button>
                        </form><small>Já tem uma conta? </small><a href="login.jsp" class="signup">Fazer Login</a>
                    </div>
                    <div class="copyrights text-center">
                        <p>Design by <a href="https://bootstrapious.com" target="_blank" class="external">DevOps Group</a></p>
                        <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
                    </div>
                </div>
            </div>
        </div>

        <!-- Nome/Login/Email inválidos Modal-->
        <div id="nome_login_email_invalidos_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-center">
            <div role="document" class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 id="exampleModalLabel" class="modal-title"><strong class="text-danger">Ops!</strong></h4>
                        <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <p><strong class="text-danger">Não foi possível finalizar o registro.</strong></p>
                        <p><strong class="text-warning">Motivo:</strong> <b>Nome de Apresentação</b>, <b>Usuário</b> e <b>Email</b> já estão em uso.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" data-dismiss="modal" class="btn btn-secondary">Fechar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Nome/Login inválidos Modal-->
        <div id="nome_login_invalidos_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-center">
            <div role="document" class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 id="exampleModalLabel" class="modal-title"><strong class="text-danger">Ops!</strong></h4>
                        <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <p><strong class="text-danger">Não foi possível finalizar o registro.</strong></p>
                        <p><strong class="text-warning">Motivo:</strong> <b>Nome de Apresentação</b> e <b>Usuário</b> já estão em uso.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" data-dismiss="modal" class="btn btn-secondary">Fechar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Nome/Email inválidos Modal-->
        <div id="nome_email_invalidos" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-center">
            <div role="document" class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 id="exampleModalLabel" class="modal-title"><strong class="text-danger">Ops!</strong></h4>
                        <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <strong class="text-danger">Não foi possível finalizar o registro.</strong>
                        <p><strong class="text-warning">Motivo:</strong> <b>Nome de Apresentação</b> e <b>Email</b> já estão em uso.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" data-dismiss="modal" class="btn btn-secondary">Fechar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Login/Email inválidos Modal-->
        <div id="login_email_invalidos_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-center">
            <div role="document" class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 id="exampleModalLabel" class="modal-title"><strong class="text-danger">Ops!</strong></h4>
                        <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <strong class="text-danger">Não foi possível finalizar o registro.</strong>
                        <p><strong class="text-warning">Motivo:</strong> <b>Usuário</b> e <b>Email</b> já estão em uso.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" data-dismiss="modal" class="btn btn-secondary">Fechar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Nome inválido Modal-->
        <div id="nome_invalido_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-center">
            <div role="document" class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 id="exampleModalLabel" class="modal-title"><strong class="text-danger">Ops!</strong></h4>
                        <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <strong class="text-danger">Não foi possível finalizar o registro.</strong>
                        <p><strong class="text-warning">Motivo:</strong> <b>Nome de Apresentação</b> já está em uso.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" data-dismiss="modal" class="btn btn-secondary">Fechar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Usuário inválido Modal-->
        <div id="login_invalido_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-center">
            <div role="document" class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 id="exampleModalLabel" class="modal-title"><strong class="text-danger">Ops!</strong></h4>
                        <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <p><strong class="text-danger">Não foi possível finalizar o registro.</strong></p>
                        <p><strong class="text-warning">Motivo:</strong> <b>Usuário</b> já está em uso.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" data-dismiss="modal" class="btn btn-secondary">Fechar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Email inválido Modal-->
        <div id="email_invalido_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-center">
            <div role="document" class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 id="exampleModalLabel" class="modal-title"><strong class="text-danger">Ops!</strong></h4>
                        <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <p><strong class="text-danger">Não foi possível finalizar o registro.</strong></p>
                        <p><strong class="text-warning">Motivo:</strong> <b>Email</b> já está em uso.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" data-dismiss="modal" class="btn btn-secondary">Fechar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Nome/Usuário válido Modal-->
        <div id="registro_sucesso_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-center">
            <div role="document" class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 id="exampleModalLabel" class="modal-title"><strong class="text-success">Isso ai!</strong></h4>
                        <button type="button" onclick="window.location.href = 'login.jsp'" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <p><strong class="text-success">Registro concluído com sucesso.</strong></p>
                        <p><strong class="text-primary">Agora é só fazer login.</strong></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" onclick="window.location.href = 'login.jsp'" data-dismiss="modal" class="btn btn-primary">OK!</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Javascript files-->
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="vendor/jquery.cookie/jquery.cookie.js"></script>
        <script src="js/grasp_mobile_progress_circle-1.0.0.min.js"></script>
        <script src="vendor/jquery-validation/jquery.validate.min.js"></script>
        <script src="vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
        <script src="js/front.js"></script>
        <!-- Google Analytics: change UA-XXXXX-X to be your site's ID.-->
        <!---->
        <script>
                            (function (b, o, i, l, e, r) {
                                b.GoogleAnalyticsObject = l;
                                b[l] || (b[l] =
                                        function () {
                                            (b[l].q = b[l].q || []).push(arguments)
                                        });
                                b[l].l = +new Date;
                                e = o.createElement(i);
                                r = o.getElementsByTagName(i)[0];
                                e.src = '//www.google-analytics.com/analytics.js';
                                r.parentNode.insertBefore(e, r)
                            }(window, document, 'script', 'ga'));
                            ga('create', 'UA-XXXXX-X');
                            ga('send', 'pageview');
        </script>
        <c:choose>
            <c:when test="${login_valido && nome_valido && email_valido}">
                <script>
                    $(document).ready(function () {
                        $("#registro_sucesso_modal").modal();
                    });
                </script>
            </c:when>
            <c:when test="${(nome_valido == false) && (login_valido == false) && (email_valido == false)}">
                <script>
                    $(document).ready(function () {
                        $("#nome_login_email_invalidos_modal").modal();
                    });
                </script>
            </c:when>
            <c:when test="${(nome_valido == false) && (login_valido == false)}">
                <script>
                    $(document).ready(function () {
                        $("#nome_login_invalidos_modal").modal();
                    });
                </script>
            </c:when>
            <c:when test="${(nome_valido == false) && (email_valido == false)}">
                <script>
                    $(document).ready(function () {
                        $("#nome_email_invalidos_modal").modal();
                    });
                </script>
            </c:when>
            <c:when test="${(login_valido == false) && (email_valido == false)}">
                <script>
                    $(document).ready(function () {
                        $("#login_email_invalidos_modal").modal();
                    });
                </script>
            </c:when>
            <c:when test="${nome_valido == false}">
                <script>
                    $(document).ready(function () {
                        $("#nome_invalido_modal").modal();
                    });
                </script>
            </c:when>
            <c:when test="${login_valido == false}">
                <script>
                    $(document).ready(function () {
                        $("#login_invalido_modal").modal();
                    });
                </script>
            </c:when>
            <c:when test="${email_valido == false}">
                <script>
                    $(document).ready(function () {
                        $("#email_invalido_modal").modal();
                    });
                </script>
            </c:when>
        </c:choose>
    </body>
</html>
