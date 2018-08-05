<%-- 
    Document   : visualizar_contatos
   
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
        <title>[Contatos] Smart Alerta!</title>
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
                                <li> <a href="adicionar_contato.jsp"> <i class="fa fa-user-plus" style="font-size: 16px"></i><span>Adicionar Contato</span></a></li>
                                <li class="active"> <a href="VerContatos#"> <i class="fa fa-users" style="font-size: 16px"></i><span>Ver Contatos</span></a></li>
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
                        <li class="breadcrumb-item active">Contatos</li>
                    </ul>
                </div>
            </div>
            <section class="forms">
                <div class="container-fluid">
                    <header> 
                        <h1 class="h1 display">Contatos</h1>
                    </header>
                    <div class="row">            
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">                  
                                    <table id="example" class="display" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th>Nome</th>
                                                <th>E-mail</th>
                                                <th>Telefone</th>
                                                <th>Editar</th>
                                                <th>Excluir</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Nome</th>
                                                <th>E-mail</th>
                                                <th>Telefone</th>
                                                <th>Editar</th>
                                                <th>Excluir</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <c:forEach var="contato" items="${sessionScope.contatos}">
                                                <tr>
                                                    <td>${contato.nome}</td>
                                                    <td>${contato.email}</td>
                                                    <td>${contato.fone}</td>
                                                    <td><button type="button" onclick="window.location.href='VerContatos?cid=${contato.id}&edt=true'" class="btn btn-outline-info">Editar</button></td>
                                                    <td><button type="button" onclick="window.location.href='VerContatos?cid=${contato.id}'" class="btn btn-outline-danger">Excluir</button></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <!-- editar Modal-->
                        <div id="editar_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
                            <div role="document" class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h3 id="exampleModalLabel" class="modal-title text-primary"><strong class="text-primary">Editar Contato</strong></h3>
                                        <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <div class="modal-body" >
                                        <form method="post" action="VerContatos">
                                            <div class="form-group">
                                                <label>Nome</label>
                                                <input name="contatoNome" type="text" value="${editar_contato.nome}" class="form-control">
                                            </div>
                                            <div class="line"></div>
                                            <div class="form-group">       
                                                <label>E-mail</label>
                                                <input name="contatoEmail" type="text" value="${editar_contato.email}" class="form-control">
                                            </div>     
                                            <div class="line"></div>
                                            <div class="form-group">       
                                                <label>Telefone</label>
                                                <input id="fone" name="contatoFone" type="text" value="${editar_contato.fone}" class="form-control">
                                            </div>
                                            <input name="contatoId" type="hidden" value="${editar_contato.id}" class="form-control">
                                            <div class="line"></div>
                                            <div class="form-group">
                                                <button type="button" style="float:left" data-dismiss="modal" class="btn btn-secondary">Cancelar</button>  
                                                <button type="submit" style="float:right" class="btn btn-primary">Salvar</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>  

                        <!-- atualizado Modal-->
                        <div id="atualizado_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-center">
                            <div role="document" class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h3 id="exampleModalLabel" class="modal-title"><strong class="text-success">Contato atualizado!</strong></h3>
                                        <button type="button" data-dismiss="modal" aria-label="Close" onclick="window.location.href='VerContatos'" class="close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <div class="modal-body">
                                        <strong class="text-success">As alterações foram salvas.</strong>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" data-dismiss="modal" onclick="window.location.href='VerContatos'" class="btn btn-primary">OK!</button>
                                    </div>
                                </div>
                            </div>
                        </div> 

                        <!-- excluir Modal-->
                        <div id="excluir_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
                            <div role="document" class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h3 id="exampleModalLabel" class="modal-title"><strong class="text-danger">Excluir Contato</strong></h3>
                                        <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <div class="modal-body">
                                        <strong class="text-danger">Você está prestes a excluir <b class="text-primary">${sessionScope.excluir_contato.nome}</b> da sua lista de contatos.</strong></br>
                                        <strong class="text-danger">Esta ação não poderá ser revertida, deseja prosseguir?</strong>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" style="float:left" data-dismiss="modal" class="btn btn-secondary">Não</button>
                                        <button type="button" onclick="window.location.href='VerContatos?del=true'" style="float:right" class="btn btn-primary">Sim</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- excluído Modal-->
                        <div id="excluido_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-center">
                            <div role="document" class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h3 id="exampleModalLabel" class="modal-title"><strong class="text-primary">Contato Excluído</strong></h3>
                                        <button type="button" data-dismiss="modal" aria-label="Close" onclick="window.location.href='VerContatos'" class="close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    <div class="modal-body">
                                        <strong class="text-primary">O contato foi exclúido com sucesso.</strong>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" data-dismiss="modal" onclick="window.location.href='VerContatos'" class="btn btn-secondary">Fechar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <footer class="main-footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6">
                            <p>Smart Alerta! &copy; 2017</p>
                        </div>
                        <div class="col-sm-6 text-right">
                            <p>Design by <a href="#" class="external">DevOps Group</a></p>
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
        <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote-bs4.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote-bs4.js"></script>
        <script>
                            $('#summernote').summernote({
                                height: 300, // set editor height
                                minHeight: null, // set minimum height of editor
                                maxHeight: null, // set maximum height of editor
                                focus: true                  // set focus to editable area after initializing summernote
                            });
                            $("#form_alerta").submit(function (event) {
                                $('input[name="mensagem"]').val($('#summernote').summernote('code'));
                            });
                            $('input[name="mensagem"]').val($('#summernote').summernote('code'));
        </script>
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
            <c:when test="${editar}">
                <script>
                    $(document).ready(function () {
                        $("#editar_modal").modal();
                    });
                </script>
            </c:when>
            <c:when test="${excluir}">
                <script>
                    $(document).ready(function () {
                        $("#excluir_modal").modal();
                    });
                </script>
            </c:when>
            <c:when test="${atualizado}">
                <script>
                    $(document).ready(function () {
                        $("#atualizado_modal").modal();
                    });
                </script>
            </c:when>
            <c:when test="${excluido}">
                <script>
                    $(document).ready(function () {
                        $("#excluido_modal").modal();
                    });
                </script>
            </c:when>
        </c:choose>
        <script>
            document.getElementById('fone').addEventListener('input', function (e) {
                var x = e.target.value.replace(/\D/g, '').match(/(\d{0,2})(\d{0,5})(\d{0,4})/);
                e.target.value = !x[2] ? x[1] : '(' + x[1] + ') ' + x[2] + (x[3] ? '-' + x[3] : '');
            });
        </script>
        <!-- Google Analytics: change UA-XXXXX-X to be your site's ID.-->
    </body>
</html>
