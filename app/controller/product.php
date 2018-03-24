<?php

namespace App\Controllers;

use App\Models\Product as ProductModel;

include DIR_MODEL . $controller . ".php";

class Product
{

    // -- DEF template is already installed by CONTROLLER
    public $template = "product";
    public $productModel;
    public $product_info;

    public function __construct()
    {
        $this->productModel = new ProductModel;

        if (isset($_REQUEST['method']) && $_REQUEST['method'] == 'ajax')
        {
            // FOR AJAX
        }
        $this->product_id = $_POST['product_id'];
        $this->showProduct_info($this->product_id);
       
    }

    public function showProduct_info($product_id)
    {
        // -- Get Product info from DB
        $p_a = $this->productModel->getProduct_info($product_id);
        $this->product_info = [];
        
        if ($p_a['product_quantity'] > 0)
        {
            $p_a['product_quantity'] = "Есть в наличии";
        }
        else
        {
            $p_a['product_quantity'] = "Нет в наличии";
        }
        
        $this->product_info = 
        [
            'product_name' => $p_a['product_name'],
            'product_price' => $p_a['product_price'],
            'product_quantity' => $p_a['product_quantity'],
            'product_brand' => $this->getProduct_brandName($p_a['product_brand_id']),
            'product_text' => $p_a['product_text'],
            'product_image' => $p_a['product_image'],
            'product_seo_title' => $p_a['product_seo_title'],
            'product_seo_description' => $p_a['product_seo_description'],
            'product_seo_keywords' => $p_a['product_seo_keywords']
        ];
             
        //print_r($this->product_info);
    }
    
    public function getProduct_brandName($brand_id)
    {
        return $this->productModel->getProduct_brandName($brand_id);
    }

} // END CLASS

$obj_Product = new Product;

$template = $obj_Product->template;

$product = $obj_Product->product_info;

$title = $product['product_seo_title'];
$key = $product['product_seo_keywords'];
$desc = $product['product_seo_description'];