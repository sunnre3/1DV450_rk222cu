app.controller('resourceTypesController', function (literalResourceTypeFilter, $scope, $routeParams, $location, Restangular) {

	$scope.currentPage = $scope.currentPage || 1;

	$scope.setPage = function() {
		var resourceTypeBase = Restangular.one('resource_types', $routeParams.id);

		// Set page title.
		resourceTypeBase.get().then(function(resourceType) {
			$scope.pageTitle = literalResourceTypeFilter(resourceType.data.type, true);
		})

		// Get the resources connected to the resource type.
		resourceTypeBase.getList('resources', { page: $scope.currentPage }).then(function(resources) {
			// Set resources.
			$scope.resources = resources;

			// Set up pagination.
			$scope.numPerPage = resources.pagination.perPage;
			$scope.noOfPages = resources.pagination.totalPages;
			$scope.currentPage = resources.pagination.currentPage;
		})
	};

	$scope.$watch( 'currentPage', $scope.setPage );
	
});