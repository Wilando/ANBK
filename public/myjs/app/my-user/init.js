let myUser = null;
let userRoles = null;
let userPermissions = null;

async function fetchMyuser() {
    const response = await axios.get(app_url + '/my-user');
    try {
        myUser = response.data.data;
        userRoles = myUser.list_roles;
        userPermissions = myUser.list_permissions;
    } catch
        (error) {
        console.error(error);
    }
}

function checkPermission(name) {
    if (userRoles) {
        if (userRoles.includes('superadmin')) {
            return true;
        } else {
            if (userPermissions.includes(name)) {
                return true;
            }
        }
        return false;
    }
    return false;
}

function checkanyPermission(name) {
    if (userRoles) {
        if (userRoles.includes('superadmin')) {
            return true;
        } else {
            if (name.some((item) => userPermissions.includes(item))) {
                return true;
            }
        }
        return false;
    }
    return false;
}


