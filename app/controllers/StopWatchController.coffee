#SimpleController File
(->
	###
		Should contain only View Logic
		One controller for one view
	###
	class _StopWatchController
		constructor:(@scope, @stopWatch) ->

				@hours = 0
				@minutes = 0
				@seconds = 0
				@milliseconds = 0

				@toggleButton = 'Start'
				@toggleButton_class = 'btn-primary'
				@started = false;

				@laps = []

		start : ->

			if @started is false
				self = @
				callback = (data)->


					_.assign self, _.pick data, 'milliseconds', 'hours', 'minutes', 'seconds'

				@stopWatch.start callback
				@toggleButton = 'Pause'
				@toggleButton_class = 'btn-warning'

			else
				@toggleButton = 'Start'
				@toggleButton_class = 'btn-primary'
				@stopWatch.pause()

			@started = not @started


		reset : ->
			@stopWatch.reset()
			@laps= []


		stop: ->
			@stopWatch.pause()

		lap: ->
			@laps.push _.pick @stopWatch.getVariance(), 'hours', 'seconds', 'minutes', 'milliseconds'


	_StopWatchController.$inject = ['$scope','StopWatchService']

	angular.module('myAppModule').controller 'StopWatchController', _StopWatchController
)()
