$(document).ready(function() {
    var form = $(".form-search-product");
    var return_first;
    function callback(response) {
        return_first = response;
        products = return_first.products;
        html = "";
        count = 0;
        for (let product of products) {
            count += 1;
            html += "<tr class='clickable-row' style='white-space: pre; text-align: center;'>";
            html += "<td>" + count + "</td>";
            html += "<td style='display: none;'>" + product[0] + "</td>";
            for (let i = 1; i < product.length-1; i++) {
                if (i == 5) {
                    html += "<td>" + format(product[i]) + ' VNĐ' + "</td>";
                } else {
                    html += "<td>" + product[i] + "</td>";
                }
            }
            html += "</tr>"
        }
        $(".table-product tbody").html(html);
        load();
    }

    form.on("submit", function(){
        var info = $("input[name='info']")[0].value;
        var choose = $("select[name='choose']").find(":selected").val();
        if (info.trim() == "") {
            location.reload(true);
        } else {
            $.ajax({
                type : "GET",
                url : "/shelf",
                data : {
                    'info': info,
                    'choose': choose,
                },
                dataType : 'json',
                success : function(response) {
                    console.log(response);
                    callback(response);                    
                }
            });
        }
        return false;
    });

    function load(){
        $('.clickable-row').on('click', function () {
            var currentRow=$(this).closest('tr');
            var product_id = parseInt(currentRow.find("td:eq(1)").text());
            console.log(product_id);
            document.getElementById("productUpdate").setAttribute("value", product_id);
            document.getElementById("productInfo").setAttribute("action", "/product_Modify");
            document.getElementById("productInfo").submit();
        })
    }
    load();
})