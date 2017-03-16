$(document).ready(function(){
	$( '.item:first' ).addClass( 'active');

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

	map.on('click', function() {
		map.getView().setZoom(map.getView().getZoom()+1);  
	});

	if ($(".ol-data-div").length > 0) {
		$(".ol-data-div").each(function(idx, elem){
			var longitude = $(elem).data("longitude")
			var latitude = $(elem).data("latitude")
			var id = $(elem).data("id")
			var pos = ol.proj.fromLonLat([longitude, latitude]);

			// individual markers
			var marker = new ol.Overlay({
				position: pos,
				positioning: 'center-center',
				element: document.getElementById("marker_" + id),
				stopEvent: false
			});
			map.addOverlay(marker);
		})
	}
});
