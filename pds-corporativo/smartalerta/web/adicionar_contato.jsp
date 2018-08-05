<%-- 
    Document   : adicionar_contato
  
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${empty sessionScope.usuario}">
    <c:redirect url="/acesso_negado.jsp" context="/smartalerta"/>
</c:if>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>[Adicionar Contato] Smart Alerta!</title>
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
        <!-- Side Navbar -->
        <nav class="side-navbar">
            <div class="side-navbar-wrapper">
                <div class="sidenav-header d-flex align-items-center justify-content-center">
                    <div class="sidenav-header-inner text-center"><img src="img/avatar-1.jpg" alt="person" class="img-fluid rounded-circle">
                        <h2 class="h5 text-uppercase">${sessionScope.usuario.nome}</h2>
                    </div>
                    <div class="sidenav-header-logo"><a href="#" class="brand-small text-center"> <strong>S</strong><strong class="text-primary">A</strong></a></div>
                </div>
                <div class="main-menu">
                    <ul id="side-main-menu" class="side-menu list-unstyled">               
                        <li> <a href="#"> <i class="fa fa-home" style="font-size: 18px"></i><span>Início</span></a></li>
                        <li> <a href="#alerta" data-toggle="collapse" aria-expanded="false"><i class="fa fa-bell" style="font-size: 20px"></i><span>Alerta</span>
                                <div class="arrow pull-right"><i class="fa fa-angle-down" style="font-size: 20px"></i></div></a>
                            <ul id="alerta" class="collapse list-unstyled">
                                <li> <a href="cadastrar_alerta.jsp"><i class="fa fa-plus-square" style="font-size: 18px"></i><span>Cadastrar Alerta</span></a></li>
                                <li> <a href="EnviarAlerta"> <i class="fa fa-send" style="font-size: 16px"></i><span>Enviar Alerta</span></a></li>
                                <li> <a href="VerAlertas"> <i class="fa fa-bell" style="font-size: 16px"></i><span>Ver Alertas</span></a></li>
                                <li> <a href="AlertasEnviados"> <i class="fa fa-check-square" style="font-size: 18px"></i><span>Alertas Enviados</span></a></li>
                            </ul>
                        </li>
                        <li> <a href="#contato" data-toggle="collapse" aria-expanded="true"><i class="fa fa-address-book" style="font-size: 20px"></i><span>Contato</span>
                                <div class="arrow pull-right"><i class="fa fa-angle-down" style="font-size: 20px"></i></div></a>
                            <ul id="contato" class="list-unstyled">
                                <li class="active"> <a href="adicionar_contato.jsp#"> <i class="fa fa-user-plus" style="font-size: 16px"></i><span>Adicionar Contato</span></a></li>
                                <li> <a href="VerContatos"> <i class="fa fa-users" style="font-size: 16px"></i><span>Ver Contatos</span></a></li>
                            </ul>
                        </li>
                    </ul>
                </div>        
            </div>
        </nav>
        <div class="page forms-page">
            <!-- navbar-->
            <header class="header">
                <nav class="navbar">
                    <div class="container-fluid">
                        <div class="navbar-holder d-flex align-items-center justify-content-between">
                            <div class="navbar-header"><a id="toggle-btn" href="#" class="menu-btn"><i class="fa fa-bars" style="font-size: 25px"> </i></a><a href="#" class="navbar-brand">
                                    <div class="brand-text d-none d-md-inline-block"><strong class="text-secondary">Smart</strong><strong class="text-primary">Alerta!</strong></div></a></div>
                            <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">                
                                <li class="nav-item"><a href="FazerLogout" class="nav-link logout">Sair<i class="fa fa-sign-out"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </header>
            <div class="breadcrumb-holder">
                <div class="container-fluid">
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Início</a></li>
                        <li class="breadcrumb-item active">Adicionar Contato</li>
                    </ul>
                </div>
            </div>
            <section class="forms">
                <div class="container-fluid">
                    <header> 
                        <h1 class="h1 display">Adicionar Contato</h1>
                    </header>
                    <div class="row">            
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <form id="form_contato" action="AdicionarContato" method="post">
                                        <div class="form-group">
                                            <label>Nome</label>
                                            <input name="contatoNome" placeholder="Nome do Contato" class="form-control" required>             
                                        </div>
                                        <div class="line"></div>
                                        <div class="form-group">
                                            <label >Email</label>
                                            <input name="contatoEmail" placeholder="contato@email.com" class="form-control">                  
                                        </div>
                                        <div class="line"></div>
                                        <div class="form-group">
                                            <label>Telefone</label>
                                            <input id="fone" name="contatoFone" placeholder="(XX) 98877-6655" class="form-control" required>             
                                        </div>
                                        <div class="line"></div>
                                        <div class="form-group row">
                                            <div class="col-sm-6"></div>
                                            <div class="col-sm-6">
                                                <button type="submit" style="float: right;" class="btn btn-primary">Salvar</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            
            <!-- cadastro válido Modal-->
            <div id="valido_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-center">
                <div role="document" class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 id="exampleModalLabel" class="modal-title"><strong class="text-success">Sucesso!</strong></h4>
                            <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <p><strong class="text-success"><b class="text-primary">Contato</b> cadastrado com sucesso.</strong></p>
                            <p><strong class="text-success">Agora você pode enviar um alerta para ele.</strong></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" data-dismiss="modal" class="btn btn-primary">OK!</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- cadastro inválido Modal-->
            <div id="invalido_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-center">
                <div role="document" class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 id="exampleModalLabel" class="modal-title"><strong class="text-danger">Vixi!</strong></h4>
                            <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <p><strong class="text-danger">Cadastro de <b class="text-primary">contato</b> malsucedido.</strong></p>
                            <p class="text-danger"><strong>Motivo: <b class="text-primary">Nome</b> do contato já foi cadastrado, anteriormente, para um outro.</strong></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" data-dismiss="modal" class="btn btn-secondary">Fechar</button>
                        </div>
                    </div>
                </div>
            </div>
            
            <footer class="main-footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6">
                            <p>Smart Alerta! &copy; 2017</p>
                        </div>
                        <div class="col-sm-6 text-right">
                            <p>Design by <a href="#" class="external">Devops Group</a></p>
                            <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
                        </div>
                    </div>
                </div>
            </footer>
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
        <script>
            document.getElementById('fone').addEventListener('input', function (e) {
                var x = e.target.value.replace(/\D/g, '').match(/(\d{0,2})(\d{0,5})(\d{0,4})/);
                e.target.value = !x[2] ? x[1] : '(' + x[1] + ') ' + x[2] + (x[3] ? '-' + x[3] : '');
            });
        </script>    
        <!-- Google Analytics: change UA-XXXXX-X to be your site's ID.-->
        <c:choose>
            <c:when test="${valido}">
                <script>
                    $(document).ready(function () {
                        $("#valido_modal").modal();
                    });
                </script>
            </c:when>
            <c:when test="${valido == false}">
                <script>
                    $(document).ready(function () {
                        $("#invalido_modal").modal();
                    });
                </script>
            </c:when>
        </c:choose>
    </body>
</html>
