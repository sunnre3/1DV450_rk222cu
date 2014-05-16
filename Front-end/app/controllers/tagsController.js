app.controller('tagsController', function (cleanUrlFilter, $scope, $routeParams, $location, Restangular) {

	$scope.currentPage = $scope.currentPage || 1;

	$scope.setPage = function() {
		var tagBase = Restangular.one('tags', $routeParams.id);

		// Set page title.
		tagBase.get().then(function(tag) {
			$scope.pageTitle = tag.data.tag;
		})

		// Get the resources connected to the tag.
		tagBase.getList('resources', { page: $scope.currentPage }).then(function(resources) {
			// Set resources.
			$scope.resources = resources;

			// Set up pagination.
			$scope.numPerPage = resources.pagination.perPage;
			$scope.noOfPages = resources.pagination.totalPages;
			$scope.currentPage = resources.pagination.currentPage;
		})
	};

	$scope.$watch( 'currentPage', $scope.setPage );

	console.log($scope);

});