<?php
    namespace App\Libs;

    class Route extends Database
    {
        // -- Method that get [CONTROLLER_NAME] from URL string($route)
        public function get_controller($route) 
        {
            $path = $this->get_path($route);
            // -- If returned 404 then show ERROR404 page
            if($path !== 404)
            {
                // -- Explode URL by slashes
                $path_array = explode('/', $path);
                $after_path = [];
                foreach ($path_array as $p_a) 
                {
                    $between_slashes = explode('=', $p_a);
                    // -- If first word is [0]
                    if($between_slashes[0] == "controller")
                    {
                        // -- CONTROLLER is word after =
                        $controller =  $between_slashes[1];
                    }
                    else
                    {
                        // -- Between slashes expamle. [category_id] = 1
                        $after_path[$between_slashes[0]] = $between_slashes[1];
                    }
                }
                // -- Write to POST that part of a url
                foreach ($after_path as $key => $value) 
                {
                    $_POST[$key] = $value;  
                }

            }
            else
            {
                $controller = "errors/404";
            }
            // -- Return [CONTROLLER_NAME]
            return $controller;
        }
        // -- Method that check URL to find CONTROLLER and prevent from CONTROLLER repetition
        public function get_path($route) 
        {
            $url = '';
            $controllers_count = 0;

            $route_array = explode('/', $route);
            foreach ($route_array as $r_a) 
            {
                $isset_controller = $this->DB_GetOneLine("SELECT url FROM url_alias WHERE alias = '$r_a'");
                if($isset_controller)
                {
                    foreach ($isset_controller as $url_shard) 
                    {
                        // -- Assembling the url-string
                        $url .= '/'.$url_shard;
                        // -- Check number of controllers in a string
                        if (strstr($url_shard, "controller")) 
                        {
                            $controllers_count++;
                        }
                    }
                }
                else
                {
                    // -- Return ERROR404 if CONTROLLER doesn't exist
                    return 404;
                }
            }
            if($controllers_count > 1) 
            {
                // -- Return ERROR404 if number of CONTROLLERS MORE THAN 1
                return 404;
            }
            // -- Return controller=[CONTROLLER_NAME]
            return substr($url, 1);
        }
        // -- Method that assemble site through TEMPLATE
        public function assembler($controller) 
        {
            // -- Default template initialization
            $template = $controller;
            //$selector - для определения AJAX запроса что бы можно было вернуть только результат...
            $selector = 0;  
            if(isset($_REQUEST['method']) && $_REQUEST['method']=='ajax'){
                $selector = 1;
            }
            //подключим нужные контроллеры
            if(!$selector){ include DIR_CTRL.'header.php'; }
            include DIR_CTRL.$controller.'.php'; // Controller returns TEMPLATE    
            if(!$selector){ include DIR_CTRL.'footer.php'; }
            //echo "<pre>"; echo print_r($_SESSION); echo "</pre>";
            if(!$selector){ include DIR_VIEW.'header.php'; }
            if ($controller != "admin")
            {    
                if(!$selector){ include DIR_VIEW.$template.'.php'; }
            }
            else
            {
                if(!$selector){ include "/app/view/".$template.'.php'; }
            }
            if(!$selector){ include DIR_VIEW.'footer.php'; }
        }

    }