import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    const map = new mapboxgl.Map({
      container: 'map',
      // style: 'mapbox://styles/mapbox/streets-v11'
      // style: 'mapbox://styles/lililestrade/ck8huzc2h09891iqdate9pkw5'
      style: 'mapbox://styles/lililestrade/ck8huzc2h09891iqdate9pkw5'
    });

    const markers = JSON.parse(mapElement.dataset.markers);

    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

      new mapboxgl.Marker({color: `#B0BDB0`} )
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup) // add this
        .addTo(map);
    });

    fitMapToMarkers(map, markers);

    // map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
    //                                     mapboxgl: mapboxgl,
    //                                     placeholder: 'Chercher un pays' }));

    const geocoder = new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
                                        mapboxgl: mapboxgl,
                                        placeholder: 'Chercher un pays' });
    document.getElementById('geocoder').appendChild(geocoder.onAdd(map));
  }
};

export { initMapbox };
