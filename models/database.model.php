<?php
/** 
*
* @PHP MVC Framework "application/database.php"
* @versi�n: 0.1      @modificado: 10 de Septiembre del 2013
* @autor: PiLMee GaTes (@pilmee)
* @descripcion: Clase Database que hereda de la clase abs PDO.
*
**/

 define("DATABASE_DRIVER", getenv("DB_DRIVER") ?: "pgsql");
    define("DATABASE_HOST",   getenv("DB_HOST")   ?: "localhost");
    define("DATABASE_PORT",   getenv("DB_PORT")   ?: "5432");
    define("DATABASE_NAME",   getenv("DB_NAME")   ?: "sgsi");
    define("DATABASE_USER",   getenv("DB_USER")   ?: "postgres");
    define("DATABASE_PASSWORD", getenv("DB_PASSWORD") ?: "pilmee");

class Database extends PDO{

    public function __construct(){
	parent::__construct(DATABASE_DRIVER.":host=".DATABASE_HOST.";port=".DATABASE_PORT.";dbname=".DATABASE_NAME, DATABASE_USER, DATABASE_PASSWORD);
    }
    
}