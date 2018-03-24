<ul>
<?php
foreach ($categories_info as $category)
{
    echo "<a class='admin__item-name' href='?edit=" . $category['category_id'] . "'>" . $category['category_name'] . "</a> ";
    echo "<a class='admin__item-del' href='?del=" . $category['category_id'] . "'>Удалить</a><br>";
}
?>
</ul>
<a class="admin__item-add" href="add_category">Добавить новую категорию</a>