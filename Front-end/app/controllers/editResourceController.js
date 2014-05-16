app.controller('editResourceController', function ($rootScope, $scope, $routeParams, $timeout, Restangular, cleanUrlFilter) {
	$timeout(function() {
		$rootScope.successAlert = new String();
		$rootScope.dangerAlert = new String();
	}, 100);

	// Set page title.
	$scope.pageTitle = 'Redigera resurs';

	// Get all resource types.
	var baseResource = Restangular.one('resources', $routeParams.id);
	baseResource .get().then(function (resource) {
		$scope.resource = {
			name: resource.data.name,
			description: resource.data.description,
			url: resource.data.url
		};

		// Get the resource type.
		var resourceType = Restangular.oneUrl('users', cleanUrlFilter(resource.links.resourceType) + '?format=json');
		resourceType.get().then(function(data) {
			$scope.resource.resource_type_id = data.data.id;
		});

		// Get the licence.
		var licence = Restangular.oneUrl('users', cleanUrlFilter(resource.links.licence) + '?format=json');
		licence.get().then(function(data) {
			$scope.resource.licence_id = data.data.id;
		});
	});

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

		var request = jQuery.ajax({
			url: 'http://localhost:3000/api/v1/resources/' + $routeParams.id,
			type: 'PUT',
			data: '?[resource]resource_type_id=' + resource.resource_type_id +
				'&[resource]user_id=' + resource.user_id +
				'&[resource]licence_id=' + resource.licence_id +
				'&[resource]name=' + resource.name +
				'&[resource]description=' + resource.description +
				'&[resource]url=' + resource.url,
			headers: {
				'Authorization': 'Basic ' + $rootScope.token,
				'Token': 'yM23lMC-NU_pSpRaNJjmdQ'
			}
		});

		request.complete(function(jqXHR) {
			$timeout(function() {
				// Set message based on failure/success.
	 			if (jqXHR.status === 200) {
	 				$timeout(function() {
						$rootScope.successAlert = new String();
						$rootScope.dangerAlert = new String();
					}, 100);

					// Set success message.
	 				$rootScope.successAlert = 'Resursen sparades.';
	 			}

	 			else {
	 				// Remove previous.
					$timeout(function() {
						$rootScope.successAlert = new String();
						$rootScope.dangerAlert = new String();
					}, 100);

	 				// Set fail message.
	 				$rootScope.dangerAlert = 'Ett fel uppstod när resursen sparades.';
	 			}
	 		}, 100);
		});

		
	};
});