import axios from 'axios';
window.axios = axios;
window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
const csrf_token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
window.axios.defaults.headers.common['X-CSRF-TOKEN'] = csrf_token;
import Swal from 'sweetalert2';
window.Swal = Swal;
import 'sweetalert2/src/sweetalert2.scss';
import TomSelect from "tom-select";
window.TomSelect = TomSelect;
import Highcharts from "highcharts"
window.Highcharts = Highcharts;
import Exporting from 'highcharts/modules/exporting';
Exporting(Highcharts);
import "@lottiefiles/lottie-player";
