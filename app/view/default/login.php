<form method="POST">
    <div class="form__content">
        <p>
            <input placeholder="Почта" type="text" name="user_email">
        </p>
        <br>
        <p>
            <input placeholder="Пароль" type="password" name="user_password">
        </p>
        <br>
        <p>
            <input type="submit" value="Войти">
        </p>
        <br>
        <p>
            <a class="btn_back" href="<?php echo $_SERVER['HTTP_REFERER']; ?>">Назад</a>
        </p>
    </div>
</form>