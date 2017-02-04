<c:if test="${!empty msg}">
	<div class="alert-msg">
		<div id="success-alert" class="alert alert-success" role="alert">
			<strong>${msg}</strong>
		</div>
	</div>
</c:if>
<div class="row">
	<div id="carousel" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carousel" data-slide-to="0" class="active"></li>
			<li data-target="#carousel" data-slide-to="1"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="${images}/1.jpg" alt="image-1" style="width: 100%">
			</div>
			<div class="item">
				<img src="${images}/2.jpg" alt="image-2" style="width: 100%">
			</div>
		</div>
	</div>
</div>


<c:set var="count" value="0" scope="page" />

<c:set var="productCount" value="4" scope="page" />

<c:choose>
	<c:when test="${not empty categories}">
		<c:forEach items="${categories}" var="category">
			<div class="row">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="col-md-2">
							<br>
							<h3>${category.name }</h3>
							<br>
							<div class="btn-group">
								<button class="btn btn-primary">View All</button>
							</div>
						</div>
						<div class="col-md-10">
							<c:choose>
								<c:when test="${not empty products}">
									<div class="carousel slide media-carousel"
										id="media-${category.id}">
										<div class="carousel-inner">
											<c:forEach items="${products }" var="product">
												<c:if test="${count < 4 }">
													<div class="item active">
														<div class="col-md-3 col-sm-3 col-xs-12 thumbnail-setting">
															<div class="thumbnail">
																<a href=""><img alt="${product.productName}"
																	src="${images}/product/${product.id}.png"
																	class="img-resize zoom" /></a>
																<div class="caption">
																	<p class="title">
																		<a href="${contextPath}/product/${product.id}">${product.productName }</a>
																	</p>
																	<h6 class="text-muted price">Now at
																		&#8377;${product.price}</h6>
																</div>
																<div class="text-right">
																	<a href=""><span class="glyphicon glyphicon-heart"></span></a>
																</div>
															</div>
														</div>
													</div>
												</c:if>
												<c:set var="count" value="${count + 1}" scope="page" />
											</c:forEach>
										</div>
										<!-- Carousel inner -->

										<%-- 							<a data-slide="prev" href="#media-${category.id}"
											class="left carousel-control" role="button"><span
											class="fa fa-chevron-circle-left" aria-hidden="true"></span></a>
										<a data-slide="next" href="#media-${category.id}"
											class="right carousel-control" role="button"><span
											class="fa fa-chevron-circle-right" aria-hidden="true"></span></a>
			 --%>
									</div>
								</c:when>
								<c:otherwise>
									<h3>Sorry! No Product Available In This Category..</h3>
								</c:otherwise>
							</c:choose>
							<!-- Carousel -->
						</div>
						<!-- /col-md -->
					</div>
					<!-- panel-body -->
				</div>
				<!-- panel -->
			</div>
			<!-- /row -->
		</c:forEach>
	</c:when>
	<c:otherwise>
		<div class="row panel">
			<div class="panel-default">
				<div class="panel-body">
					<div class="text-mutted">
						<h3>Sorry! No Categories Are Available..</h3>
					</div>
				</div>
			</div>
		</div>
	</c:otherwise>
</c:choose>
