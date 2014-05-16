app.filter('cleanUrl', function() {
	return function(input) {
		return input.split('?')[0];
	};
});