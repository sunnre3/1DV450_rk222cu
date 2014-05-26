// Define the app and include ngRoutes for routing and ngAnimate for animations.
var app = angular.module('app', ['ngRoute', 'ngAnimate', 'restangular', 'ui.bootstrap.pagination'])
.config(function ($routeProvider, RestangularProvider) {
	// Root.
	$routeProvider.when('/', {
		controller: 'resourcesController',
		templateUrl: 'app/partials/resources/collection.html'
	}).
	when('/resource_types/:id', {
		controller: 'resourceTypesController',
		templateUrl: 'app/partials/resources/collection.html'
	}).
	when('/licences/:id', {
		controller: 'licencesController',
		templateUrl: 'app/partials/resources/collection.html'
	}).
	when('/tags/:id', {
		controller: 'tagsController',
		templateUrl: 'app/partials/resources/collection.html'
	}).
	when('/users/:id', {
		controller: 'usersController',
		templateUrl: 'app/partials/resources/collection.html'
	}).
	when('/login', {
		controller: 'loginController',
		templateUrl: 'app/partials/authentication/login.html'
	}).
	when('/logout', {
		controller: 'logoutController',
		template: ''
	}).
	when('/new', {
		controller: 'newResourceController',
		templateUrl: 'app/partials/resources/form.html'
	}).
	when('/edit/:id', {
		controller: 'editResourceController',
		templateUrl: 'app/partials/resources/form.html'
	}).
	when('/delete/:id', {
		controller: 'deleteResourceController',
		template: ''
	}).
	when('/search/:term', {
		controller: 'searchController',
		templateUrl: 'app/partials/resources/collection.html'
	}).
	otherwise({
		template: '<div class="alert alert-warning"><h1>Fel!</h1><p>Ett fel uppstod och det verkar inte finnas någon sida här. '+
		'Var vänlig försök igen.</p><p>Klicka <a href="#/">här</a> för att komma tillbaka till startsidan.</p></div>'
	});

	// Set default configuration options for restangular.
	RestangularProvider.setBaseUrl('http://localhost:3000/api/v1');
	RestangularProvider.setDefaultHeaders({Token: 'yM23lMC-NU_pSpRaNJjmdQ'});
	RestangularProvider.setDefaultRequestParams('get', { limit: 5 });
	RestangularProvider.setRequestSuffix('.json');

	// add a response intereceptor
	RestangularProvider.addResponseInterceptor(function(data, operation, what, url, response, deferred) {
		// .. to look for getList operations
		if (operation === "getList") {
			if (data.collection.items === undefined) {
				return new Array();
			}

			var extractedData = data.collection.items;

			if (data.collection.pagination !== undefined) {
				extractedData.pagination = data.collection.pagination;
			}

			return extractedData;
		}

		// .. to look for get operations
		else if (operation === 'get') {
			return data.instance;
		}

		else {
			return response;
		}
	});
})
.constant('AUTH_EVENTS', {
	loginSuccess: 'login-success',
	loginFailed: 'login-failed',
	logoutSuccess: 'logout-success',
	sessionTimeout: 'session-timeout',
	notAuthenticated: 'not-authenticated'
});