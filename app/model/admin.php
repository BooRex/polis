<?php

namespace App\Models;

use App\Libs\Database as Database;

class Admin extends Database
{ 
    // -- GENERAL 
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

    // -- CATEGORY
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
        $query_del_category = "DELETE FROM categories WHERE category_id = $category_id";
        $query_del_ptc = "DELETE FROM product_to_category WHERE category_id = $category_id";
        $query_del_alias = "DELETE FROM url_alias WHERE url = 'category_id=$category_id'";
        
        $res_del_category = $this->DB_Delete($query_del_category);
        $res_del_ptc = $this->DB_Delete($query_del_ptc);
        $res_del_alias = $this->DB_Delete($query_del_alias);
        
        if ($res_del_category && $res_del_ptc && $res_del_alias)
        {
            return "succ_del_category";
        }
        else
        {
            return "err_del_category";
        }
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
        $query_del_product = "DELETE FROM products WHERE product_id = $product_id";
        $query_del_ptc = "DELETE FROM product_to_category WHERE product_id = $product_id";
        $query_del_alias = "DELETE FROM url_alias WHERE url = 'product_id=$product_id'";
        
        $res_del_product = $this->DB_Delete($query_del_product);
        $res_del_ptc = $this->DB_Delete($query_del_ptc);
        $res_del_alias = $this->DB_Delete($query_del_alias);
        
        if ($res_del_product && $res_del_ptc && $res_del_alias)
        {
            return "succ_del_product";
        }
        else
        {
            return "err_del_product";
        }
    }
    // -- USER
    public function getUsers_info()
    {
        $query = "SELECT user_id, user_first_name, user_last_name FROM user";
  
        return $this->DB_GetSomeLines($query);
    }
    public function getUser_info($user_id)
    {
        $query = "SELECT * FROM user WHERE user_id = $user_id";
        
        return $this->DB_GetOneLine($query);
    }
    public function updateUser($user)
    {
        $id = $user['user_id'];
        $email = $user['user_email'];
        $image = $user['user_image'];
        $first_name = $user['user_first_name'];
        $last_name = $user['user_last_name'];
        $status = $user['status'];
        
        $query = "UPDATE user "
                . "SET "
                . "user_email = '".$email."', "
                . "user_image = '".$image."', "
                . "user_first_name = '".$first_name."', "
                . "user_last_name = '".$last_name."', "
                . "`status` = $status "
                . "WHERE user_id = $id";
        
        return $this->DB_Update($query);
    }
    public function insertUser($user)
    {
        $email = $user['user_email'];
        $image = $user['user_image'];
        $first_name = $user['user_first_name'];
        $last_name = $user['user_last_name'];
        $password = md5($user['user_password']);
        $status = $user['status'];
        
        $query = "INSERT INTO user "
                . "SET "
                . "user_email = '".$email."', "
                . "user_image = '".$image."', "
                . "user_first_name = '".$first_name."', "
                . "user_last_name = '".$last_name."', "
                . "user_password = '".$password."', "
                . "user_reg_date = NOW(), "
                . "user_lastseen_date = NOW(), "
                . "`status` = $status ";
        
        return $this->DB_Insert($query);
    }
    public function deleteUser($user_id)
    {
        $query_del_user = "DELETE FROM user WHERE user_id = $user_id";
        
        $res_del_user = $this->DB_Delete($query_del_user);
        
        if ($res_del_user)
        {
            return "succ_del_user";
        }
        else
        {
            return "err_del_user";
        }
    }
    
}
