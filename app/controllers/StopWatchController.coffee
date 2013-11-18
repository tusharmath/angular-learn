#SimpleController File
((myApp) ->
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

				@laps = []

		start : ->

			self = @
			callback = (data)->

				self.hours = data.hours
				self.minutes = data.minutes
				self.seconds = data.seconds
				self.milliseconds = data.milliseconds


			@stopWatch.start callback

		reset : ->
			@stopWatch.reset()
			@laps= []


		stop: ->
			@stopWatch.pause()


		lap: ->

			{hours, seconds, minutes, milliseconds} = @stopWatch
			@laps.push {hours, seconds, minutes, milliseconds}


	_StopWatchController.$inject = ['$scope','StopWatchService']

	myApp.controller 'StopWatchController', _StopWatchController
)(myApp)
