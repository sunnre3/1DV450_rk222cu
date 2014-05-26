app.controller('deleteResourceController', function ($rootScope, $scope, $timeout, $route, $routeParams, $location, Restangular) {
	Restangular.one('resources', $routeParams.id).remove({}, { 'Authorization': 'Basic ' + $rootScope.token });

	// Set delete message.
	$rootScope.successAlert = 'Resursen har tagits bort.';

	// Set timer for getting the message removed.
	$timeout(function() {
		jQuery('div.alert').effect('fade', 'swing', 500);
		$rootScope.successAlert = new String();
	}, 2000);

	// Redirect to front-page.
	$location.url('/');

	// Reload the view.
	$route.reload();
});