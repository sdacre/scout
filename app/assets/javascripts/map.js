$(document).ready(function(){
	$(document).addEventListener("turbolinks:load", function() {
		$( '.item:first' ).addClass( 'active');
	})
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
	
	var pos = ol.proj.fromLonLat([<%= pinned.place.longitude %>, <%= pinned.place.latitude %>]);

	// individual markers
	var marker = new ol.Overlay({
		position: pos,
		positioning: 'center-center',
		element: document.getElementById("marker_<%= pinned.id %>"),
		stopEvent: false
	});
	map.addOverlays(marker);

	map.on('click', function() {
		map.getView().setZoom(map.getView().getZoom()+1);  
	});
});
