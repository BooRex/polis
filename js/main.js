$(document).ready(function () 
{
    // -- Add to cart to SESSION
    $(".add_to_cart").click(function () 
    {
        var product_id = $(this).attr("name");
        $(this).addClass("added");
        
        $.ajax(
        {
            type: "POST",
            data: "product_id=" + product_id + "&method=ajax",
            success: function (product) 
            {
                $("#cart").append(product);
                $(".added").html("+ Добавлено")

            }
        });
    });
    // -- Add to cart to VIEW
    $(".msg").click(function()
    {
        $(".msg").css('display','none');
    });
});


