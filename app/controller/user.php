<?php

namespace App\Controllers;

use App\Models\User as UserModel;

include DIR_MODEL . $controller . ".php";

class User
{

    // -- DEF template is already installed by CONTROLLER
    public $template = "user";
    public $userModel;

    public function __construct()
    {
        
        $this->userModel = new UserModel;
        // -- If is Guest -> 404
        if (empty($_SESSION))
        {
            $this->template = "errors/404";
        }
        else
        {
            // -- Show ADMIN BUTTON, if this is Admin
            if ($_SESSION['authorized'] == 'admin')
            {
                $this->btn_admin_panel = "<a class='profile__admin_panel luxury' href='/admin'>Панель администратора</a>";
            }
            // -- Check hidden fields ISSET
            if (isset($_POST['isImgUploading']))
            {
                $this->uploadUser_image();
            }
            if (isset($_POST['isPassChanging']))
            {
                $this->changeUser_password();
            }
        }
    }

    // -- Upload image Method
    public function uploadUser_image()
    {
        if(is_uploaded_file($_FILES['user_image']['tmp_name']))
        {
            $uploaded_file_name = $_FILES['user_image']['name'];
            $uploaded_file_extention = substr($uploaded_file_name, strrpos($uploaded_file_name, '.') + 1);
            $uploaded_file_size = $_FILES['user_image']['size'];
            if (preg_match("#(png|jpg|gif)#", $uploaded_file_extention))
            {
                if ($uploaded_file_size < IMAGE_MAX_SIZE)
                {
                    $dir_upload = "img\\user_images\\";
                    $user_image_name = md5($_SESSION['user_email'] . time()) . ".$uploaded_file_extention";
                    $user_image_path = $dir_upload . $user_image_name;
                    
                    if (move_uploaded_file($_FILES['user_image']['tmp_name'], $user_image_path))
                    {
                        $this->msg = "succ_image_upl";
                        $this->updateUser_image($_SESSION['user_id'], $user_image_name);
                        $_SESSION['user_image'] = $user_image_name;
                        
                    }
                }
                else
                {
                    $this->msg = "err_image_size";
                }
            }
            else
            {
                $this->msg = "err_not_image";
            }
        }
    }
    
    // -- Change password Method
    public function changeUser_password()
    {
        /* 
        // -- Цикл для создания ЧПУ для продукта по его имени ДЛЯ АДМИНКИ
        for ($i=1;$i<44;$i++)
        {            
            $array = $this->userModel->DB_GetOneLine("SELECT product_id, product_name FROM products WHERE product_id=$i");
            $array['product_name'] = strtolower(str_replace(' ', '_', $array['product_name']));
            $alias = $array['product_name'];
            $this->userModel->DB_Insert("INSERT INTO url_alias(url,alias) VALUES('product_id=$i','$alias')");
        }
        */
        if ($this->checkFields_isset())
        {
            if ($this->checkFields_notEmpty())
            {
                $old_password = $this->userModel->DB_checkInjections_isset($_REQUEST['old_password']);
                $new_password = $this->userModel->DB_checkInjections_isset($_REQUEST['new_password']);
                $new_password_2 = $this->userModel->DB_checkInjections_isset($_REQUEST['new_password_2']);
                               
                if (md5($old_password) == $this->userModel->getUser_password($_SESSION['user_id']))
                {
                    if ($new_password === $new_password_2)
                    {
                        if ($old_password != $new_password)
                        {
                            $this->msg = "succ_pass_change";
                            $this->userModel->updateUser_password($_SESSION['user_id'], md5($new_password));
                        }
                        else
                        {
                            $this->msg = "err_pass_is_old";
                        }
                    }
                    else
                    {
                        $this->msg = "err_pass_missmatch";
                    }
                }
                else
                {
                    $this->msg = "err_pass";
                }
            }
            else
            {
                $this->msg = "err_empty_fields";
            }
        }
    }
    // -- Private methods
    private function checkFields_isset()
    {
        if (isset($_REQUEST['old_password']) && isset($_REQUEST['new_password']) && isset($_REQUEST['new_password_2']))
        {
            return TRUE;
        }
        else
        {
            return FALSE;
        }
    }
    
    private function checkFields_notEmpty()
    {
        if (!empty($_REQUEST['old_password']) && !empty($_REQUEST['new_password']) && !empty($_REQUEST['new_password_2']))
        {
            return TRUE;
        }
        else
        {
            return FALSE;
        }
    }

    private function updateUser_password($user_id, $new_password)
    {      
        return $this->userModel->updateUser_password($user_id, $new_password);
    }
    
    private function updateUser_image($user_id, $user_image_name)
    {
        // -- Get old file path to delete it
        $old_user_image_path = DIR_USER_IMG . $_SESSION['user_image'];
        // -- IF this file DEFAULT.PNG, then don't delete it
        if ($old_user_image_path != DIR_DEFAULT_USER_IMAGE)
        {
            // -- IF other existing file -> delete it
            unlink($_SERVER['DOCUMENT_ROOT'] . $old_user_image_path);
        }
        // -- And update USER_IMAGE in DB
        return $this->userModel->updateUser_image($user_id, $user_image_name); 
    }
} // Class END

$obj_User = new User;
$template = $obj_User->template;
$btn_admin_panel = $obj_User->btn_admin_panel;
$msg = $obj_User->msg;
