<?php

namespace App\Models;

use App\Libs\Database as Database;

class Main extends Database{
    
    public function eccccho() {
        echo '<pre>'; print_r('А это модель main!!!'); echo '</pre>';
    }
    
}