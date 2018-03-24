<form method="POST" enctype="multipart/form-data">
    <input type="hidden" name="isEditing"/>
    <input type="hidden" name="product_id" value="<?php echo $product['product_id']; ?>" />
    <input type="hidden" name="product_image" value="<?php echo $product['product_image']; ?>" />
    
    <input placeholder="Название" type="text" name="product_name" value="<?php echo $product['product_name']; ?>" /><br />    
    <br>
    <p>Бренд 
        <select name="product_brand_id" class="form-control">
            <?php foreach ($arr_brands as $brands) { 
                echo "<option value='".$brands['brand_id']."' ";
                echo $product['product_brand_id']==$brands['brand_id']?"selected='selected'":"";
                echo ">".$brands['brand_name']."</option>";
            } ?>
        </select>   
    </p> 
    <br>
    <p>Категория 
        <select name="category_id" class="form-control">
            <?php foreach ($arr_categories as $categories) { 
                echo "<option value='".$categories['category_id']."' ";
                echo $categories['category_id']==$ptc_category_id?"selected='selected'":"";
                echo ">".$categories['category_name']."</option>";
            } ?>
        </select>   
    </p> 
    <br>
    <textarea placeholder="Короткий текст" name="product_text_small"><?php echo $product['product_text_small']; ?></textarea><br />
    <br>
    <textarea placeholder="Текст" name="product_text"><?php echo $product['product_text']; ?></textarea><br />
    <br>
    <input placeholder="Цена" type="text" name="product_price" value="<?php echo $product['product_price']; ?>" /><br />    
    <br>
    <input placeholder="Количество" type="text" name="product_quantity" value="<?php echo $product['product_quantity']; ?>" /><br />    
    <br>
    <input placeholder="SEO Title" type="text" name="product_seo_title" size="" value="<?php echo $product['product_seo_title']; ?>" /><br />
    <br>
    <input placeholder="SEO Description" type="text" name="product_seo_description" size="" value="<?php echo $product['product_seo_description']; ?>" /><br />
    <br>
    <input placeholder="SEO Keywords" type="text" name="product_seo_keywords" size="" value="<?php echo $product['product_seo_keywords']; ?>" /><br />
    <br>
    <p>Статус
        <select name="status" class="form-control">
            <option value="0" <?php if($product['status']==0){ echo 'selected="selected"'; } ?>>Выкл</option>
            <option value="1" <?php if($product['status']==1){ echo 'selected="selected"'; } ?>>Вкл</option>
        </select>   
    </p> 
    <br /><br />
    
    <div class="file_upload">
        <button class="btn_chng_user_image" type="button">
            <img 
                class="profile__user_image al-center"
                height="<?php echo IMAGE_RESOLUTION_CONTENT; ?>" 
                src="<?php echo DIR_CATEGORY_IMG.$product['product_image']; ?>"
            >
            <input accept="image/*" class="input_under_img" type="file" name="image">
        </button>       
    </div>
    <br>

    
    <input type="submit" name="enter" value="Сохранить" />
    <a class="btn_back" href="<?php echo $_SERVER['HTTP_REFERER'];?>">НАЗАД</a><br /><br />

</form>

