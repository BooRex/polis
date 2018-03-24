<div class="content__categories">
    <?php foreach($categories as $category) { ?>
        <a class="content__categories-item" href="<?php echo $category['category_link'] ?>">
            <p class="content__categories-name"><?php echo $category['category_name']; ?></p>
            <img 
                height="<?php echo IMAGE_RESOLUTION_CONTENT;?>" 
                alt="<?php echo $category['category_name']; ?>" 
                src="<?php echo DIR_CATEGORY_IMG.$category['category_image'] ?>"
            > 
            <p class="content__categories-text"><?php echo $category['category_text']; ?></p>
        </a>
    <?php } ?>
</div>
