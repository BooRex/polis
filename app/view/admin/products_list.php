<table class="admin__items table">
    <thead>
        <tr>
            <th>Название</th>         
        </tr>
    </thead>
    
    <?php
    
    // -- Table filling
    foreach ($products_info as $item)
    {
        echo "<tr>";
            echo "<td class='admin__items td-name'>";
                echo "<p class='admin__item name'>" . $item['product_name'] . "</p>";
             echo "</td>";
            echo "<td>";
                echo "<a class='admin__item edit' href='?edit=" . $item['product_id'] . "'><img width='".IMG_RESOLUTION_ADMIN_BTN."' height='".IMG_RESOLUTION_ADMIN_BTN."' src='".DIR_ADMIN_IMG."edit_pencil.png"."'></a> ";
            echo "</td>";
            echo "<td>";
                echo "<a class='admin__item delete' href='?del=" . $item['product_id'] . "'><img width='".IMG_RESOLUTION_ADMIN_BTN."' height='".IMG_RESOLUTION_ADMIN_BTN."' src='".DIR_ADMIN_IMG."delete_cross.png"."'></a>";
            echo "</td>";
        echo "</tr>";
    }
    ?>
    
</table>
<a class="admin__item add" href="product_add">Добавить новый продукт</a>