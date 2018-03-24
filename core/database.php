<?php
namespace App\Libs;

class Database
{
    public $db;
    
    public function __construct()
    {
        $this->db = mysqli_connect(HOST,USER,PASSWORD,DATABASE);

        if(!$this->db){
            exit ("ERROR. DB hasn't connected.");
        }
        if(!mysqli_select_db($this->db, DATABASE)){
            exit ("ERROR. Table not found.!");
        }
        return $this->db;
    }
    
    public function DB_GetSomeLines($sql)
    {
        $res = mysqli_query($this->db, $sql); 
        if(!$res)
        {
            return array();
        }
        else
        {
            while ($row = mysqli_fetch_assoc($res)) 
            {
                $res_row[] = $row;
            }
        }
        return $res_row;
    }
    public function DB_GetOneLine($sql)
    {
        $res = mysqli_query($this->db, $sql); 
        if(!$res)
            {
            return array();
        }
        else
        {
            return mysqli_fetch_assoc($res);
        }
    }  
    
    public function DB_Insert($sql)
    {
        $res = mysqli_query($this->db, $sql); 
        if(!$res)
        {
            return FALSE;
        }
        else
        {
            return $this->db->insert_id;
        }
    }  
    
    // -- Update table in DB by SQL-query
    public function DB_Update($sql)        
    {
        $res = mysqli_query($this->db, $sql); 
        if(!$res)
        {
            return FALSE;
        }
        else
        {
            return TRUE;
        }
    }  
    
    public function DB_Delete($sql)        
    {
        $res = mysqli_query($this->db, $sql); 
        if(!$res)
        {
            return FALSE;
        }
        else
        {
            return TRUE;
        }
    } 
    
    public function DB_checkInjections_isset($field)
    {
        return htmlentities(mysqli_real_escape_string($this->db, $field));
    }
}