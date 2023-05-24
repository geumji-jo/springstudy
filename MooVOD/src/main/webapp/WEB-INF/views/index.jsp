<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${contextPath}/resources/home/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${contextPath}/resources/home/css/styles.css" rel="stylesheet" />
        <link href="${contextPath}/resources/menubar/menubar.css" rel="stylesheet" />
        <link href="${contextPath}/resources/bootstrap-4.6.2/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Darumadrop+One&display=swap" rel="stylesheet">
<meta charset="UTF-8">

<title>MOOVOD</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<script src="${contextPath}/resources/home/js/scripts.js"></script>
<script src="${contextPath}/resources/bootstrap-4.6.2/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${contextPath}/resources/menubar/menubar.min.js"></script>
<style>
nav {
text-align: center;
}


@import url('https://fonts.googleapis.com/css2?family=Alfa+Slab+One&display=swap');
* {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}

.title2 {
  background-color:  #fff;
  display: flex;
  justify-content: center;
  align-items: top;
  min-height: 5vh;
  padding-bottom: 50px;

}
.waviy {
  position: relative;
  -webkit-box-reflect: below -20px linear-gradient(transparent, rgba(0,0,0,.2));
  line-height:-10px;

}
.waviy span {
  font-family: 'Darumadrop One', cursive;
  font-size: 120px;
  position: relative;
  display: inline-block;
  color: #151719;
  text-transform: uppercase;
  animation: waviy 1s infinite;
  animation-delay: calc(.1s * var(--i));
  
  
}
@keyframes waviy {
  0%,40%,100% {
    transform: translateY(0)
  }
  20% {
    transform: translateY(-20px)
  }
}

nav {

padding-left: 30px;
}

.mr-30 {
  margin-right: 30rem !important;
}

.mr-80 {
  margin-right: 80rem !important;
}

.ml-7 {
  margin-left: 7rem  !important;
  
}

.ml-3 {
  margin-left: 3rem  !important;
  
}

.wd-500 {
width: 500px;

}
.df {

display: flex;


}
</style>
</head>
<body>
  <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-white">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="${contextPath}/">MOOVOD</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">회원가입</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">고객센터</a></li>
                    </ul>
                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            장바구니
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                    </form>
                </div>
            </div>
        </nav>
        
        
        <!-- Header-->
        <header class="py-4">
            <div class="container px-4 px-lg-6 ">
                <div class="text-center text-black">
       <div class="title2">
         <div class="waviy  display-4 w-bolder">
           <span style="--i:1">M</span>
           <span style="--i:2">O</span>
           <span style="--i:3">O</span>
           <span style="--i:4">V</span>
           <span style="--i:5">O</span>
           <span style="--i:6">D</span>
          </div>
      </div>
                </div>
            </div>
        </header>
    <hr>
    <!-- navbar-->
<div class="sticky-top bg-white">
<nav class="menu">
  <div class="nav nav-tabs justify-content-center " id="nav-tab" role="tablist">
    <button class="nav-link text-black" id="nav-STORE-tab" data-toggle="tab" data-target="#nav-STORE" type="button" role="tab" aria-controls="nav-STORE" aria-selected="false">STORE</button>
    <button class="nav-link text-black" id="nav-REVIEW-tab" data-toggle="tab" data-target="#nav-REVIEW" type="button" role="tab" aria-controls="nav-REVIEW" aria-selected="false">REVIEW</button>
    <button class="nav-link text-black" id="nav-VOD-tab" data-toggle="tab" data-target="#nav-VOD" type="button" role="tab" aria-controls="nav-VOD" aria-selected="false">VOD</button>
    <button class="nav-link text-black" id="nav-COMMUNITY-tab" data-toggle="tab" data-target="#nav-COMMUNITY" type="button" role="tab" aria-controls="nav-COMMUNITY" aria-selected="false">COMMUNITY</button>
    <button class="nav-link text-black" id="nav-RANKING-tab" data-toggle="tab" data-target="#nav-RANKING" type="button" role="tab" aria-controls="nav-RANKING" aria-selected="false">RANKING</button>
  </div>
</nav>
<div class="tab-content text-center" id="nav-tabContent">
  <div class="tab-pane fade" id="nav-STORE" role="tabpanel" aria-labelledby="nav-STORE-tab"><a href="#">STORE</a></div>
  <div class="tab-pane fade" id="nav-REVIEW" role="tabpanel" aria-labelledby="nav-REVIEW-tab"><a href="${contextPath}/board/reviews/list.do">REVIEW</a></div>
  <div class="tab-pane fade" id="nav-VOD" role="tabpanel" aria-labelledby="nav-VOD-tab"><a href="#">VOD</a></div>
  <div class="tab-pane fade" id="nav-COMMUNITY" role="tabpanel" aria-labelledby="nav-COMMUNITY-tab"><a href="#">COMMUNITY</a></div>
  <div class="tab-pane fade" id="nav-RANKING" role="tabpanel" aria-labelledby="nav-RANKING-tab"><a href="#">RANKING</a></div>
