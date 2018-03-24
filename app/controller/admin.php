<?php

namespace App\Controllers;

use App\Models\Admin as AdminModel;
//print_r($_POST);
include DIR_MODEL . $controller . ".php";

class Admin
{
    public $template = DIR_VIEW_ADMIN."admin";
    public $adminModel;
    
    public function __construct()
    {
        $this->adminModel = new AdminModel;
        
        $this->arr_categories = $this->adminModel->getCategories_info();
        $this->arr_brands = $this->adminModel->getBrands_info();
        
        if ($_SESSION['authorized'] == 'admin')
        {
            switch ($_POST['edit_id'])
            {
                case 1:
                    if ($_POST['type'] == 0) {$this->showCategory_editPage();}
                    else {$this->showCategory_addPage();}
                    break;
                case 2:
                    if ($_POST['type'] == 0) {$this->showProduct_editPage();}
                    else {$this->showProduct_addPage();}
                    break;
                case 3:
                    if ($_POST['type'] == 0) {$this->showUser_editPage();}
                    else {$this->showUser_addPage();}
                    break;
            } 
        }
        else
        {
            $this->template="default/errors/404";
        }
    }
    
    public function showCategory_editPage()
    {
        $this->template = DIR_VIEW_ADMIN."re_category";
        
        $this->categories_info = $this->adminModel->getCategories_info();
               
        if (isset($_GET['del']) && !empty($_GET['del']))
        {
            $this->adminModel->deleteCategory($_GET['del']);
        }
        if (isset($_GET['edit']) && !empty($_GET['edit']))
        {
            $this->template = DIR_VIEW_ADMIN."category_edit";
            $this->category_id = $_GET['edit'];
            
            $this->category_info = $this->adminModel->getCategory_info($this->category_id);

            if (isset($_POST['isEditing']))
            {
                $path = "img\\category_images\\";
                $id = $this->category_id;
                $category_image = $this->uploadImage($path, $id);
                
                if (!empty($category_image))
                {
                    $_POST['category_image'] = $category_image;
                }
                
                $this->adminModel->updateCategory($_POST);
            }
        }  
    }

    public function showCategory_addPage()
    {
        $this->template = DIR_VIEW_ADMIN."category_add";

        if (isset($_POST['isAdding']))
        {
            $path = "img\\category_images\\";
            $id = time();
            $category_image = $this->uploadImage($path, $id);
            
            if (!empty($category_image))
            {
                $_POST['category_image'] = $category_image;
            }
            
            $inserted_id = $this->adminModel->insertCategory($_POST);
            
            $alias = strtolower(str_replace(' ', '_', $_POST['category_name']));
            $this->adminModel->DB_Insert("INSERT INTO url_alias(url,alias) VALUES('category_id=$inserted_id','$alias')");
        }
    }
    
    public function showProduct_editPage()
    {
        $this->template = DIR_VIEW_ADMIN."re_product";
        
        $this->products_info = $this->adminModel->getProducts_info();
               
        if (isset($_GET['del']) && !empty($_GET['del']))
        {
            $this->adminModel->deleteProduct($_GET['del']);
        }
        if (isset($_GET['edit']) && !empty($_GET['edit']))
        {
            $this->template = DIR_VIEW_ADMIN."product_edit";
            $this->product_id = $_GET['edit'];
            
            $this->ptc_category_id = $this->adminModel->getProductToCategories_info($this->product_id);
            $this->product_info = $this->adminModel->getProduct_info($this->product_id);
            
            if (isset($_POST['isEditing']))
            {
                $path = "img\\product_images\\";
                $id = $this->product_id;
                $product_image = $this->uploadImage($path, $id);
                
                if (!empty($product_image))
                {
                    $_POST['product_image'] = $product_image;
                }
                 $this->adminModel->insertProductToCategory($this->product_id, $_POST['category_id']);
                $this->adminModel->updateProduct($_POST);
            }
        }  
    }

    public function showProduct_addPage()
    {
        $this->template = DIR_VIEW_ADMIN."product_add";

        if (isset($_POST['isAdding']))
        {
            $path = "img\\product_images\\";
            $id = time();
            $product_image = $this->uploadImage($path, $id);
            
            
            if (!empty($product_image))
            {
                $_POST['product_image'] = $product_image;
            }
            
            $inserted_id = $this->adminModel->insertProduct($_POST);
            $this->adminModel->insertProductToCategory($inserted_id, $_POST['category_id']);
            
            $alias = strtolower(str_replace(' ', '_', $_POST['product_name']));
            $this->adminModel->DB_Insert("INSERT INTO url_alias(url,alias) VALUES('product_id=$inserted_id','$alias')");
        }
    }
    
    /*
    public function showUser_editPage()
    {
        
    }
    public function showUser_addPage()
    {
        
    }*/
    
    public function uploadImage($_path, $_id)
    {
        $image_name = "";
        
        if(is_uploaded_file($_FILES['image']['tmp_name']))
        {
            $uploaded_file_name = $_FILES['image']['name'];
            $uploaded_file_extention = substr($uploaded_file_name, strrpos($uploaded_file_name, '.') + 1);
            $uploaded_file_size = $_FILES['image']['size'];
            if (preg_match("#(png|jpg|gif)#", $uploaded_file_extention))
            {
                if ($uploaded_file_size < IMAGE_MAX_SIZE)
                {
                    
                    $dir_upload = $_path;
                    $image_name = md5($_id . time()) . ".$uploaded_file_extention";
                    $image_path = $dir_upload . $image_name;
                    
                    if (move_uploaded_file($_FILES['image']['tmp_name'], $image_path))
                    {
                        $this->msg = "succ_image_upl";
                        return $image_name;                    
                    }
                }
                else
                {
                    $this->msg = "err_image_size";
                }
            }
            else
            {
                $this->msg = "err_not_image";
            }
        }
    }
}

$obj_Admin = new Admin;

$template = $obj_Admin->template;
$arr_categories = $obj_Admin->arr_categories;
$arr_brands = $obj_Admin->arr_brands;
$ptc_category_id = $obj_Admin->ptc_category_id;

$categories_info = $obj_Admin->categories_info;
$category = $obj_Admin->category_info;

$products_info = $obj_Admin->products_info;
$product = $obj_Admin->product_info;

$msg = $obj_Admin->msg;