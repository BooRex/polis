<?php

namespace App\Controllers;

use App\Models\Login as LoginModel;
use App\Libs\Session as Session;

include DIR_CORE . "session.php";
include DIR_MODEL . $controller . ".php";


class Login
{
    public $template = "login";
    public $loginModel;
    public $session;

    public function __construct()
    {
        $this->loginModel = new LoginModel;
        $this->session = new Session;

        $this->startLogin();
    }

    public function startLogin()
    {
        if ($this->checkFields_isset())
        {
            if ($this->checkFields_notEmpty())
            {
                $this->getFields();         
                $this->user_id = $this->getUserID($this->user_email);
                
                if ($this->checkPassword($this->user_id))
                {
                    $this->user_info = $this->session->getUserInfo($this->user_id);
                    
                    $this->msg = "succ_login";
                }
                else
                {
                    $this->msg = "err_pass_or_email";
                }
            }
            else
            {
                $this->msg = "err_empty_fields";
            }
        }
    }
    
    public function getUserId($user_email)
    {
        return $this->loginModel->getUserId($user_email);
    }
    
    public function checkFields_isset()
    {
        if (isset($_POST['user_email']) && isset($_POST['user_password']))
        {
            return TRUE;
        }
        else
        {
            return FALSE;
        }
    }
    
    public function checkFields_notEmpty()
    {
        if (!empty($_POST['user_email']) && !empty($_POST['user_password']))
        {
            return TRUE;
        }
        else
        {
            return FALSE;
        }
    }
    
    public function getFields()
    {
        $this->user_email = $_POST['user_email'];
        $this->user_password = $_POST['user_password'];
        return TRUE;
    }
    
    public function checkPassword($user_id)
    {
        if (md5($this->user_password) == $this->loginModel->getUserPassword($user_id))
        {
            return TRUE;
        }
        else
        {
            return FALSE;
        }
    }

}

$obj_Login = new Login;
$template = $obj_Login->template;
if (!empty($obj_Login->user_info))
{
    foreach ($obj_Login->user_info as $key => $value)
    {    
        $_SESSION[$key] = $value;
    }
}
$msg = $obj_Login->msg;
