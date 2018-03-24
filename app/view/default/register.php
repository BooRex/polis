<div class="content">
    <form action="#" method="POST">
        <p>
            <input placeholder="Имя" type="text" name="user_first_name">
        </p>
        <br>
        <p>
            <input placeholder="Фамилия" type="text" name="user_last_name">
        </p>
        <br>
        <p>
            <input placeholder="Почта" type="text" name="user_email">
        </p>
        <br>
        <p>
            <input placeholder="Пароль" type="password" name="user_password">
        </p>
        <br>
        <p>
            <input type="submit" value="Зарегистрироваться">
        </p>
        <br>
        <p>
            <a class="btn_back" href="<?php echo $_SERVER['HTTP_REFERER']; ?>">Назад</a>
        </p>
    </form>
</div>