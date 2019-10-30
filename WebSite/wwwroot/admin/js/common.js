/**
 * HTTP请求POST（异步）
 * @param {string} url 请求地址
 * @param {object} data 请求参数
 * @param {func} callback 请求回调
 */
function HttpPostAsync(url, data, callback) {
    HttpPost(url, data, true, callback);
}

/**
 * HTTP请求POST（同步）
 * @param {string} url 请求地址
 * @param {object} data 请求参数
 * @param {bool} async 是否异步
 * @param {func} callback 请求回调
 */
function HttpPost(url, data, async, callback) {
    $.ajax({
        url: url,
        type: 'POST',
        data: JSON.stringify(data),
        async: async,
        contentType: 'application/json',
        dataType: 'json',
        beforeSend: function () {
            layer.load(2);
        },
        success: function (result, status, xhr) {
            callback(result);
        },
        error: function (xhr, status, error) {
            callback(null, error);
        },
        complete: function () {
            layer.closeAll('loading');
        }
    })
}