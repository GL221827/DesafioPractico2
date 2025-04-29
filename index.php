<?php
include_once 'Controllers/ProductosController.php';
include_once 'Controllers/UsuariosController.php';

//front controller aqui se ponen todas las peticiones
const PATH= '/DesafioPractico2';
session_start(); //iniciando la sesion de php

$url = $_SERVER['REQUEST_URI'];
$slices= explode('/', $url);
$controller=empty($slices[2])?"IndexController":$slices[2]."Controller";
$method=empty($slices[3])?"index":$slices[3];
$param=empty($slices[4])?[]:array_slice($slices,4);
$cont= new $controller;
$cont->$method($param);