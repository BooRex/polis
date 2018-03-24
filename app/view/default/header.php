<?php include DIR_CORE . "messages.php" ?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title><?php echo $title; ?></title>
        
        <meta name="title" content="<?php echo $title; ?>" />
        <meta name="keywords" content="<?php echo $key; ?>" />
        <meta name="description" content="<?php echo $desc; ?>" />
        
        <link rel="stylesheet" type="text/css" href="<?php echo DIR_CSS . "style.css"; ?>">
        
        <script type="text/javascript" src="<?php echo DIR_JS . "jquery-3.3.1.min.js" ?>"></script>
        <script type="text/javascript" src="<?php echo DIR_JS . "main.js" ?>"></script>
    </head>
    <body>

        <div class="menu">
            <div class="menu__links">
                <a class="menu__links-item" href="<?php echo HTTP_SERVER ?>">Главная</a>
                <a class='menu__links-item' href='<?php echo HTTP_SERVER . "/categories" ?>'>Каталог</a>
                <?php
                if (isset($_SESSION['authorized']))
                {
                    switch ($_SESSION['authorized'])
                    {
                        case "user":
                            echo
                            "
                            <a class='menu__links-item' href='/tour/my'>Мои заказы</a>
                            ";
                            break;
                        /*case "manager":
                            echo
                            "
                            <a class='menu__links-item' href='/orders'>Заказы</a>
                            <a class='menu__links-item' href='/admin/tour_change'>Изменить тур</a>
                            ";
                            break;*/
                        case "admin":
                            echo
                            "
                            <a class='menu__links-item' href='/admin/re_category'>Категории</a>
                            <a class='menu__links-item' href='/admin/re_product'>Продукты</a>
                            <a class='menu__links-item' href='/admin/re_user'>Пользователи</a>
                            ";
                            break;
                    }
                    echo
                    "
                    <span class='menu__auth'>
                        <a class='link_user_profile' href='/user'>
                            <img 
                                class='menu__user_image' 
                                width='" . IMAGE_RESOLUTION_MENU . "' 
                                height='" . IMAGE_RESOLUTION_MENU . "' 
                                src='" . DIR_USER_IMG . $_SESSION['user_image'] . "'
                            >
                        </a>
                        <a class='menu__links-item menu__link_exit' href='/exit.php'>Выйти</a>
                    </span>
                    ";
                }
                else
                {
                    echo
                    "
                    <span class='menu__auth'>
                        <a class='menu__links-item' href='/login'>Войти</a>
                        <a class='menu__links-item' href='/register'>Зарегистрироваться</a>
                    </span>
                    ";
                }
                ?>
            </div>
        </div>
        <div class="content">
