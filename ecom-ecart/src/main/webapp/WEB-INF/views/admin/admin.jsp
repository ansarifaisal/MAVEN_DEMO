<div class="panel panel-default">
	<div class="panel-body">
	<%@include file="menu.jsp" %>
		<c:if test = "${ifUserClickedAddProduct == true}">
			<%@include file = "addproduct.jsp" %>
		</c:if>
		<c:if test = "${ifUserClickedAddCategory == true}">
			<%@include file = "addcategory.jsp" %>
		</c:if>
		
		<c:if test = "${ifUserClickedUpdateCategory == true}">
			<%@include file = "addcategory.jsp" %>
		</c:if>
		
		<c:if test = "${ifUserClickedUpdateProduct == true}">
			<%@include file = "addproduct.jsp" %>
		</c:if>
		
		<c:if test = "${ifUserClickedAddSeller == true}">
			<%@include file = "addseller.jsp" %>
		</c:if>
	</div>
</div>