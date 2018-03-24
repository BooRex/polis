<?php
    namespace App\Models;

    use App\Libs\Database as Database;
    
    class Product extends Database
    {
        public function getProduct_info($product_id)
        {
            return $this->DB_GetOneLine("SELECT * FROM products WHERE product_id=$product_id");
        }
        
        public function getProduct_brandName($brand_id)
        {
            $res = $this->DB_GetOneLine("SELECT brand_name FROM brands WHERE brand_id=$brand_id");
            
            return $res['brand_name'];
        }
        public function getProduct_Link($product_id)
        {
            $res = $this->DB_GetOneLine("SELECT alias FROM url_alias WHERE url = 'product_id=$product_id'");
            if (isset($res['alias']) && !empty($res['alias']))
            {
                return $res['alias'];
            }
            else
            {
                return FALSE;
            }
        }

    }   
    
