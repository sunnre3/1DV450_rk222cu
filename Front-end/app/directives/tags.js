app.directive('tags', function (Restangular) {
	return {
		restrict: 'E',
		scope: {
			resourceId: '@'
		},
		templateUrl: 'app/directives/templates/tags.html',
		replace: true,
		link: function (scope) {
			var resource = Restangular.one('resources', scope.resourceId);
			resource.getList('tags').then(function(tags) {
				scope.tags = tags;
			});
		}
	};
});