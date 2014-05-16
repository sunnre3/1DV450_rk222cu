app.directive('userLink', function (cleanUrlFilter, Restangular) {
	return {
		restrict: 'E',
		scope: {
			userApiLink: '@'
		},
		template: '<dd><a href="#/users/{{ user.data.id }}">{{ user.data.email }}</a></dd>',
		replace: true,
		link: function (scope) {
			var user = Restangular.oneUrl('users', cleanUrlFilter(scope.userApiLink) + '?format=json');
			user.get().then(function(data) {
				scope.user = data;
			});
		}
	};
});