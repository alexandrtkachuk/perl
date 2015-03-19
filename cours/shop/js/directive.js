App.directive('shopHeader', function() {
  return {
      restrict: 'AE',
      replace: 'true',
      templateUrl: "partials/header.html"
  };
});

App.directive('shopProducts', function() {
	
	
	
  return {
      restrict: 'AE',
      replace: 'true',
      controller: "iControler as ic",
      templateUrl: "partials/products.html"
  };
});



App.directive('shopOneProducts', function() {
	return {
      restrict: 'AE',
      replace: 'true', 
	  templateUrl: "partials/oneProduct.html"
  };
});

