<?php
    define('HOST', 'localhost');    // адрес сервера 
    define('DATABASE', 'cms.stud');   // имя базы данных
    define('USER', 'root'); 	// имя пользователя
    define('PASSWORD', '');		// пароль

    //Основные константы
    define('HTTP_SERVER', 'http://polis');
    
    // -- DIR's
    define('DIR_ROOT', __DIR__ . '/');
    define('DIR_CORE', '/core/');
    define('DIR_VIEW', '/app/view/default/');
    define('DIR_CTRL', '/app/controller/');
    define('DIR_MODEL', '/app/model/');
    define('DIR_JS', '/js/');
    define('DIR_IMG', '/img/');
    define('DIR_CSS', '/css/');
    // -- Sub DIR's
    define('DIR_ERR', DIR_CTRL . 'errors/');
    define('DIR_USER_IMG', DIR_IMG . 'user_images/');
    define('DIR_ADMIN_IMG', DIR_IMG . 'admin/');
    define('DIR_PRODUCT_IMG', DIR_IMG . 'product_images/');
    define('DIR_CATEGORY_IMG', DIR_IMG . 'category_images/');
    define('DIR_MAIN_IMG', DIR_IMG . 'main/');
    define('DIR_DEFAULT_USER_IMAGE', DIR_USER_IMG . 'default.png');
    define('DIR_VIEW_ADMIN', 'admin/');
    
    

    // Размер картинок
    define('IMAGE_RESOLUTION_MENU', '80px');
    define('IMAGE_RESOLUTION_CONTENT', '160px');
    define('IMAGE_RESOLUTION_PROD_PAGE', '200px');   
    define('IMG_RESOLUTION_ADMIN_BTN', '20px');
    

    // Размер файлов для загрузки
    define('IMAGE_MAX_SIZE', '1500000');
    
    
