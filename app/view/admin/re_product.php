<div class="content__admin">
<?php
foreach ($products_info as $product)
{
    echo "<a class='admin__item-name' href='?edit=" . $product['product_id'] . "'>" . $product['product_name'] . "</a> ";
    echo "<a class='admin__item-del' href='?del=" . $product['product_id'] . "'>Удалить</a><br>";
}
?>
<a class="admin__item-add" href="add_product">Добавить новый продукт</a>
</div>