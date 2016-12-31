$(document).ready(function(){
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
});
