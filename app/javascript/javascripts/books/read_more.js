document.addEventListener('turbolinks:load', function () {
    var read_more = document.getElementById("read_more");
    if (read_more) {
        read_more.addEventListener("click", function (e) {
            if (e.target) {
                read_more.setAttribute('style', 'display: none')
                var full_description = document.getElementById("full_description");
                full_description.setAttribute('style', 'display: normal')
                var short_description = document.getElementById("short_description");
                short_description.setAttribute('style', 'display: none')
            }
        });
    }
});
