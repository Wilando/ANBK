const base_url = window.location.origin;
const app_url = `${base_url}/app`;
const api_url = `${base_url}/api`;

const default_lat = -4.976967413683819;
const default_lng = 105.21019494408503;
const apiKeyTinyMce = 'mny2p9ubt9snne8yz7bzfox288m67adsh7t8e413xvjzmgrs';

async function getSettingapp(name) {
    const response = await axios.get(base_url + '/get-setting-app/' + name);
    try {
        return response.data;
    } catch
        (error) {
        console.error(error);
    }
}
