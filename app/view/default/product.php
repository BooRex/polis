<div class="content__product">
    <div class="content__product-image">
        <img 
            height="<?php echo IMAGE_RESOLUTION_PROD_PAGE; ?>" 
            alt="<?php echo $product['product_name']; ?>" 
            src="<?php echo DIR_PRODUCT_IMG . $product['product_image'] ?>"
        > 
    </div>
    <div class="content__product-info">
        <p class="content__product-brandNname">
            <span class="content__product-brand"><?php echo $product['product_brand']; ?></span>
            <span class="content__product-name"><?php echo $product['product_name']; ?></span>
        </p>
        <p class="content__product-priceNquantity">
            <span class="content__product-price"><?php echo $product['product_price']."$"; ?></span>
            <span class="content__product-quantity"><?php echo $product['product_quantity']; ?></span>
        </p>     
        <a class="content__product-btn add_to_cart" href="#" name="<?php echo $_POST['product_id']; ?>">В корзину</a>
    </div>
    <p class="content__product-text"><?php echo $product['product_text']; ?></p>
</div>
