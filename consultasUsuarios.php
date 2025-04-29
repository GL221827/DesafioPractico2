<?php
include_once 'Models/UsuariosModel.php';

$model= new UsuariosModel();

$usuario=[
    'nombre_'=>"Jose",
    'apellido'=>"Ramos",
    'telefono'=>"6035-6092",
    'correo'=>"joseramos@admin.com",
    'contra'=>"admin01",
    'id_tipo_usuario'=>"1"

];
echo $model->insertUser($usuario);
//echo $model->deleteProducto('PROD00010');
//$model->updateProducto($producto);
//cho $model->deleteUser('1');

//var_dump($model->getUser('1'));