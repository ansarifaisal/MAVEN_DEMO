<div class="panel panel-default">
	<div class="panel-body">
		<%@include file="menu.jsp"%>
		<c:if test="${ifUserClickedPersonalInformation == true}">
			<%@include file="personalInformation.jsp"%>
		</c:if>
		
		<c:if test="${ifUserClickedChangePassword == true}">
			<%@include file="changePassword.jsp"%>
		</c:if>
		
		<c:if test="${ifUserClickedUpdateEmailMobile == true}">
			<%@include file="updateEmailMobile.jsp"%>
		</c:if>
		
		<c:if test="${ifUserClickedAddresses == true}">
			<%@include file="addresses.jsp"%>
		</c:if>
		
		<c:if test="${ifUserClickedEditAddress == true}">
			<%@include file="addresses.jsp"%>
		</c:if>
		
	</div>
</div>