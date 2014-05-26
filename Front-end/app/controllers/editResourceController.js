app.controller('editResourceController', function ($rootScope, $scope, $routeParams, $timeout, Restangular, cleanUrlFilter) {
	$timeout(function() {
		$rootScope.successAlert = new String();
		$rootScope.dangerAlert = new String();
	}, 100);

	// Set page title.
	$scope.pageTitle = 'Redigera resurs';

	// Get all resource types.
	var baseResource = Restangular.one('resources', $routeParams.id);
	baseResource.get().then(function (resource) {
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

	// Get all tags.
	var baseTags = Restangular.one('resources', $routeParams.id);
	baseTags.getList('tags').then(function (tags) {
		// Initiate arrays.
		$scope.originalTags = [];
		$scope.originalTags.simple = [];
		$scope.tags = [];

		// Add values.
		for (var i = 0; i < tags.length; i++) {
			$scope.originalTags.push(tags[i]);
			$scope.originalTags.simple.push(tags[i].data.tag);
			$scope.tags.push(tags[i].data.tag);
		};
	});

	/**
	 * Adds the tag to the DOM.
	 * By first verifying that the user has entered
	 * something but whitespaces and then checking if the
	 * tag has already been added we then proceed to
	 * actually push it to the model.
	 * @param {Object} tag
	 */
	$scope.addTag = function (tag) {
		if (typeof tag !== 'undefined' && tag.trim().length > 0) {
			// Loop through all the current tags and search for a duplicate.
			for (var i = 0; i < $scope.tags.length; i++) {
				if ($scope.tags[i].toLowerCase().trim() === tag.toLowerCase().trim()) {
					return;
				}
			}

			// If we haven't returned yet we can safely add the new tag.

			// Add it to the array.
			$scope.tags.push(tag);

			console.log($scope.tags);

			// Clear the input.
			document.getElementById('tag-add-input').value = '';
		}
	};

	/**
	 * Removes the tag from the DOM.
	 * @param  {Object} tag
	 * @return {Void}
	 */
	$scope.removeTag = function (tag) {
		// Get the index.
		var index = $scope.tags.indexOf(tag);

		// Remove the entry.
		$scope.tags.splice(index, 1);
	};

	/**
	 * Saves the resource to the API.
	 * @param  {Object} resource
	 * @return {Void}
	 */
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
	 				$rootScope.successAlert = new String();
					$rootScope.dangerAlert = new String();

					// Set success message.
	 				$rootScope.successAlert = 'Resursen sparades.';
	 			}

	 			else {
	 				// Remove previous.
					$rootScope.successAlert = new String();
					$rootScope.dangerAlert = new String();

	 				// Set fail message.
	 				$rootScope.dangerAlert = 'Ett fel uppstod när resursen sparades.';
	 			}
	 		}, 100);
		});

		// Process tags.
		if ($scope.tags.length > 0) {
			// Loop through all the tags to try and find any new ones.
			for (var i = 0; i < $scope.tags.length; i++) {
				// If the tag exists in both array it means it
				// hasn't been removed or is newly added and we can continue.
				if ($scope.originalTags.simple.indexOf($scope.tags[i]) !== -1) {
					continue;
				}

				else {
					Restangular.one('resources', $routeParams.id).post('tags', { 'tag': $scope.tags[i] }, {}, { 'Authorization': 'Basic ' + $rootScope.token });
				}
			}

			// Loop through all original tags to try and find any deleted ones.
			for (var i = 0; i < $scope.originalTags.length; i++) {
				// If the tag exists in both array it means it
				// hasn't been removed or is newly added and we can continue.
				if ($scope.tags.indexOf($scope.originalTags[i].data.tag) !== -1) {
					continue;
				}

				else {
					Restangular.one('resources', $routeParams.id).one('tags', $scope.originalTags[i].data.id).remove({}, { 'Authorization': 'Basic ' + $rootScope.token });
				}
			};
		}

		
	};
});