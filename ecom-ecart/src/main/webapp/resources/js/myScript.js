$(document).ready(function(){

	switch (hoverMenu) {
	case 'About Us':
			$('#about').addClass('active');
		break;
	case 'Contact Us':
		$('#contact').addClass('active');
	break;
	case 'Login':
		$("#login").addClass('active');
		break;
	case 'Register':
		$("#register").addClass('active');
		break;
	case 'All Products':
		$("#allProduct").addClass('active');
	default:
		break;
	}

});