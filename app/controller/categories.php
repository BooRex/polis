<?php

namespace App\Controllers;

use App\Models\Categories as CategoriesModel;

include DIR_MODEL . $controller . ".php";

class Categories
{

    // -- DEF template is already installed by CONTROLLER
    public $template = "categories";
    public $categoriesModel;
    public $categories_info;
    public $category_info;

    public function __construct()
    {
        $this->categoriesModel = new CategoriesModel;

        if (isset($_REQUEST['method']) && $_REQUEST['method'] == 'ajax')
        {
            // FOR AJAX
            $id = $_POST['product_id'];
            $cart = $_SESSION['cart'];

            array_push($cart, $id);

            $_SESSION['cart'] = $cart;
            echo "Продукт с id - $id<br>";
        }
        // -- if category DEFINED -> show this category PRODUCTS
        if (isset($_POST['category_id']))
        {
            $this->category_id = $_POST['category_id'];
            $this->showProducts($this->category_id);
        }
        else // -- Then show all categories
        {
            $this->showCategories();
        }
    }

    public function showProducts($category_id)
    {
        // -- Change DEF template is [TEMPLATE_NAME]
        $this->template = 'category_products';

        // -- Get Products from this category
        $products_array = [];
        $products_array = $this->categoriesModel->getCategory_Products($category_id);
        $this->products_info = [];
        if (!empty($products_array))
        {
            foreach ($products_array as $p_a)
            {
                $this->products_info[] = 
                [
                    'product_id' => $p_a['product_id'],
                    'product_name' => $p_a['product_name'],
                    'product_price' => $p_a['product_price'],
                    'product_text' => $p_a['product_text_small'],
                    'product_link' => "/product/" . $this->categoriesModel->getProduct_Link($p_a['product_id']),
                    'product_image' => $p_a['product_image']
                ];
            }       
        }      
    }

    public function showCategories()
    {
        // -- Get list of the categories
        $this->categories_array = $this->categoriesModel->getCategories();
        // -- Create and write small array for VIEW about categories
        $this->categories_info = [];
        foreach ($this->categories_array as $this->c_a)
        {
            $this->categories_info[] = 
            [
                'category_name' => $this->c_a['category_name'],
                'category_text' => $this->c_a['category_text_small'],
                'category_link' => "categories/" . $this->categoriesModel->getCategory_Link($this->c_a['category_id']),
                'category_image' => $this->c_a['category_image']
            ];
        }
    }

}

// END CLASS

$obj_Categories = new Categories;

$template = $obj_Categories->template;

if ($template != "categories")
{
    $products = $obj_Categories->products_info;
}
else
{
    $categories = $obj_Categories->categories_info;
}