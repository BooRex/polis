<form method="POST" enctype="multipart/form-data">
    <input type="hidden" name="isAdding"/>
    <input type="hidden" name="category_image" value="<?php echo "smartphone.png"; ?>" />
    
    <input placeholder="Название" type="text" name="category_name" value="Название" /><br />    
    <br>
    <textarea placeholder="Короткий текст" name="category_text_small" cols="75" rows="2">Короткий текст</textarea><br />
    <br>
    <input placeholder="SEO Title" type="text" name="category_seo_title" size="" value="SEO Title" /><br />
    <br>
    <input placeholder="SEO Description" type="text" name="category_seo_description" size="" value="SEO Description" /><br />
    <br>
    <input placeholder="SEO Keywords" type="text" name="category_seo_keywords" size="" value="SEO Keywords" /><br />
    <br>
    <input placeholder="Сортировка" type="text" name="sort_order" size="" value="1" /><br />
    <br>
    <p>Статус
        <select name="status" class="form-control">
            <option value="0" <?php if($category['status']==0){ echo 'selected="selected"'; } ?>>Выкл</option>
            <option value="1" <?php if($category['status']==1){ echo 'selected="selected"'; } ?>>Вкл</option>
        </select>   
    </p> 
    <br /><br />
    
    <div class="file_upload">
        <button class="btn_chng_user_image" type="button">
            <img 
                class="profile__user_image al-center"
                height="<?php echo IMAGE_RESOLUTION_CONTENT; ?>" 
                src="<?php echo DIR_CATEGORY_IMG.$category['category_image']; ?>"
            >
            <input accept="image/*" class="input_under_img" type="file" name="image">
        </button>       
    </div>
    <br>
  
    <input type="submit" name="enter" value="Сохранить" />
    <a class="btn_back" href="<?php echo $_SERVER['HTTP_REFERER'];?>">НАЗАД</a><br /><br />

</form>