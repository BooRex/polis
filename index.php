<?php
    namespace App;

    use App\Libs\Route as Route;

    header('Content-Type: text/html; charset=utf-8');
    session_start();

    // -- Site configuration
    require_once 'config.php';
    require_once DIR_CORE.'database.php';
    require_once DIR_CORE.'route.php';
    
    $router = new Route;

    // -- Get the [CONTROLLER_NAME] from URL
    if(isset($_GET['_route_']))
    {
        $controller = $router->get_controller($_GET['_route_']);
    }
    else
    {
        $controller = 'main';  
    }
    // -- Site Assembler
    $router->assembler($controller);