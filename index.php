<?php
    namespace App;

    use App\Libs\Router;

    header('Content-Type: text/html; charset=utf-8');
    session_start();

    // -- Site configuration
    require_once 'config.php';
    require_once DIR_CORE.'database.php';
    require_once DIR_CORE.'router.php';
    
    $router = new Router;

    // -- Get the [CONTROLLER_NAME] from URL
    if(isset($_GET['_route_']))
    {
        $controller = $router->getController($_GET['_route_']);
    }
    else
    {
        $controller = 'main';  
    }
    // -- Site Assembler
    $router->goAssemble($controller);