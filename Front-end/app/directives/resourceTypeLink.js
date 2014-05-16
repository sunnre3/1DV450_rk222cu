app.directive('resourceTypeLink', function (cleanUrlFilter, Restangular) {
	return {
		restrict: 'E',
		scope: {
			resourceTypeApiLink: '@'
		},
		template: '<dd><a href="#/resource_types/{{ resourceType.data.id }}">{{ resourceType.data.type }}</a></dd>',
		replace: true,
		link: function (scope) {
			var resourceType = Restangular.oneUrl('users', cleanUrlFilter(scope.resourceTypeApiLink) + '?format=json');
			resourceType.get().then(function(data) {
				scope.resourceType = data;
			});
		}
	};
});