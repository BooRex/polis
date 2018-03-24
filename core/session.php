<?php

namespace App\Libs;

use App\Libs\Database as Database;

class Session extends Database
{
    public function getUserInfo($user_id)
    {
        $this->user_info = $this->DB_GetOneLine("SELECT * FROM user WHERE user_id = '" . $user_id . "'");
        
        if ($this->checkUser_isAdmin($user_id))
        {
            switch ($this->checkUser_adminLevel($user_id))
            {
                case 1: 
                    $this->user_type = "manager";
                    break;
                case 2:
                    $this->user_type = "admin";
                    break;    
            }
        }
        else
        {
            $this->user_type = "user";
        }
        
        $this->user_info = 
        [
            'authorized' => $this->user_type,
            'user_id' => $user_id,
            'user_email' => $this->user_info['user_email'],
            'user_first_name' => $this->user_info['user_first_name'],
            'user_last_name' => $this->user_info['user_last_name'],
            'user_image' => $this->user_info['user_image'],
            'cart' => []
        ];
        return $this->user_info;
    }
    
    private function checkUser_adminLevel($user_id)
    {
        $query = "SELECT admin_level FROM admin WHERE user_id = '$user_id'";
        
        $query_result = $this->DB_GetOneLine($query);
        return $query_result['admin_level'];   
        
    }
    
    private function checkUser_isAdmin($user_id)
    {
        $query = "SELECT COUNT(admin_id) as count FROM admin WHERE user_id = '$user_id'";
        
        $query_result = $this->DB_GetOneLine($query);
        if ($query_result['count'] != 0)
        {
            return TRUE;
        }
        else
        {
            return FALSE;
        } 
    }
}
