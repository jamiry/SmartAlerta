<%-- 
    Document   : enviar_alerta
 
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
        <title>[Enviar Alerta] Smart Alerta!</title>
        <!-- <base href="/bootstrap-dashboard/"> -->
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
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]
            <link rel="stylesheet" type="text/css" href="framework/demo-framework.css" />
            <script src="https://code.angularjs.org/1.2.9/angular.js"></script>
            <script src="js/angular-drag-and-drop-lists.js"></script> -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
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
                        <li> <a href="#alerta" data-toggle="collapse" aria-expanded="true"><i class="fa fa-bell" style="font-size: 20px"></i><span>Alerta</span>
                                <div class="arrow pull-right"><i class="fa fa-angle-down" style="font-size: 20px"></i></div></a>
                            <ul id="alerta" class="list-unstyled">
                                <li> <a href="cadastrar_alerta.jsp"><i class="fa fa-plus-square" style="font-size: 18px"></i><span>Cadastrar Alerta</span></a></li>
                                <li class="active"> <a href="EnviarAlerta#"> <i class="fa fa-send" style="font-size: 16px"></i><span>Enviar Alerta</span></a></li>
                                <li> <a href="VerAlertas"> <i class="fa fa-bell" style="font-size: 16px"></i><span>Ver Alertas</span></a></li>
                                <li> <a href="AlertasEnviados"> <i class="fa fa-check-square" style="font-size: 18px"></i><span>Alertas Enviados</span></a></li>
                            </ul>
                        </li>
                        <li> <a href="#contato" data-toggle="collapse" aria-expanded="false"><i class="fa fa-address-book" style="font-size: 20px"></i><span>Contato</span>
                                <div class="arrow pull-right"><i class="fa fa-angle-down" style="font-size: 20px"></i></div></a>
                            <ul id="contato" class="collapse list-unstyled">
                                <li> <a href="adicionar_contato.jsp"> <i class="fa fa-user-plus" style="font-size: 16px"></i><span>Adicionar Contato</span></a></li>
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
                        <li class="breadcrumb-item active">Enviar Alerta</li>
                    </ul>
                </div>
            </div>
            <section class="forms">
                <div class="container-fluid">
                    <header> 
                        <h1 class="h1 display">Enviar Alerta</h1>
                    </header>
                    <div class="row">                     
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <form action="EnviarAlerta">
                                        <div class="form-group row">            
                                            <div class="col-lg-12">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h2 class="h5 display"><strong class="text-primary">Qual alerta deve ser enviado?</strong></h2>
                                                        <div class="line"></div>
                                                        <div class="form-group">
                                                            <label>Categoria</label>                  
                                                            <select name="sel_categoria" class="form-control" onchange="this.form.submit()" required>
                                                                <option>${sel_categoria}</option>
                                                                <c:forEach var="categoria" items="${sessionScope.categorias}">
                                                                    <option value="${categoria}">${categoria}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>                    
                                        </div>
                                    </form>
                                    <form class="form-horizontal" method="post" action="EnviarAlerta">
                                        <div class="form-group row">            
                                            <div class="col-lg-12">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <div class="form-group">       
                                                            <label>Título</label>
                                                            <select name="sel_titulo" class="form-control" required>
                                                                <option></option>
                                                                <c:forEach var="titulo" items="${titulos}">
                                                                    <option value="${titulo}">${titulo}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                        <div class="line"></div></br>
                                                        <h2 class="h5 display"><strong class="text-primary">Quem deve receber este alerta?</strong></h2>
                                                        <div class="line"></div>
                                                        <table id="example" class="display" cellspacing="0" width="100%">
                                                            <thead>
                                                                <tr>
                                                                    <th>Nome</th>
                                                                    <th>E-mail</th>
                                                                    <th>Telefone</th>
                                                                    <th>Selecionar</th>
                                                                </tr>
                                                            </thead>
                                                            <tfoot>
                                                                <tr>
                                                                    <th>Nome</th>
                                                                    <th>E-mail</th>
                                                                    <th>Telefone</th>
                                                                    <th>Selecionar</th>
                                                                </tr>
                                                            </tfoot>
                                                            <tbody>
                                                                <c:forEach var="contato" items="${contatos}" varStatus="id">
                                                                    <tr>
                                                                        <td>${contato.nome}</td>
                                                                        <td>${contato.email}</td>
                                                                        <td>${contato.fone}</td>
                                                                        <td>
                                                                            <div class="i-checks">
                                                                                <input id="checkboxCustom${id.count}" name="enviarPara" type="checkbox" value="${contato.id}" class="form-control-custom">
                                                                                <label for="checkboxCustom${id.count}">Selecionar</label>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>                    
                                        </div>                                       
                                        <div class="line"></div>
                                        <div class="form-group row">
                                            <div class="col-sm-6"></div>
                                            <div class="col-sm-6">
                                                <button type="submit" style="float: right" class="btn btn-primary">Enviar</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            
            <!-- enviado Modal-->
            <div id="valido_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-center">
                <div role="document" class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 id="exampleModalLabel" class="modal-title"><strong class="text-success">Alerta Enviado!</strong></h3>
                            <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <p><strong class="text-success">O alerta foi enviado com sucesso!</strong></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" data-dismiss="modal" class="btn btn-secondary">OK!</button>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- não enviado Modal-->
            <div id="invalido_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-center">
                <div role="document" class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 id="exampleModalLabel" class="modal-title"><strong class="text-danger">Ops!</strong></h3>
                            <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <p><strong class="text-danger">O alerta não pôde ser enviado.</strong></p>
                            <p><strong class="text-danger">Motivo: Nenhum <b class="text-primary">contato</b> foi selecionado para receber o alerta.</strong></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" data-dismiss="modal" class="btn btn-secondary">OK!</button>
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
        <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#example').DataTable({
                    "language": {
                        "sEmptyTable": "Nenhum registro encontrado",
                        "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                        "sInfoEmpty": "Mostrando 0 até 0 de 0 registros",
                        "sInfoFiltered": "(Filtrados de _MAX_ registros)",
                        "sInfoPostFix": "",
                        "sInfoThousands": ".",
                        "sLengthMenu": "_MENU_ resultados por página",
                        "sLoadingRecords": "Carregando...",
                        "sProcessing": "Processando...",
                        "sZeroRecords": "Nenhum registro encontrado",
                        "sSearch": "Pesquisar",
                        "oPaginate": {
                            "sNext": "Próximo",
                            "sPrevious": "Anterior",
                            "sFirst": "Primeiro",
                            "sLast": "Último"
                        },
                        "oAria": {
                            "sSortAscending": ": Ordenar colunas de forma ascendente",
                            "sSortDescending": ": Ordenar colunas de forma descendente"
                        }
                    }
                });
            });
        </script>
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
