app.controller('logoutController', function ($rootScope, $location, $timeout, AUTH_EVENTS, Auth) {
	Auth.logout();

	// Set logout message.
	$rootScope.successAlert = 'Du har nu blivit utloggad.';

	// Set timer for getting the message removed.
	$timeout(function() {
		jQuery('div.alert').effect('fade', 'swing', 500);
		$rootScope.successAlert = new String();
	}, 2000);

	// Unset rootScope.
	$rootScope.isAuthenticated = false;
	$rootScope.userId = new String();
	$rootScope.token = new String();

	// Redirect to front-page.
	$location.url('/');
});