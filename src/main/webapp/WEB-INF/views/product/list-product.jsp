<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<main class="inner-page-sec-padding-bottom">
	<div class="container">
		<div class="row">
			<div class="col-lg-9 order-lg-2">
				<div class="shop-toolbar with-sidebar mb--30">
					<div class="row align-items-center">
						<div class="col-lg-2 col-md-2 col-sm-6">
							<!-- Product View Mode -->
							<div class="product-view-mode">
								<a href="#" class="sorting-btn active" data-target="grid"><i
									class="fas fa-th"></i></a> <a href="#" class="sorting-btn"
									data-target="grid-four"> <span class="grid-four-icon">
										<i class="fas fa-grip-vertical"></i><i
										class="fas fa-grip-vertical"></i>
								</span>
								</a> <a href="#" class="sorting-btn" data-target="list "><i
									class="fas fa-list"></i></a>
							</div>
						</div>
						<div class="col-xl-4 col-md-4 col-sm-6  mt--10 mt-sm--0">
							<span class="toolbar-status"> Hiển thị 1 đến 9 trong 14 </span>
						</div>
						<div class="col-lg-2 col-md-2 col-sm-6  mt--10 mt-md--0">
							<div class="sorting-selection">
								<span>Hiển thị:</span> <select
									class="form-control nice-select sort-select">
									<option value="" selected="selected">3</option>
									<option value="">9</option>
									<option value="">5</option>
									<option value="">10</option>
									<option value="">12</option>
								</select>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-6 mt--10 mt-md--0 ">
							<div class="sorting-selection">
								<span>Sắp xếp:</span> <select
									class="form-control nice-select sort-select mr-0">
									<option value="" selected="selected">Default Sorting</option>
									<option value="">Sort By:Name (A - Z)</option>
									<option value="">Sort By:Name (Z - A)</option>
									<option value="">Sort By:Price (Low &gt; High)</option>
									<option value="">Sort By:Price (High &gt; Low)</option>
									<option value="">Sort By:Rating (Highest)</option>
									<option value="">Sort By:Rating (Lowest)</option>
									<option value="">Sort By:Model (A - Z)</option>
									<option value="">Sort By:Model (Z - A)</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="shop-toolbar d-none">
					<div class="row align-items-center">
						<div class="col-lg-2 col-md-2 col-sm-6">
							<!-- Product View Mode -->
							<div class="product-view-mode">
								<a href="#" class="sorting-btn active" data-target="grid"><i
									class="fas fa-th"></i></a> <a href="#" class="sorting-btn"
									data-target="grid-four"> <span class="grid-four-icon">
										<i class="fas fa-grip-vertical"></i><i
										class="fas fa-grip-vertical"></i>
								</span>
								</a> <a href="#" class="sorting-btn" data-target="list "><i
									class="fas fa-list"></i></a>
							</div>
						</div>
						<div class="col-xl-5 col-md-4 col-sm-6  mt--10 mt-sm--0">
							<span class="toolbar-status"> Hiển thị 1 đến 9 trong 14 </span>
						</div>
						<div class="col-lg-2 col-md-2 col-sm-6  mt--10 mt-md--0">
							<div class="sorting-selection">
								<span>Hiển thị:</span> <select
									class="form-control nice-select sort-select">
									<option value="" selected="selected">3</option>
									<option value="">9</option>
									<option value="">5</option>
									<option value="">10</option>
									<option value="">12</option>
								</select>
							</div>
						</div>
						<div class="col-xl-3 col-lg-4 col-md-4 col-sm-6 mt--10 mt-md--0 ">
							<div class="sorting-selection">
								<span>Sắp xếp:</span> <select
									class="form-control nice-select sort-select mr-0">
									<option value="" selected="selected">Default Sorting</option>
									<option value="">Sort By:Name (A - Z)</option>
									<option value="">Sort By:Name (Z - A)</option>
									<option value="">Sort By:Price (Low &gt; High)</option>
									<option value="">Sort By:Price (High &gt; Low)</option>
									<option value="">Sort By:Rating (Highest)</option>
									<option value="">Sort By:Rating (Lowest)</option>
									<option value="">Sort By:Model (A - Z)</option>
									<option value="">Sort By:Model (Z - A)</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				
				<div class="shop-product-wrap grid with-pagination row space-db--30 shop-border">

					<c:forEach items="${productList}" var="product">
						<div class="col-lg-4 col-sm-6">
							<div class="product-card">
								<div class="product-grid-content">
									<div class="product-header">
										<a href="<c:url value="/product/detail?id=" />${product.id}" class="author"> ${product.author} </a>
										<h3>
											<a href="<c:url value="/product/detail?id=" />${product.id}"> ${product.name} </a>
										</h3>
									</div>
									<div class="product-card--body">
										<div class="card-image">
											<img src="<c:url value="/assets/"/>${product.avatar}" alt="">
											<div class="hover-contents">
												<a href="<c:url value="/product/detail?id=" />${product.id}" class="hover-image"> <img
														src="<c:url value="/assets/"/>${product.avatar}" alt="">
												</a>
												<div class="hover-btns">
													<a data-id="${product.id}" class="single-btn"> <i
															class="fas fa-shopping-basket"></i>
													</a>
													<a href="#" class="single-btn"> <i
														class="fas fa-heart"></i>
													</a>
												</div>
											</div>
										</div>
										<div class="price-block">
											<span class="price">
												<fmt:formatNumber type="number" maxFractionDigits="3" value="${product.price}" />
												VNĐ
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
				
				<!-- Pagination Block -->
				<div class="row pt--30">
					<div class="col-md-12">
						<div class="pagination-block">
							<ul class="pagination-btns flex-center">
								<li>
									<a href="<c:url value="/product?${view}" />" class="single-btn prev-btn ">
										|<i class="zmdi zmdi-chevron-left"></i>
									</a>
								</li>

								<%
									if(Integer.parseInt(request.getAttribute("currentPage").toString()) == 1) { %>
										<li>
											<a class="single-btn prev-btn ">
												<i class="zmdi zmdi-chevron-left"></i>
											</a>
										</li>
								<%	} else { %>
										<li>
											<a href="<c:url value="/product?${view}page=" />${currentPage - 1 }" class="single-btn prev-btn ">
												<i class="zmdi zmdi-chevron-left"></i>
											</a>
										</li>
								<%  } %>

								<%
									for(int i = 1; i <= Integer.parseInt(request.getAttribute("totalPage").toString()); i++) {
										if(i == Integer.parseInt(request.getAttribute("currentPage").toString())) { %>
											<li class="active"><a href="<c:url value="/product?${view}page=" /><%= i %>" class="single-btn"><%= i %></a></li>
								<%
										} else { %>
											<li><a href="<c:url value="/product?${view}page=" /><%= i %>" class="single-btn"><%= i %></a></li>
								<%
										}
									}
								%>


								<%
									if(Integer.parseInt(request.getAttribute("currentPage").toString()) == Integer.parseInt(request.getAttribute("totalPage").toString())) { %>
										<li>
											<a class="single-btn next-btn ">
												<i class="zmdi zmdi-chevron-right"></i>
											</a>
										</li>
								<%	} else { %>
										<li>
											<a href="<c:url value="/product?${view}page=" />${currentPage + 1 }" class="single-btn next-btn ">
												<i class="zmdi zmdi-chevron-right"></i>
											</a>
										</li>
								<%  } %>

								<li>
									<a href="<c:url value="/product?${view}page=" />${totalPage}" class="single-btn next-btn ">
										<i class="zmdi zmdi-chevron-right"></i>|
									</a>
								</li>

							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3  mt--40 mt-lg--0">
				<div class="inner-page-sidebar">
					<!-- Accordion -->
					<div class="single-block">
						<h3 class="sidebar-title">Loại Sách</h3>
						<ul class="sidebar-menu--shop">
							<c:forEach items="${categoryList}" var="category">
								<li><a href="<c:url value="?filter=${category.id}" />">${category.name}</a></li>
							</c:forEach>
						</ul>
					</div>
			
					<!-- Size -->
					<div class="single-block">
						<h3 class="sidebar-title">Nhà Xuất Bản</h3>
						<ul class="sidebar-menu--shop menu-type-2">
							<c:forEach items="${publishingCompanyList}" var="publishingCompany">
								<li><a href="<c:url value="?filter=${publishingCompany.id}" />">${publishingCompany.name}</a></li>
							</c:forEach>
						</ul>
					</div>								
				</div>
			</div>
		</div>
	</div>
</main>