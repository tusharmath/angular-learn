((myApp)->
	class _StopWatchService
		WatchStates:
			STOPPED :1
			PAUSED : 2
			RUNNING : 3

		constructor: (@timeout) ->
			@init()
			@state = @WatchStates.STOPPED

		#Resets counters
		init: ->
			@hours = 0
			@minutes = 0
			@seconds = 0
			@milliseconds = 0


		increment:() ->

			@timeout (-> self.increment()), 1 if @state is @WatchStates.RUNNING
			dateDiff = new Date new Date - @startDate


			#Update counters

			@milliseconds = dateDiff.getUTCMilliseconds()

			@seconds = dateDiff.getUTCSeconds()
			@minutes = dateDiff.getUTCMinutes()
			@hours = dateDiff.getUTCHours()


			#Update Reference object
			@callback {@milliseconds, @seconds, @minutes, @hours}


			self = @

			#Add call increment after 10 ms
			#Pass reference object



		pause: ->
			@state = @WatchStates.PAUSED

		start: (@callback) ->


			if @state isnt @WatchStates.RUNNING
				@startDate = new Date if @state isnt @WatchStates.PAUSED
				@state = @WatchStates.RUNNING
				@increment()

		reset: ->
			@init()
			@callback {@milliseconds, @seconds, @minutes, @hours}
			@startDate = new Date


	_StopWatchService.$inject = ['$timeout']

	#Directly registering a service
	myApp.service 'StopWatchService', _StopWatchService
)(myApp)
