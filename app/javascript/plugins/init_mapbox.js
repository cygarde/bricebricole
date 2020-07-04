import  mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const mapElement = document.getElementById('map');

const addMarkers = (map, markers) => {
    markers.forEach((marker) => {
        const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

        new mapboxgl.Marker()
            .setLngLat([marker.lng, marker.lat])
            .setPopup(popup)
            .addTo(map);


    });
};
const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 250, duration: 0 });
};


const initMapbox = () => {
    if (mapElement) {
        mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

        const map = new mapboxgl.Map({
            container: 'map',
            style: 'mapbox://styles/mapbox/streets-v11'
        });


        const markers = JSON.parse(mapElement.dataset.markers);


        fitMapToMarkers(map, markers);
        addMarkers(map, markers);
        map.addControl(new MapboxGeocoder({accessToken: mapboxgl.accessToken, mapboxgl: mapboxgl}));
    }
};

export { initMapbox };



