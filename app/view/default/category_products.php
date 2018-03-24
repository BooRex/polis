<div class="content__products">
    <?php foreach($products as $product) { ?>        
        <div class="content__products-item">
            <img 
                height="<?php echo IMAGE_RESOLUTION_CONTENT;?>" 
                alt="<?php echo $product['product_name']; ?>" 
                src="<?php echo DIR_PRODUCT_IMG.$product['product_image'] ?>"
            > 
            <div class="content__products-nameNprice">
                <p class="content__products-price"><?php echo $product['product_price']." $"; ?></p>
                <p class="content__products-name"><?php echo $product['product_name']; ?></p>
                
            </div>
            <div class="content__products-btns">
                <a class="content__products-btn add_to_cart" href="#" name="<?php echo $product['product_id']; ?>">В корзину</a>
                <a class="content__products-btn more" href="<?php echo $product['product_link'] ?>">Подробнее</a>
            </div>
        </div>
    <?php } ?>
</div>