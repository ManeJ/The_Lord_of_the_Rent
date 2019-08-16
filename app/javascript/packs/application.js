import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { total_price_completion, total_price_completion_1 } from '../plugins/total_price_calculator';
import "../plugins/flatpickr"

initMapbox();
initAutocomplete();
total_price_completion();
total_price_completion_1();
