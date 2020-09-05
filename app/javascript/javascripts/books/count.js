document.addEventListener('turbolinks:load', function () {
    var book_plus = document.getElementById("book_plus");
    if (book_plus) {
        book_plus.addEventListener("click", function (e) {
            if (e.target) {
                var amount = document.getElementById("book_amount");
                if (amount.value === '') {
                    amount.value = 1;
                } else {
                    amount.value = parseInt(amount.value) + 1;
                }
            }
        });
    }
});

document.addEventListener('turbolinks:load', function () {
    var book_minus = document.getElementById("book_minus");
    if (book_minus) {
        book_minus.addEventListener("click", function (e) {
            if (e.target) {
                var amount = document.getElementById("book_amount");
                if (amount.value === '' || amount.value === '0') {
                    amount.value = 0;
                } else {
                    amount.value = parseInt(amount.value) - 1;
                }
            }
        });
    }
});
