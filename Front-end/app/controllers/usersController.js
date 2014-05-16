app.controller('usersController', function (cleanUrlFilter, $scope, $routeParams, $location, Restangular) {

	$scope.currentPage = $scope.currentPage || 1;

	$scope.setPage = function() {
		var userBase = Restangular.one('users', $routeParams.id);

		// Set page title.
		userBase.get().then(function(user) {
			$scope.pageTitle = 'Resurser av ' + user.data.firstname + ' ' + user.data.surname;
		})

		// Get the resources connected to the tag.
		userBase.getList('resources', { page: $scope.currentPage }).then(function(resources) {
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