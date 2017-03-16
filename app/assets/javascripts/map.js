$(document).ready(function(){
	$( '.item:first' ).addClass( 'active');


	if ($("#ol-data-div").length > 0) {
		var layer = new ol.layer.Tile({
			source: new ol.source.OSM()
		});

		var map = new ol.Map({
			layers: [layer],
			target: 'map',
			view: new ol.View({
				center: [0,0],
				zoom: 2
			})
		});

		var dataDiv = document.getElementById("ol-data-div");
		var longitude = dataDiv.dataset.longitude;
		var latitude = dataDiv.dataset.latitude;
		var pos = ol.proj.fromLonLat([longitude, latitude]);

		// individual markers
		var marker = new ol.Overlay({
			position: pos,
			positioning: 'center-center',
			element: document.getElementById("marker_<%= pinned.id %>"),
			stopEvent: false
		});
		map.addOverlay(marker);
		map.on('click', function() {
			map.getView().setZoom(map.getView().getZoom()+1);  
		});
	}
});
