<?php
include_once 'Models/ProductosModel.php';

$model= new ProductosModel();

$categoria=[
    
    'categoria' => 'CUERO'
];

$producto=[
    'codigo_producto'=>"PROD00003",
    'nombre_producto'=>"Bolsas Tote Bag",
    'descripcion'=>"Bolso de lona tipo tote bag, cuenta con dos bolsos internos y un cierre de velcro",
    'imagen'=>"totebag.png",
    'categoria'=>"Bolsos",
    'precio'=>"5.50",
    'existencias'=>"300"

];
//echo $model->insertProducto($producto);
echo $model->deleteCategoria('7');
//$model->updateProducto($producto);
//echo $model->insertCategoria($categoria);
//var_dump($model->getProducto('5'));