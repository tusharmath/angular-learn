(->
	class _StopWatchService
		WatchStates:
			STOPPED :1
			PAUSED : 2
			RUNNING : 3

		constructor: (@timeout, @variance) ->
			@state = @WatchStates.STOPPED

		#Resets counters
		increment:() ->

			self = @
			if @state is @WatchStates.RUNNING
				@timeout (-> self.increment()), 1
				@callback @variance.getVariance()

		pause: ->
			@state = @WatchStates.PAUSED


		start: (@callback) ->


			if @state isnt @WatchStates.RUNNING
				@variance.reset() if @state isnt @WatchStates.PAUSED
				@state = @WatchStates.RUNNING
				@increment()

		getVariance: ->
			@callback @variance.getVariance()
		reset: ->
			@callback @variance.getVariance()
			@variance.reset()


	_StopWatchService.$inject = ['$timeout', 'TimeVarianceService']

	#Directly registering a service
	angular.module('myAppModule').service 'StopWatchService', _StopWatchService
)()
