$(document).ready(function() {
    $('.overlay').click(function() {
        $('.cart-interface').hide(500);
    })
    $('.cart-out').click(function() {
        $('.cart-interface').hide(500);
    })
    $('.nav-cart-view').click(function() {
        $('.cart-interface').show(500);
    })

    function format(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    }
    
    console.log($(".format"));

    /* update cart */
    let arrNum = $('.cart-num')
    let listItemBig = $('.row-cart');
    let listItemSmall = $('.nav-cart-item');
    listItemBig.each(function(index, cur) {
        let productQuantity = Number($(this).find("#product_quantity").val());
        $(this).find('> * > * >.btn-add').click(function() {
            arrNum[index].value = parseInt(arrNum[index].value) + 1;
            if (arrNum[index].value > productQuantity) {
                arrNum[index].value = productQuantity;
            }
            let cartitem_id = $(this).closest('.row-cart').find(".cart-item-id").val();
            let token = $('input[name="csrfmiddlewaretoken"]').val();
            $.ajax({
                type : "POST",
                url : "/update_cart",
                data : {
                    'cartitem_id': cartitem_id,
                    'quantity': arrNum[index].value,
                    'csrfmiddlewaretoken': token,
                },
                dataType : 'json',
                success : function(response) {
                    console.log(response);
                    $('#total')[0].textContent = response.total_cart;
                    console.log($(".format"));
                    $(".format").each(function(){
                        $(this).text(format($(this).text()));
                    });
                }
            })
        })
        $(this).find('> * > * >.btn-sub').click(function() {
            arrNum[index].value = parseInt(arrNum[index].value) - 1;
            if (arrNum[index].value <= 1) {
                arrNum[index].value = 1;
            }
            let cartitem_id = $(this).closest('.row-cart').find(".cart-item-id").val();
            let token = $('input[name="csrfmiddlewaretoken"]').val();
            $.ajax({
                type : "POST",
                url : "/update_cart",
                data : {
                    'cartitem_id': cartitem_id,
                    'quantity': arrNum[index].value,
                    'csrfmiddlewaretoken': token,
                },
                dataType : 'json',
                success : function(response) {
                    console.log(response);
                    $('#total')[0].textContent = response.total_cart;
                    $(".format").each(function(){
                        $(this).text(format($(this).text()));
                    });
                }
            })
        })
        $(this).find('> * > * > .cart-num').keyup(function() {
            this.value = this.value.replace(/[^0-9\.]/g, '');
        });
        $(this).find('> * > * > .cart-num').blur(function() {
            if ($(this).val() == "") {
                $(this).val(1);
                arrNum[index].value = 1;
            }
            if (parseInt($(this).val()) >= productQuantity) {
                $(this).val(10);
                arrNum[index].value = productQuantity;
            }
            if (parseInt($(this).val()) <= 1) {
                $(this).val(1);
                arrNum[index].value = 1;
            }
            let cartitem_id = $(this).closest('.row-cart').find(".cart-item-id").val();
            let token = $('input[name="csrfmiddlewaretoken"]').val();
            $.ajax({
                type : "POST",
                url : "/update_cart",
                data : {
                    'cartitem_id': cartitem_id,
                    'quantity': arrNum[index].value,
                    'csrfmiddlewaretoken': token,
                },
                dataType : 'json',
                success : function(response) {
                    console.log(response);
                    $('#total')[0].textContent = response.total_cart;
                    $(".format").each(function(){
                        $(this).text(format($(this).text()));
                    });
                }
            })
        })
        $(this).find('> * > .btn-remove').click(function() {
            let cartitem_id = $(this).closest('.row-cart').find(".cart-item-id").val();
            let token = $('input[name="csrfmiddlewaretoken"]').val();
            let count = $('.nav-cart-notice').text();
            cf = confirm('Are you sure?')
            if (cf){
                $.ajax({
                    type : "POST",
                    url : "/remove_cart",
                    data : {
                        'cartitem_id': cartitem_id,
                        'count': count,
                        'csrfmiddlewaretoken': token,
                    },
                    dataType : 'json',
                    success : function(response) {
                        console.log(response);
                        $('#total')[0].textContent = response.total_cart;
                        $(".format").each(function(){
                            $(this).text(format($(this).text()));
                        });
                    }
                })
                $(this).parents('.row-cart').remove();
                listItemSmall[index].remove();
                isHollow();
            }
        })
    })
    listItemSmall.each(function(index) {
        $(this).find('> * > * > .nav-cart-item-remove').click(function() {
            let cartitem_id = $(this).closest('.nav-cart-item').find(".cart-item-id").val();
            let token = $('input[name="csrfmiddlewaretoken"]').val();
            let count = $('.nav-cart-notice').text();
            console.log(count)
            cf = confirm('Are you sure?')
            if (cf){
                $.ajax({
                    type : "POST",
                    url : "/remove_cart",
                    data : {
                        'cartitem_id': cartitem_id,
                        'count': count,
                        'csrfmiddlewaretoken': token,
                    },
                    dataType : 'json',
                    success : function(response) {
                        console.log(response);
                        $('.nav-cart-notice')[0].textContent = response.count;
                        $('#total')[0].textContent = response.total_cart;
                    }
                })
                $(this).parents('.nav-cart-item').remove();
                listItemBig[index].remove();
                isHollow();
            }
        });
    })
    isHollow();
    function isHollow() {
        if ($('.nav-cart-item').length === 0) {
            $('.nav_has_cart').hide();
            $('.nav-no-cart').show();
            $('.nav-cart-notice').hide();
        } else {
            $('.nav_has_cart').show();
            $('.nav-no-cart').hide();
            $('.nav-cart-notice').show();
        }
        if ($('.row-cart').length === 0) {
            $('.no-cart').show();
            $('.your-cart .form').hide();
            $('.cart-info').hide();
        } else {
            $('.no-cart').hide();
            $('.your-cart .form').show();
            $('.cart-info').show();
        }
    }

    /* order */
    var checkboxAddress = 0;
    $('.cart-interface .checkbox-address').on('change', function() {
        checkboxAddress++;
        let val = $(".cart-interface input[name='address-default']").val();
        if (checkboxAddress % 2) {
            $('.cart-interface .input-address input').removeAttr('readonly');
        } else {
            $('.cart-interface .input-address input').val(val);
            $('.cart-interface .input-address input').attr('readonly', 'readonly');
        }
    });
    $('.cart-submit').click(function() {
        let check = true;
        if ($('.address-receive').val() == '') {
            check = false;
            $('.error-address').show();
        } else {
            check = true;
            $('.error-address').hide();
        }
        if (check == true) {
            $('.form')[0].submit();
        }
    })
});