requirejs.config 
	paths: 
		'angular': 'vendors/angular/angular'


define ['angular'], (angular) ->
	
    angular.module('myAppModule', ['ngTouch']);
    debugger;