app.factory('Auth', function ($http, storageService) {
	return {
		login: function (credentials) {
			return $http
				.post('http://localhost:3000/api/v1/login?format=json', credentials, {headers: {'Token': 'yM23lMC-NU_pSpRaNJjmdQ'}})
				.then(function (result) {
					storageService.set('Auth.userId', result.data.data.userId);
					storageService.set('Auth.token', result.data.data.token);
				});
		},

		logout: function () {
			storageService.remove('Auth.userId');
			storageService.remove('Auth.token');
		},

		isAuthenticated: function () {
			return storageService.exists('Auth.userId');
		}
	};
});