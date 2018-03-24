<?php

namespace App\Controllers;

use App\Models\Register as RegisterModel;

include DIR_MODEL . $controller . ".php";

class Register
{

    public $template = "register";
    public $registerModel;

    public function __construct()
    {
        $this->registerModel = new RegisterModel;

        $this->startRegister();
    }

    public function startRegister()
    {
        if ($this->checkFields_isset())
        {
            if ($this->checkFields_notEmpty())
            {
                $this->getFields();

                if ($this->checkFields_strLength($this->user_first_name, $this->user_last_name, $this->user_email))
                {
                    if ($this->registerModel->checkEmail_notIsset($this->user_email))
                    {
                        if ($this->checkEmail_valid($this->user_email))
                        {
                            if ($this->insertData($this->user_first_name, $this->user_last_name, $this->user_email, $this->user_password))
                            {
                                $this->msg = "succ_reg";
                            }
                            else
                            {
                                $this->msg = "err_query";
                            }
                        }
                        else
                        {
                            $this->msg = "err_email_uncorrect";
                        }
                    }
                    else
                    {
                        $this->msg = "err_email_exists";
                    }
                }
                else
                {
                    $this->msg = "err_strlen";
                }
            }
            else
            {
                $this->msg = "err_empty_fields";
            }
        }
    }

    public function insertData($user_first_name, $user_last_name, $user_email, $user_password)
    {
        $insert_result = $this->registerModel->insertData($user_first_name, $user_last_name, $user_email, $user_password);
        return $insert_result;
    }

    public function checkFields_isset()
    {
        if (isset($_POST['user_first_name']) && isset($_POST['user_last_name']) && isset($_POST['user_email']) && isset($_POST['user_password']))
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
        if (!empty($_POST['user_first_name']) && !empty($_POST['user_last_name']) && !empty($_POST['user_email']) && !empty($_POST['user_password']))
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
        $this->user_first_name = $this->registerModel->DB_checkInjections_isset($_POST['user_first_name']);
        $this->user_last_name = $this->registerModel->DB_checkInjections_isset($_POST['user_last_name']);
        $this->user_email = $this->registerModel->DB_checkInjections_isset($_POST['user_email']);
        $this->user_password = md5($_POST['user_password']);
        return TRUE;
    }

    public function checkFields_strLength($user_first_name, $user_last_name, $user_email)
    {
        if (strlen($user_first_name) < 31 && strlen($user_last_name) < 31 && strlen($user_email) < 31)
        {
            return TRUE;
        }
        else
        {
            return FALSE;
        }
    }

    public function checkEmail_valid($email)
    {
        $pattern_email = '/^((([0-9A-Za-z]{1}[-0-9A-z\.]{1,}[0-9A-Za-z]{1})|([0-9А-Яа-я]{1}[-0-9А-я\.]{1,}[0-9А-Яа-я]{1}))@([-A-Za-z]{1,}\.){1,2}[-A-Za-z]{2,})$/u';

        if (preg_match($pattern_email, $email))
        {
            return TRUE;
        }
        else
        {
            return FALSE;
        }
    }

}

$obj_Register = new Register;
$template = $obj_Register->template;
$msg = $obj_Register->msg;
