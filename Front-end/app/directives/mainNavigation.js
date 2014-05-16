app.directive('mainNavigation', function ($filter, $location, Restangular) {
	return {
		restrict: 'E',
		scope: {

		},
		templateUrl: 'app/directives/templates/mainNavigation.html',
		replace: true,
		link: function (scope) {
			// Retrieve all types of resources so we can build a menu.
			var baseResourceTypes = Restangular.all('resource_types');
			baseResourceTypes.getList().then(function(resourceTypes) {
				scope.resourceTypes = resourceTypes;
			});

			var baseLicences = Restangular.all('licences');
			baseLicences.getList().then(function(licences) {
				scope.licences = licences;
			});

			scope.doSearch = function (term) {
				$location.url('/search/' + term);
			};
		}
	};
});