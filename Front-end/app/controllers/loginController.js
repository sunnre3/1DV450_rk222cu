app.controller('loginController', function ($scope, $rootScope, $location, $timeout, AUTH_EVENTS, Auth, storageService) {
	$scope.pageTitle = 'Logga in';

	// Don't set on load.
	$scope.credentials = {
		email: '',
		password: ''
	};

	// Login function.
	$scope.login = function (credentials) {
		Auth.login(credentials).then(function () {
			$rootScope.$broadcast(AUTH_EVENTS.loginSuccess);
		}, function () {
			$rootScope.$broadcast(AUTH_EVENTS.loginFailed);
		});
	};

	$scope.$on(AUTH_EVENTS.loginSuccess, function () {
		$scope.authenticationSuccess = true;
		$rootScope.isAuthenticated = true;
		$rootScope.userId = storageService.get('Auth.userId');
		$rootScope.token = storageService.get('Auth.token');

		// Set logout message.
		$rootScope.successAlert = 'Du har nu blivit inloggad.';

		// Set timer for getting the message removed.
		$timeout(function() {
			jQuery('div.alert').effect('fade', 'swing', 500);
			$rootScope.successAlert = new String();
		}, 2000);

		// Redirect to front-page.
		$location.url('/');
	});
	$scope.$on(AUTH_EVENTS.loginFailed, function () {
		$scope.authenticationSuccess = false;
		$rootScope.isAuthenticated = false;
	})
});