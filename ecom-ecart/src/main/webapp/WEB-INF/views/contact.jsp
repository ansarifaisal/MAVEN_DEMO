<script
	<%-- generate your own key from developer.google.com --%>
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBgRO2EnR4frPIZlS24UkKp9pM2b18rkQc"></script>
<script>
	// code for google map api
	function initialize() {
		var mapCanvas = document.getElementById('map');
		var myLatLng = new google.maps.LatLng(19.085034, 72.908456);
		var mapOptions = {
			center : myLatLng,
			zoom : 17,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		}
		var map = new google.maps.Map(mapCanvas, mapOptions)

		var marker = new google.maps.Marker({
			position : myLatLng,
			title : "Pune Vidyarthi Griha's College of Science and Technology"
		});
		marker.setMap(map);
	}
	google.maps.event.addDomListener(window, 'load', initialize);
</script>


<div class="panel">
	<div class="panel-primary">
		<div class="panel-heading">Get In Touch</div>
	</div>
	<div class="panel-body">
		<div class="row">
			<div class="col-md-4" style="font-size: medium;">
				<address>
					<strong>NIIT 2nd Floor, Sai Plaza, Jawahar Road,<br>Opp.
						Ghatkopar East Railway Station,<br> Ghatkopar East Saibaba
						Nagar,<br> Pant Nagar, Ghatkopar East Mumbai,<br>
						Maharashtra - 400077
					</strong>
				</address>
			</div>
			<div class="col-sm-offset-4 col-md-offset-4 ">
				<div id="map"></div>
			</div>
		</div>
	</div>
</div>



