(->
	class _StopWatchService
		WatchStates:
			STOPPED :1
			PAUSED : 2
			RUNNING : 3

		constructor: (@timeout, @variance) ->
			@state = @WatchStates.STOPPED

		#Resets counters
		
		pause: ->
			@state = @WatchStates.PAUSED


		start: (@callback) ->


			if @state isnt @WatchStates.RUNNING
				@variance.reset() if @state isnt @WatchStates.PAUSED
				@state = @WatchStates.RUNNING
				self = @
				i = 0 
				increment = ->

					console.profileEnd 'dingdong:' if i++ is 2

					if self.state is self.WatchStates.RUNNING

						console.profile 'dingdong:' if i++ is 1
						self.timeout increment, 1
						self.callback self.variance.getVariance()
					return
				increment()
				return


		getVariance: ->
			@callback @variance.getVariance()
		reset: ->
			@callback @variance.getVariance()
			@variance.reset()


	_StopWatchService.$inject = ['$timeout', 'TimeVarianceService']

	#Directly registering a service
	angular.module('myAppModule').service 'StopWatchService', _StopWatchService
)()
