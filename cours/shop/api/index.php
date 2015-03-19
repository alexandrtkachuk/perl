<?php

header("Content-Type: text/html; charset=utf-8");
header("Access-Control-Allow-Origin: *"); 

$filename='shop.json';

$e=file_get_contents($filename);


if(isset($_GET['id'])===true)
{
		
	$arr=json_decode($e);
	$el;
	foreach ( $arr as $item)
	{
		if($item->id==$_GET['id'])
		{
			$el=$item;
			break;
		}
	}
	
	//$el=$arr[$_GET['id']];
	
	
	
	
	//echo array_search('green', )
	
	//print_r($arr);
	$e=json_encode($el);
	
	
}
 

echo $e;  

/*
print_r(json_decode($e));

$test= array();

$test['name']='sasha';
$test['age']=21;

print_r(json_encode($test));
*/
