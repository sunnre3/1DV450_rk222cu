app.controller('licencesController', function ($scope, $routeParams, $location, Restangular) {

	$scope.currentPage = $scope.currentPage || 1;

	$scope.setPage = function() {
		var licencesBase = Restangular.one('licences', $routeParams.id);

		// Set page title.
		licencesBase.get().then(function(licence) {
			$scope.pageTitle = licence.data.licence_type;
		})

		// Get the resources connected to the licence.
		licencesBase.getList('resources', { page: $scope.currentPage }).then(function(resources) {
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