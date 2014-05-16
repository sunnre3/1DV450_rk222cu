app.controller('resourcesController', function ($rootScope, $scope, $routeParams, $location, Restangular) {
	
	$scope.pageTitle = 'Senaste resurserna';

	$scope.currentPage = $routeParams.page || $scope.currentPage || 1;

	$scope.setPage = function() {
		var baseResources = Restangular.all('resources');
		baseResources.getList({ page: $scope.currentPage }).then(function(resources) {
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