<?php
    namespace App\Models;

    use App\Libs\Database as Database;
    
    class Categories extends Database
    {
        public function getCategories()
        {
            return $this->DB_GetSomeLines("SELECT category_id, category_name, category_text_small, category_image FROM categories WHERE status='1' ORDER BY sort_order");
        }
        
        public function getCategory_Link($category_id)
        {
            $res = $this->DB_GetOneLine("SELECT alias FROM url_alias WHERE url = 'category_id=$category_id'");
            if (isset($res['alias']) && $res['alias'])
            {
                return $res['alias'];
            }
            else
            {
                return FALSE;
            }
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
        
        public function getCategory_Products($category_id) 
        {
            return $this->DB_GetSomeLines
                    ("
                        SELECT * 
                        FROM products p
                        JOIN product_to_category ptc ON ptc.product_id = p.product_id
                        WHERE ptc.category_id = $category_id AND status='1'
                    ");
        }
    }   
    
