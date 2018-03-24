<?php

namespace App\Models;

use App\Libs\Database as Database;

class Admin extends Database
{ 
    public function getCategories_info()
    {
        $query = "SELECT category_id, category_name FROM categories";
        
        return $this->DB_GetSomeLines($query);
    }
    public function getProductToCategories_info($product_id)
    {
        $query = "SELECT product_to_category.product_id, product_to_category.category_id, categories.category_name FROM categories
        JOIN product_to_category ON product_to_category.category_id = categories.category_id
        WHERE product_id = $product_id";
        $res = $this->DB_GetOneLine($query);
        
        if (isset($res['category_id']) && !empty($res['category_id']))
        {
            return $res['category_id'];
        }
        else
        {
            return FALSE;
        }
    }
    public function getBrands_info()
    {
        $query = "SELECT brand_id, brand_name FROM brands";
        
        return $this->DB_GetSomeLines($query);
    }
    
    public function insertProductToCategory($product_id, $category_id)
    {
        $query = "INSERT INTO product_to_category(category_id,product_id) VALUES($category_id,$product_id)";
        
        return $this->DB_Insert($query);
    }

    public function getCategory_info($category_id)
    {
        $query = "SELECT * FROM categories WHERE category_id = $category_id";
        
        return $this->DB_GetOneLine($query);
    }
    public function updateCategory($category)
    {
        $id = $category['category_id'];
        $name = $category['category_name'];
        $image = $category['category_image'];
        $text_small = $category['category_text_small'];
        $seo_title = $category['category_seo_title'];
        $seo_description = $category['category_seo_description'];
        $seo_keywords = $category['category_seo_keywords'];
        $status = $category['status'];
        $sort_order = $category['sort_order'];
        
        $query = "UPDATE categories "
                . "SET "
                . "category_name = '".$name."', "
                . "category_image = '".$image."', "
                . "category_text_small = '".$text_small."', "
                . "category_seo_title = '".$seo_title."', "
                . "category_seo_description = '".$seo_description."', "
                . "category_seo_keywords = '".$seo_keywords."', "
                . "`status` = $status ,"
                . "sort_order = $sort_order "
                . "WHERE category_id = $id";

        return $this->DB_Update($query);
    }
    public function insertCategory($category)
    {
        $image = $category['category_image'];
        $name = $category['category_name'];
        $text_small = $category['category_text_small'];
        $seo_title = $category['category_seo_title'];
        $seo_description = $category['category_seo_description'];
        $seo_keywords = $category['category_seo_keywords'];
        $status = $category['status'];
        $sort_order = $category['sort_order'];
        
        $query = "INSERT INTO categories "
                . "SET "
                . "category_name = '".$name."', "
                . "category_image = '".$image."', "
                . "category_text_small = '".$text_small."', "
                . "category_seo_title = '".$seo_title."', "
                . "category_seo_description = '".$seo_description."', "
                . "category_seo_keywords = '".$seo_keywords."', "
                . "`status` = $status ,"
                . "sort_order = $sort_order ";
        
        return $this->DB_Insert($query);
    }
    public function deleteCategory($category_id)
    {
        $query = "DELETE FROM categories WHERE category_id = $category_id";
        
        return $this->DB_Delete($query);
    }
    // -- PRODUCT
    public function getProducts_info()
    {
        $query = "SELECT product_id, product_name FROM products";
        
        return $this->DB_GetSomeLines($query);
    }
    public function getProduct_info($product_id)
    {
        $query = "SELECT * FROM products WHERE product_id = $product_id";
        
        return $this->DB_GetOneLine($query);
    }
    public function updateProduct($product)
    {
        $id = $product['product_id'];
        $name = $product['product_name'];
        $image = $product['product_image'];
        $brand_id = $product['product_brand_id'];
        $text_small = $product['product_text_small'];
        $text = $product['product_text'];
        $price = $product['product_price'];
        $quantity = $product['product_quantity'];
        $seo_title = $product['product_seo_title'];
        $seo_description = $product['product_seo_description'];
        $seo_keywords = $product['product_seo_keywords'];
        $status = $product['status'];
        
        $query = "UPDATE products "
                . "SET "
                . "product_name = '".$name."', "
                . "product_brand_id = $brand_id , "
                . "product_image = '".$image."', "
                . "product_text_small = '".$text_small."', "
                . "product_text = '".addslashes($text)."', "
                . "product_price = $price , "
                . "product_quantity = $quantity , "
                . "product_seo_title = '".$seo_title."', "
                . "product_seo_description = '".$seo_description."', "
                . "product_seo_keywords = '".$seo_keywords."', "
                . "`status` = $status "
                . "WHERE product_id = $id";
        
        return $this->DB_Update($query);
    }
    public function insertProduct($product)
    {
        $name = $product['product_name'];
        $image = $product['product_image'];
        $brand_id = $product['product_brand_id'];
        $text_small = $product['product_text_small'];
        $text = $product['product_text'];
        $price = $product['product_price'];
        $quantity = $product['product_quantity'];
        $seo_title = $product['product_seo_title'];
        $seo_description = $product['product_seo_description'];
        $seo_keywords = $product['product_seo_keywords'];
        $status = $product['status'];
        
        $query = "INSERT INTO products "
                . "SET "
                . "product_name = '".$name."', "
                . "product_brand_id = $brand_id , "
                . "product_image = '".$image."', "
                . "product_text_small = '".$text_small."', "
                . "product_text = '".$text."', "
                . "product_price = $price , "
                . "product_quantity = $quantity , "
                . "product_seo_title = '".$seo_title."', "
                . "product_seo_description = '".$seo_description."', "
                . "product_seo_keywords = '".$seo_keywords."', "
                . "`status` = $status ";
        
        return $this->DB_Insert($query);
    }
    public function deleteProduct($product_id)
    {
        $query = "DELETE FROM products WHERE product_id = $product_id";
        
        return $this->DB_Delete($query);
    }
    
}
