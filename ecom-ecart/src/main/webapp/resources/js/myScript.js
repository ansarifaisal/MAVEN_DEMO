$(document)
		.ready(

				function() {

					switch (hoverMenu) {

					case 'About Us':
						$('#about').addClass('active');
						break;
					case 'Contact Us':
						$('#contact').addClass('active');
						break;
					case 'Login':
						$('#login').addClass('active');
						break;
					case 'Register':
						$('#register').addClass('active');
						break;
					case 'All Products':
						$('#allProduct').addClass('active');

					case 'Wish List':
						$('#wishList').addClass('active');

					case 'Personal Information':
						$('#personalInformation').addClass('active');

					case 'Change Password':
						$('#changePassword').addClass('active');

					case 'Addresses':
						$('#addresses').addClass('active');

					case 'Update':
						$('#update').addClass('active');

					default:
						break;
					}

					/*
					 * Quantity form
					 */
					$('.quantity').on('focus', function() {
						// console.log($(this).attr('id'));
						var elm = "#btn_" + $(this).attr('id');
						$(elm).css('display', 'inline');
					});

					$('.defaultAddress')
							.on(
									'change',
									function() {
										var elm = $(this).attr('id');
										window.location.href = '/ecom-ecart/user/address/default/'
												+ elm;
									});

					$('.cAddress').on('change', function() {
						var chooseAddress = $(this).val();
						console.log(chooseAddress);
						$('.choose').val(chooseAddress);
					});

					/*
					 * Sort nav
					 */

					$('#sortPriceASC').on('click', function() {

						$('#sortPriceASC').addClass("active");
						$('#sortPriceDESC').removeClass("active");
						$('#sortId').removeClass("active");
						$('#sortName').removeClass("active");
					});

					$('#sortPriceDESC').on('click', function() {

						$('#sortPriceASC').removeClass("active");
						$('#sortPriceDESC').addClass("active");
						$('#sortId').removeClass("active");
						$('#sortName').removeClass("active");
					});

					$('#sortId').on('click', function() {

						$('#sortPrice').removeClass("active");
						$('#sortPriceDESC').removeClass("active");
						$('#sortId').addClass("active");
						$('#sortName').removeClass("active");
					});

					$('#sortName').on('click', function() {

						$('#sortPrice').removeClass("active");
						$('#sortPriceDESC').removeClass("active");
						$('#sortId').removeClass("active");
						$('#sortName').addClass("active");
					});

					/*
					 * Initializing tooltip
					 */
					$('[data-toggle="tooltip"]').tooltip();

					/*
					 * function to highlight the Error fields
					 */
					function highlight(element, errorClass, validClass) {
						$(element).parents(".validate").addClass("has-error")
								.removeClass("has-success");
						$(element).next("span").addClass(
								"glyphicon-exclamation-sign").removeClass(
								"glyphicon-ok");
					}

					/*
					 * function to unhighlight the Error fields
					 */

					function unhighlight(element, errorClass, validClass) {
						$(element).parents(".validate").addClass("has-success")
								.removeClass("has-error");
						$(element).next("span").addClass("glyphicon-ok")
								.removeClass("glyphicon-exclamation-sign");
					}

					function errorPlacement(error, element) {
						// Add the `help-block` class to the
						// error element
						error.addClass("help-block");

						// Add `has-feedback` class to the
						// parent div.form-group
						// in order to add icons to inputs
						element.parents(".validate").addClass("has-feedback");

						if (element.prop("type") === "select") {
							error.insertAfter(element.prop(".gender"));
						} else if (element.prop("type") === "checkbox") {
							error.insertAfter(element.parent("#terms"));
						} else {
							error.insertAfter(element);
						}

						// Add the span element, if doesn't
						// exists, and apply the icon
						// classes to it.
						if (!element.next("span")[0]) {
							$(
									"<span class='glyphicon glyphicon-exclamation-sign form-control-feedback'></span>")
									.insertAfter(element);
						}
					}

					function success(label, element) {
						// Add the span element, if doesn't
						// exists, and apply the icon
						// classes to it.
						if (!$(element).next("span")[0]) {
							$(
									"<span class='glyphicon glyphicon-ok form-control-feedback'></span>")
									.insertAfter($(element));
						}
					}

					/*
					 * Method Validate Login form
					 */
					$("#loginForm")
							.validate(
									{
										rules : {
											email : {
												required : true
											},
											password : {
												required : true
											}
										},
										messages : {
											email : {
												required : "Please, Provide E-Mail"
											},
											password : {
												required : "Please, Provide Password"
											}
										},
										errorElement : "em",
										errorPlacement : function(error,
												element) {
											errorPlacement(error, element);
										},
										success : function(label, element) {
											success(label, element);

										},
										highlight : function(element,
												errorClass, validClass) {
											highlight(element, errorClass,
													validClass);
										},
										unhighlight : function(element,
												errorClass, validClass) {
											unhighlight(element, errorClass,
													validClass);
										}
									});

					/*
					 * Method Validate Registration form
					 */

					$("#registerForm")
							.validate(
									{
										rules : {
											firstName : {
												required : true,
												minlength : 3
											},
											lastName : {
												required : true,
												minlength : 3
											},
											email : {
												required : true,
												email : true
											},
											password : {
												required : true,
												minlength : 5
											},
											confirmPassword : {
												required : true,
												minlength : 5,
												equalTo : '#password'
											},
											mobileNumber : {
												required : true,
												number : true,
												maxlength : 10
											},
											gender : {
												required : true
											},
											terms : {
												required : true
											}
										},
										messages : {
											firstName : 'Please, Provide First Name',
											lastName : 'Please, Provide Last Name',
											email : {
												required : 'Please, Provide Email Address',
												email : 'Please, Provide a Valid E-Mail Address'
											},
											password : {
												required : 'Please, Provide Password',
												minlength : 'Password Must Contain Atleast 5 Charachters'
											},
											confirmPassword : {
												required : 'Please, Enter Password Same as Above',
												minlength : 'Password Must Contain Atleast 5 Charachters',
												equalTo : "Password Doesn't Match"
											},
											gender : {
												required : 'Please, Select Gender'
											},
											mobileNumber : {
												required : 'Please, Provide Mobile Number',
												number : 'This Field Can Contain Only Numbers',
												maxlength : 'This Field Can Contain Only 10 Numbers'
												
											},
											terms : {
												required : 'Please, Accept the terms and conditions'
											}
										},
										errorElement : "em",
										errorPlacement : function(error,
												element) {
											errorPlacement(error, element);
										},
										success : function(label, element) {
											success(label, element);

										},
										highlight : function(element,
												errorClass, validClass) {
											highlight(element, errorClass,
													validClass);
										},
										unhighlight : function(element,
												errorClass, validClass) {
											unhighlight(element, errorClass,
													validClass);
										}

									});

					/*
					 * Method to validate add product form
					 */
					$("#product")
							.validate(
									{
										rules : {
											productName : {
												required : true,
												minlength : 2
											},
											price : {
												required : true,
												min : 100
											},
											quantity : {
												required : true,
												min : 1
											},
											categoryId : {
												required : true
											},
											description : {
												required : true,
												minlength : 20
											}
										},
										messages : {
											productName : {
												required : "Please Provide Product Name",
												minlength : "Product name must contains atlease 2 charachters"
											},
											price : {
												required : "Please Provide Product Price",
												min : "Minimum Amount Is 100"
											},
											quantity : {
												required : "Please Provide Product Quantity",
												min : "Minimum Quantity Is 1"
											},
											categoryId : {
												required : "Please Select One Option"
											},
											description : {
												required : "Please Provide Description",
												minlength : "Description Must Contain Atleast 20 Charachters"
											}
										},
										errorElement : "em",
										errorPlacement : function(error,
												element) {
											errorPlacement(error, element);
										},
										success : function(label, element) {
											success(label, element);

										},
										highlight : function(element,
												errorClass, validClass) {
											highlight(element, errorClass,
													validClass);
										},
										unhighlight : function(element,
												errorClass, validClass) {
											unhighlight(element, errorClass,
													validClass);
										}
									});

					/*
					 * Method to validate Search Product Form
					 */
					$("#searchProduct")
							.validate(
									{
										rules : {
											search : {
												required : true
											}
										},
										messages : {
											search : {
												required : "Please, Provide Keyword For Search"
											}
										},
										errorElement : "em",
										errorPlacement : function(error,
												element) {
											errorPlacement(error, element);
										},
										success : function(label, element) {
											success(label, element);

										},
										highlight : function(element,
												errorClass, validClass) {
											highlight(element, errorClass,
													validClass);
										},
										unhighlight : function(element,
												errorClass, validClass) {
											unhighlight(element, errorClass,
													validClass);
										}
									});

					/*
					 * Method to validate add category form
					 */
					$('#category')
							.validate(
									{
										rules : {
											name : {
												required : true,
												minlength : 5
											},
											description : {
												required : true,
												minlength : 10
											}
										},
										messages : {
											name : {
												required : "Please, Provide Category Name",
												minlength : "Name Must Contains Atleast 5 Charachters"
											},
											description : {
												required : "Please, Provide Category Description",
												minlength : "Description Must Contains Atleast 10 Charachters"
											}
										},
										errorElement : "em",
										errorPlacement : function(error,
												element) {
											errorPlacement(error, element);
										},
										success : function(label, element) {
											success(label, element);

										},
										highlight : function(element,
												errorClass, validClass) {
											highlight(element, errorClass,
													validClass);
										},
										unhighlight : function(element,
												errorClass, validClass) {
											unhighlight(element, errorClass,
													validClass);
										}
									});

					/*
					 * Method to validate Personal Information Form
					 */

					$('#information')
							.validate(
									{
										rules : {
											firstName : {
												required : true,
												minlength : 3
											},
											lastName : {
												required : true,
												minlength : 3
											},
											gender : {
												required : true
											}
										},
										messages : {
											firstName : {
												required : "Please, Provide First Name",
												minlength : "First Name Must Contains Atleast 3 Charachters"
											},
											lastName : {
												required : "Please, Provide Category Description",
												minlength : "Last Name Must Contains Atleast 3 Charachters"
											},
											gender : {
												required : "Please, Provide Gender"
											}
										},
										errorElement : "em",
										errorPlacement : function(error,
												element) {
											errorPlacement(error, element);
										},
										success : function(label, element) {
											success(label, element);

										},
										highlight : function(element,
												errorClass, validClass) {
											highlight(element, errorClass,
													validClass);
										},
										unhighlight : function(element,
												errorClass, validClass) {
											unhighlight(element, errorClass,
													validClass);
										}
									});

					/*
					 * Method To Validate ChangePassword Form
					 */
					$(".changePassword")
							.validate(
									{
										rules : {
											oldPassword : {
												required : true,
												minlength : 3
											},
											password : {
												required : true,
												minlength : 3
											},
											confirmPassword : {
												required : true,
												equalTo : '#password'
											}
										},
										messages : {
											oldPassword : {
												required : "Please, Provide Password",
												minlength : "Password Must Contains Atleast 3 Charachters"
											},
											password : {
												required : "Please, Provide New Password",
												minlength : "Password Must Contains Atleast 3 Charachters"
											},
											confirmPassword : {
												required : "Please, Provide Password",
												equalTo : "Password Doesn't Match"
											}
										},
										errorElement : "em",
										errorPlacement : function(error,
												element) {
											errorPlacement(error, element);
										},
										success : function(label, element) {
											success(label, element);

										},
										highlight : function(element,
												errorClass, validClass) {
											highlight(element, errorClass,
													validClass);
										},
										unhighlight : function(element,
												errorClass, validClass) {
											unhighlight(element, errorClass,
													validClass);
										}
									});

					$('.addAddress')
							.validate(
									{
										rules : {
											firstName : {
												required : true,
												minlength : 3
											},
											lastName : {
												required : true,
												minlength : 3
											},
											lineOne : {
												required : true,
												minlength : 5
											},
											lineTwo : {
												required : true,
												minlength : 5
											},
											city : {
												required : true,
												minlength : 2
											},
											state : {
												required : true,
												minlength : 3
											},
											country : {
												required : true,
												minlength : 3
											},
											mobileNumber : {
												required : true,
												number : true,
												maxlength : 10
											}
										},
										messages : {
											firstName : {
												required : "Please, Provide First Name",
												minlength : "First Name Must Contain Atleast 3 Charachters"
											},
											lastName : {
												required : "Please, Provide Last Name",
												minlength : "Last Name Must Contain Atleast 3 Charachters"
											},
											lineOne : {
												required : "Please, Provide Line 1 Details",
												minlength : "Line 1 Must Contain Atleast 5 Charachters"
											},
											lineTwo : {
												required : "Please, Provide Line 2 Details",
												minlength : "Line 2 Must Contain Atleast 5 Charachters"
											},
											city : {
												required : "Please, Provide Last Name",
												minlength : "City Must Contain Atleast 2 Charachters"
											},
											state : {
												required : "Please, Provide State",
												minlength : "State Must Contain Atleast 2 Charachters"
											},
											country : {
												required : "Please, Provide Country",
												minlength : "Country Must Contains Atleast 2 Charachters"
											},
											mobileNumber : {
												required : "Please, Provide Mobile Number",
												number : "This Field Can Contains Only Numbers",
												maxlength : "Mobile Number Must Contains Only 10 Numbers"
											}
										},
										errorElement : "em",
										errorPlacement : function(error,
												element) {
											errorPlacement(error, element);
										},
										success : function(label, element) {
											success(label, element);

										},
										highlight : function(element,
												errorClass, validClass) {
											highlight(element, errorClass,
													validClass);
										},
										unhighlight : function(element,
												errorClass, validClass) {
											unhighlight(element, errorClass,
													validClass);
										}
									});

					/*
					 * Method to Validate Search Form
					 */
					

					$('.searchForm')
							.validate(
									{
										rules : {
											keywords : {
												required : true,
												minlength : 2
											}
										},
										messages : {
											required : "Field Cannot Be Blanked",
											minlength : "Must Contain Alteast 2 Charachter"
										},
										errorElement : "em",
										errorPlacement : function(error,
												element) {
											errorPlacement(error, element);
										},
										success : function(label, element) {
											success(label, element);

										},
										highlight : function(element,
												errorClass, validClass) {
											highlight(element, errorClass,
													validClass);
										},
										unhighlight : function(element,
												errorClass, validClass) {
											unhighlight(element, errorClass,
													validClass);
										}
									});

					$(".alert-msg").fadeTo(2000, 500).slideUp('500',
							function() {
								$(".alert-msg").slideUp(500);
							});
					
					$('.auto-hide').mouseover(function(){
						$('.showNavBar').slideDown('500');
					});
					$('.showNavBar').mouseleave(function(){
						$('.showNavBar').slideUp('1000');
					});
					
				});