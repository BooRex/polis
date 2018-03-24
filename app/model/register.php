<?php

namespace App\Models;

use App\Libs\Database as Database;

class Register extends Database
{
    public function checkEmail_notIsset($user_email)
    {
        $query = "SELECT COUNT(user_id) AS count FROM user WHERE user_email = '$user_email'";

        $query_array = $this->DB_GetOneLine($query);

        if ($query_array['count'] != 0)
        {
            return FALSE;
        }
        else
        {
            return TRUE;
        }
    }

    public function insertData($user_first_name, $user_last_name, $user_email, $user_password)
    {
        $query = "INSERT INTO user(user_first_name, user_last_name, user_email, user_password, user_reg_date) VALUES ('$user_first_name','$user_last_name','$user_email','$user_password',NOW())";
        $insert_result = $this->DB_Insert($query);
        if ($insert_result)
        {
            return TRUE;
        }
        else
        {
            return FALSE;
        }
    }

}
