<?php

namespace App\Models;

use App\Libs\Database as Database;

class Login extends Database
{
    public function getUserID($user_email)
    {
        $query = "SELECT user_id FROM user WHERE user_email = '$user_email'";
        $query_result = $this->DB_GetOneLine($query);
        
        return $query_result['user_id'];
    }

    public function getUserPassword($user_id)
    {
        $query = "SELECT user_password FROM user WHERE user_id = '$user_id'";
        $query_result = $this->DB_GetOneLine($query);
        
        return $query_result['user_password'];
    }
}
