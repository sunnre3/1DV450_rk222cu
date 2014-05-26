app.controller('newResourceController', function ($rootScope, $scope, $location, $timeout, Restangular) {
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

	// Create a new tags array.
	$scope.tags = new Array();

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
		// Remove previous messages.
		$rootScope.successAlert = new String();
		$rootScope.dangerAlert = new String();

		// Add the user id.
		if (typeof resource !== 'undefined') {
			resource.user_id = $rootScope.userId;
		}

		// Setup request.
		var request = Restangular.all('resources').post(resource, {}, { 'Authorization': 'Basic ' + $rootScope.token });

		var resourceId;

		// Setup promise.
		request.then(function (response) {
			// Set the resource id.
			resourceId = response.data.instance.data.id;

			// If there were any tags added we need to save them aswell.
			if ($scope.tags.length > 0) {
				// Loop through them and save them.
				for (var i = 0; i < $scope.tags.length; i++) {
					// Create a request.
					Restangular.one('resources', resourceId).post('tags', { 'tag': $scope.tags[i] }, {}, { 'Authorization': 'Basic ' + $rootScope.token });
				}
			}

			// Set success message.
			$rootScope.successAlert = 'Resursen sparades.';
		}, function (response) {
			// Remove previous messages.
			$rootScope.successAlert = new String();
			$rootScope.dangerAlert = new String();
				
			// Set logout message.
			$rootScope.dangerAlert = 'Sparande av resurs misslyckades.';
		});
	};
});