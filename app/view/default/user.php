<p class="profile__user_login">
    <?php echo $_SESSION['user_first_name'] . " " . $_SESSION['user_last_name'] ?>
</p>
<?php echo !isset($btn_admin_panel) ?'':$btn_admin_panel; ?>
<form method="POST" enctype="multipart/form-data">
    <input type="hidden" name="isImgUploading"/>
    <div class="file_upload">
        <button class="btn_chng_user_image" type="button">
            <img 
                class="profile__user_image al-center"
                width="<?php echo IMAGE_RESOLUTION_CONTENT; ?>" 
                height="<?php echo IMAGE_RESOLUTION_CONTENT; ?>" 
                src="<?php echo $_SESSION['user_image']=='default.png' ? 
                        DIR_USER_IMG . "default_btn_img_upload.png" : DIR_USER_IMG . $_SESSION['user_image'];?>" 
            >
            <input accept="image/*" class="input_under_img" type="file" name="user_image">
        </button>       
    </div>
    <br>
    <input type="submit" value="Загрузить">
</form>
<p class="profile__user_email">Почта:<br>
    <?php echo $_SESSION['user_email'] ?>	
</p>
<form method="POST">
    <input type="hidden" name="isPassChanging"/>
    <p>
        <input placeholder="Старый пароль" type="password" name="old_password">
    </p>
    <br>			
    <p>
        <input placeholder="Новый пароль" type="password" name="new_password">
    </p>
    <br>
    <p>
        <input placeholder="Повторите новый пароль" type="password" name="new_password_2">
    </p>
    <br>
    <p>
        <input type="submit" value="Сменить пароль">
    </p>
</form>