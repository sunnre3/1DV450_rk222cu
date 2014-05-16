app.controller('newResourceController', function ($rootScope, $scope, $timeout, Restangular) {
	$timeout(function() {
		$rootScope.successAlert = new String();
		$rootScope.dangerAlert = new String();
	}, 100);


	// Set page title.
	$scope.pageTitle = 'Skapa ny resurs';

	// Get all resource types.
	var baseResourceTypes = Restangular.all('resource_types');
	baseResourceTypes.getList().then(function (resourceTypes) {
		$scope.resourceTypes = resourceTypes;
	});

	// Get all licences.
	var baseLicences = Restangular.all('licences');
	baseLicences.getList().then(function (licences) {
		$scope.licences = licences;
	});

	// Function to save.
	$scope.save = function (resource) {
		// Add the user id.
		resource.user_id = $rootScope.userId;

		// Setup request.
		var request = Restangular.all('resources').post(resource, {}, { 'Authorization': 'Basic ' + $rootScope.token });

		// Setup promise.
		request.then(function (response) {
			// Remove previous.
			$timeout(function() {
				$rootScope.successAlert = new String();
				$rootScope.dangerAlert = new String();
			}, 100);


			// Set logout message.
			$rootScope.successAlert = 'Resursen sparades.';
		}, function (response) {
			// Remove previous.
			$timeout(function() {
				$rootScope.successAlert = new String();
				$rootScope.dangerAlert = new String();
			}, 100);
			
			// Set logout message.
			$rootScope.dangerAlert = 'Sparande av resurs misslyckades.';
		});
	};
});