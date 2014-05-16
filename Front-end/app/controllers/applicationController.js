app.controller('applicationController', function ($rootScope, Auth, storageService) {
	if (Auth.isAuthenticated()) {
		$rootScope.isAuthenticated = Auth.isAuthenticated();
		$rootScope.userId = storageService.get('Auth.userId');
		$rootScope.token = storageService.get('Auth.token');
	}

	else {
		$rootScope.isAuthenticated = false;
	}
});