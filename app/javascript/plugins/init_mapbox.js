  import mapboxgl from 'mapbox-gl';
  import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';


  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, zoom:11, minZoom: 12, maxZoom: 12   });
  };

  const addMarkersToMap = (map, markers) => {
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup) // add this
        .addTo(map);
    });
  };

  const initMapbox = () => {
    const mapElement = document.getElementById('map');
    const bounds = [
  [128.522924, 31.350410],
  [146.349173, 43.461032]
  ];

    if (mapElement) { // only build a map if there's a div#map to inject into
      mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
      const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v10',
        maxBounds: bounds
      });
      const markers = JSON.parse(mapElement.dataset.markers);
        markers.forEach((marker) => {
          new mapboxgl.Marker()
            .setLngLat([ marker.lng, marker.lat ])
            .addTo(map);
        });
     fitMapToMarkers(map, markers);
     addMarkersToMap(map, markers);
     // map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken }));
    }
  };

  export { initMapbox };