</div>
</div>



        
    <!-- Section-->
    <h1 class="pt-5 text-left ml-7">HOT & NEW</h1>
        <section class="py-5">
       
            <div class="container mr-30 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Popular Item</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    $40.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Sale Item</h5>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$50.00</span>
                                    $25.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Fancy Product</h5>
                                    <!-- Product price-->
                                    $120.00 - $280.00
                                </div>
                            </div>
                            <!-- Product actions-->
                           
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Special Item</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$20.00</span>
                                    $18.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            
       

            
            
            
    <div style="display: flex;" class="ml-7 ">
            <div id="carouselExampleIndicators" class="carousel slide wd-500 " data-ride="carousel" >
              <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
              </ol>
              <div class="carousel-inner ">
                <div class="carousel-item rounded-pill active">
                 <img src="${contextPath}/resources/images/back1.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item rounded-pill">
                  <img src="${contextPath}/resources/images/back2.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item rounded-pill">
                  <img src="${contextPath}/resources/images/back3.jpg" class="d-block w-100" alt="...">
                </div>
              </div>
              <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
            </div>
       
            
            <div class="card ml-3" style="width: 31rem; ">
              <div class="card-header">
                리뷰게시판
              </div>
              <ul class="list-group list-group-flush">
                <li class="list-group-item">리뷰1</li>
                <li class="list-group-item">리뷰2</li>
                <li class="list-group-item">리뷰3</li>
              </ul>
            </div>
       
       </div>
              <div class="test_obj">
                <div  style="width: 21rem; height:400px; padding:auto;">
                  <div class="card-body2">
                    <h1 class="side-menu" style="text-align: center;">TOP5</h1>
                    <div style="text-align: right; margin-bottom: 3px; margin-right: 20px;">
                      <a class="nav-link text-black" href="#">더보기</a>
                    </div>
                    <div class="side-menu" >
                      <ol class="large-numbers">
                        <li>
                          <div class="card " style="max-width: 300px;">
                            <div class="row no-gutters">
                              <div class="col-md-4">
                                <img class="images" src="${contextPath}/resources/images/mang1.jpg" alt="...">
                              </div>
                              <div class="col-md-8">
                                <div class="">
                                  <h8 class="card-title">가디언즈오브갤럭시</h8>
                                  <p class="card-text"><small class="text-muted">15000원 구매</small></p>
                                  <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                                </div>
                              </div>
                            </div>
                          </div> 
                        </li>
                        <li>
                         <div class="card " style="max-width: 300px;">
                            <div class="row no-gutters">
                              <div class="col-md-4">
                                <img class="images" src="${contextPath}/resources/images/mang1.jpg" alt="...">
                              </div>
                              <div class="col-md-8">
                                <div class="">
                                  <h8 class="card-title">킬링로맨스</h8>
                                  <p class="card-text"><small class="text-muted">10000원 구매</small></p>
                                  <p class="card-text"><small class="text-muted">킬링킬링</small></p>
                                </div>
                              </div>
                            </div>
                          </div> 
                        </li>
                        <li>
                         <div class="card " style="max-width: 300px;">
                            <div class="row no-gutters">
                              <div class="col-md-4">
                                <img class="images" src="${contextPath}/resources/images/mang1.jpg" alt="...">
                              </div>
                              <div class="col-md-8">
                                <div class="">
                                  <h8 class="card-title">범죄도시2</h8>
                                  <p class="card-text"><small class="text-muted">9000원 구매</small></p>
                                  <p class="card-text"><small class="text-muted">세일진행중</small></p>
                                </div>
                              </div>
                            </div>
                          </div> 
                        </li>
                        <li>
                         <div class="card " style="max-width: 300px;">
                            <div class="row no-gutters">
                              <div class="col-md-4">
                                <img class="images" src="${contextPath}/resources/images/mang1.jpg" alt="...">
                              </div>
                              <div class="col-md-8">
                                <div class="">
                                  <h8 class="card-title">분노의질주</h8>
                                  <p class="card-text"><small class="text-muted">15000원 구매</small></p>
                                  <p class="card-text"><small class="text-muted">분노의줄거리</small></p>
                                </div>
                              </div>
                            </div>
                          </div> 
                        </li>
                        <li>
                         <div class="card " style="max-width: 300px;">
                            <div class="row no-gutters">
                              <div class="col-md-4">
                                <img class="images" src="${contextPath}/resources/images/mang1.jpg" alt="...">
                              </div>
                              <div class="col-md-8">
                                <div class="">
                                  <h8 class="card-title">에브리씽 에브리웨어 올 앳 원스</h8>
                                  <p class="card-text"><small class="text-muted">7150원 구매</small></p>
                                  <p class="card-text"><small class="text-muted">내 취향아님...</small></p>
                                </div>
                              </div>
                            </div>
                          </div> 
                        </li>
                        
                      
                      </ol>
                    </div>
                  </div>
                </div>
              </div>
              
              
          



    <h1 class="pt-5 text-center mr-80">STORE</h1>
                <div class="container px-4 px-lg-5 mt-5 mr-30">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Popular Item</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    $40.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Sale Item</h5>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$50.00</span>
                                    $25.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Fancy Product</h5>
                                    <!-- Product price-->
                                    $120.00 - $280.00
                                </div>
                            </div>
                            <!-- Product actions-->
                           
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Special Item</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$20.00</span>
                                    $18.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            
            
            
            <div class="card ml-7" style="width: 40rem; margin-bottom: 10rem;">
              <div class="card-header">
                고객센터
              </div>
              <ul class="list-group list-group-flush">
                <li class="list-group-item">공지사항</li>
                <li class="list-group-item">QnA</li>
                <li class="list-group-item">FaQ</li>
              </ul>
            </div>
            
           
 </section>
   
   
        <!-- Footer-->
        <footer class="py-5 bg-dark" id="footer">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        

</body>
</html>