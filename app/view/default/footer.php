</div>
<div class="footer">
            <p class="footer__copyright">Все права защищены &copy <?php echo date("Y"); ?></p>
</div>  
<div id="cart">
    <?php 
    if (!empty($_SESSION['cart']))
    {
	    echo "Заказанные товары: ";
	    foreach ($_SESSION['cart'] as $cart) 
	    {
	        echo $cart."|"; 
	    }
    }
    ?>
</div>

</body>
</html>
