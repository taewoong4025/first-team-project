<%@page import="shop.cart.CartDBBean"%>
<%@page import="shop.member.MemberBean"%>
<%@page import="shop.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

 <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title> Gear Shop </title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../css/styles.css" rel="stylesheet" />
    </head>
   
     <body>
            
        <%
        String sessionID = (String)session.getAttribute("sessionID");
        
    	MemberDBBean manager = MemberDBBean.getInstance();
    	MemberBean member = manager.getMember(sessionID);
    	
    	CartDBBean cartDB = new CartDBBean().getInstance();
    	int total = cartDB.myCartTotal(sessionID);
        %>
        
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="../index.jsp">Gear Shop</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <!--
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">??????</a></li>
                     -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">?????????</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">?????????</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="../board/list.jsp">????????????</a></li>
                                <li><a class="dropdown-item" href="../board/reviewList.jsp">???????????????</a></li>

                            </ul>
                        </li>
                    </ul>
                    
                            
                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="button" onclick="location.href='../product/cart.jsp' ">
                            <i class="bi-cart-fill me-1"></i>
                            	????????????
                            <span class="badge bg-dark text-white ms-1 rounded-pill"><%=total %></span>
                
                        </button>
                        
                        &nbsp;&nbsp;
                        <script type="text/javascript">
                        
                        	function logout(){
                        		location.href="../member/logout.jsp";
                        	}
                        </script>                   
                        
                      	<%
                    	
                    	if(sessionID==null){ // ???????????? ???????????? ???
	                    
	                    %>	  
                        <!-- login -->
                        <button class="btn btn-outline-dark" type="button" onclick="location.href='../member/login.html'">
                        <i class="bi bi-file-person-fill"></i>	
                            login&nbsp;
                        </button>
	                    
	                    <%
	                      }
	                      else if(member.getUser_level()!=9 && sessionID != null){ //??????????????? ??? ???????????? ?????? ??????
	                    %>
	                         <div class="btn btn-outline-dark">
	                        <li class="nav-item dropdown" style="list-style: none;">
                              <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                              <i class="bi-menu-up me-1"></i>Menu</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li style="text-align:center"><b>???????????????.<br><%=sessionID %>???</b></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">
                                <li><a class="dropdown-item" href="../member/UserInfo.jsp">
								<button class="btn btn-outline-dark" type="button">
		                        <i class="bi bi-file-person-fill"></i>	
        	                 	   ????????????&nbsp;</button></a>
							</li>
							  <li><a class="dropdown-item" href="../member/buyInfo.jsp">
								<button class="btn btn-outline-dark" type="button">
		                        <i class="bi bi-bag-check-fill"></i>	
        	                 	   ????????????&nbsp;</button></a>
							</li>
                                &nbsp;&nbsp;&nbsp;<button class="btn btn-outline-dark" type="button" onclick="logout()">
                        			<i class="bi bi-file-person-fill"></i>	  
            		              ????????????&nbsp;
	                	        </button>
    	                	    </a>
        	               	  </li>
                            </ul>
                            </li>
	               	 	</div>
	                    
	               	   <%
	                      }else{ // ???????????? ??????
	                    %>
	                        <div class="btn btn-outline-dark">
	                        <li class="nav-item dropdown" style="list-style: none;">
                              <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                              <i class="bi-menu-up me-1"></i>Menu</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li style="text-align:center"><b><%=sessionID %></b></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">
                                <button class="btn btn-outline-dark" type="button" onclick="location.href='../product/productView.jsp'">
                        			<i class="bi bi-bag-plus"></i>
                        			????????????&nbsp;
	                	        </button>
    	                	    </a>
        	               	  </li>
                                <li><a class="dropdown-item" href="../member/management.jsp">
								<button class="btn btn-outline-dark" type="button">
		                        <i class="bi bi-file-person-fill"></i>	
        	                 		  ????????????&nbsp;</button></a>
							</li>
							   <li><a class="dropdown-item" href="#">
								<button class="btn btn-outline-dark" type="button" onclick="logout()">
		                        <i class="bi bi-file-person-fill"></i>	
        	               			 ????????????&nbsp;</button></a>
							</li>
                            </ul>
                            </li>
	               	 	</div>
	                    <%	
	                      }
                      	%>
                    </form>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Gear Shop</h1>
                    <p class="lead fw-normal text-white-50 mb-0">All Items in the World</p>
                </div>
            </div>
        </header>

</body>
</html>