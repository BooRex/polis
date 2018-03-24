<?php

namespace App\Models;

use App\Libs\Database as Database;

class User extends Database
{  
    public function updateUser_image($user_id, $user_image_name)
    {
        $query = "UPDATE user SET user_image = '$user_image_name' WHERE user_id = $user_id";

        return $this->DB_Update($query);
    }
    public function updateUser_password($user_id, $new_password)
    {      
        $query = "UPDATE user SET user_password = '$new_password' WHERE user_id = $user_id";
        
        return $this->DB_Update($query);
    }
    public function getUser_password($user_id)
    {
        $query = "SELECT user_password FROM user WHERE user_id = '$user_id'";
        $query_result = $this->DB_GetOneLine($query);
        
        return $query_result['user_password'];
    }
}
