import mapboxgl from 'mapbox-gl';

const buildMap = (mapElement) => {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    return new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v10'
    });
};

const addMarkersToMap = (map, marker) => {
    new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .addTo(map);
};

const fitMapToMarkers = (map, marker) => {
    const bounds = new mapboxgl.LngLatBounds();
    bounds.extend([marker.lng, marker.lat]);
    map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
    const mapElement = document.getElementById('map');
    console.log(mapElement);
    if (mapElement) {
        const map = buildMap(mapElement);
        const marker = JSON.parse(mapElement.dataset.markers);
        console.log(marker);
        addMarkersToMap(map, marker);
        fitMapToMarkers(map, marker);
    }
};

export { initMapbox };