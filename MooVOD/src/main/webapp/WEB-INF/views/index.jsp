<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/header.jsp"></jsp:include>


        
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
<jsp:include page="layout/footer.jsp"></jsp:include>

   