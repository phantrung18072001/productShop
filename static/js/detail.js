
$(document).ready(function() {
    if ($('input[name="success"]').val()) {
        $("#overlay").css({ "display": "block" });
        $("#popup").css({ "display": "block" });
    }
    $('.clearfix .submitbtn').on('click', function() {
        $("#overlay").css({ "display": "none" });
        $("#popup").css({ "display": "none" });
    });
    $('.view-cart').click(function() {
        $('.cart-interface').show(500);
    })

    let productQuantity = Number($(".quantity")[0].textContent);
    $('.product-btn-sub').click(function() {
        $('.product-num-input').val(parseInt($('.product-num-input').val()) - 1);
        if ($('.product-num-input').val() <= 1) {
            $('.product-num-input').val(1);
        }
    })
    $('.product-btn-add').click(function() {
        $('.product-num-input').val(parseInt($('.product-num-input').val()) + 1);
        if ($('.product-num-input').val() >= productQuantity) {
            $('.product-num-input').val(productQuantity);
        }
    })
    $('.product-num-input').keyup(function() {
        this.value = this.value.replace(/[^0-9\.]/g, '');
    });
    $('.product-num-input').blur(function() {

        if ($(this).val() == "") {
            $(this).val(1);
        }
        if (parseInt($(this).val()) >= productQuantity) {
            $(this).val(productQuantity);
        }
        if (parseInt($(this).val()) <= 1) {
            $(this).val(1);
        }
    })

    let listImg = $('.list-img');
    let mainImg = $('.product-main-img img');

    function load(cur) {
        listImg.removeClass('active');
        cur.addClass('active');
        mainImg.attr('src', cur.attr('src'));
    }

    load($(listImg[0]));

    listImg.each(function(index) {
        $(this).click(function() {
            load($(this));
            console.log($(this))
        })
    })

    $('.close').click(function() {
        $('.slider-view-img').fadeOut(500);
    })
});
