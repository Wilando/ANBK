import axios from 'axios';

window.axios = axios;
window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
const csrf_token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
window.axios.defaults.headers.common['X-CSRF-TOKEN'] = csrf_token;
window.axios.defaults.headers.post['content-type'] = 'multipart/form-data';
import jQuery from 'jquery';
window.$ = jQuery;
// import '@popperjs/core/dist/umd/popper.min.js';

import * as bootstrap from 'bootstrap';

window.bootstrap = bootstrap;

import Swal from 'sweetalert2';


window.Swal = Swal;


import "@lottiefiles/lottie-player";

import 'adminlte4/dist/js/adminlte.min.js';
import 'fslightbox/index.js';



// import Popper from '@popperjs/core';
// window.Popper = Popper;
$.ajaxSetup({
    headers: {
        'X-CSRF-Token': csrf_token
    }
});

import select2 from 'select2';

select2();

import Tags from "bootstrap5-tags";
window.Tags = Tags;

// import {Calendar} from '@fullcalendar/core';
// window.Calendar = {Calendar};
// import dayGridPlugin from '@fullcalendar/daygrid';
// window.dayGridPlugin = dayGridPlugin;
// import { Calendar } from '@fullcalendar/core';
// import dayGridPlugin from '@fullcalendar/daygrid';
// import '@fullcalendar/core'; // CSS untuk FullCalendar
// import '@fullcalendar/daygrid/main.css'; // CSS untuk DayGrid Plugin

import Echo from 'laravel-echo';
 
import Pusher from 'pusher-js';
window.Pusher = Pusher;
 
window.Echo = new Echo({
    broadcaster: 'reverb',
    key: import.meta.env.VITE_REVERB_APP_KEY,
    wsHost: import.meta.env.VITE_REVERB_HOST,
    wsPort: import.meta.env.VITE_REVERB_PORT,
    wssPort: import.meta.env.VITE_REVERB_PORT,
    forceTLS: (import.meta.env.VITE_REVERB_SCHEME ?? 'https') === 'https',
    enabledTransports: ['ws', 'wss'],
});