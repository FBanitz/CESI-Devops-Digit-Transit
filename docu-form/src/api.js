const apiEndpoint = "http://localhost:8055";

const methods = {
    get: "GET",
    post: "POST",
    put: "PUT",
    delete: "DELETE",
}

/// https://docs.directus.io/reference/filter-rules.html
const apiOperators = {
    /// Equal to
    equals: "_eq",

    /// Not equal to
    notEquals: "_neq",

    /// Less than
    lessThan: "_lt",

    /// Less than or equal to
    lessThanOrEqual: "_lte",

    /// Greater than
    greaterThan: "_gt",

    /// Greater than or equal to
    greaterThanOrEqual: "_gte",

    /// Matches any of the values
    isOneOf: "_in",

    /// Doesn't match any of the values
    isNotOneOf: "_nin",

    /// Is null
    isNull: "_null",

    /// Is not null
    isNotNull: "_nnull",

    /// Contains the substring
    contains: "_contains",

    /// Doesn't contain the substring
    doesNotContain: "_ncontains",

    /// Starts with
    startsWith: "_starts_with",

    /// Doesn't start with
    doesNotStartWith: "_nstarts_with",

    /// Ends with
    endsWith: "_ends_with",

    /// Doesn't end with
    doesNotEndWith: "_nends_with",

    /// Is between two values (inclusive)
    isBetween: "_between",

    /// Is not between two values (inclusive)
    isNotBetween: "_nbetween",

    /// Is empty (null or falsy)
    isEmpty: "_empty",

    /// Is not empty (null or falsy)
    isNotEmpty: "_nempty",

    /// Value intersects a given point
    intersects: "_intersects",

    /// Value does not intersect a given point
    doesNotIntersect: "_nintersects",

    /// Value is in a bounding box
    intersectsBoundingBox: "_intersects_bbox",

    /// Value is not in a bounding box
    doesNotIntersectBoundingBox: "_nintersects_bbox",
}


async function apiRequest(route, method, parametters = null, body = null) {
    let paramettersString = "";

    if (parametters) {
        paramettersString = "?";
        for (const key in parametters) {
            paramettersString += key + "=" + parametters[key] + "&";
        }
        paramettersString = paramettersString.slice(0, -1);
    }

    let request = {
        "method": method,
        "headers": {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
        },
    }

    if (body) {
        request.body = JSON.stringify(body);
    }

    // console.log(apiEndpoint + route + paramettersString);

    return fetch(
        apiEndpoint + route + paramettersString,
        request
    )
}

async function apiGet(route, parametters = null) {
    return apiRequest(route, methods.get, parametters);
}

async function apiPost(route, parametters = null, body = null) {
    return apiRequest(route, methods.post, parametters, body);
}

async function apiPut(route, parametters = null, body = null) {
    return apiRequest(route, methods.put, parametters, body);
}

async function apiDelete(route, parametters = null) {
    return apiRequest(route, methods.delete, parametters);
}

function apiSimpleFilter(field, operator, value) {
    return '{"' + field + '": {"' + operator + '": "' + value + '"}}';
}

async function pingserver() {
    return apiGet("/server/ping");
}

export { apiEndpoint, apiOperators, apiRequest,  apiGet, apiPost, apiPut, apiDelete, apiSimpleFilter, pingserver };