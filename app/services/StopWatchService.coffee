((myApp)->
	class _StopWatchService
		constructor: (@timeout) ->
			@init()
			@hasStarted = false

		#Resets counters
		init: ->
			@hours = 0
			@minutes = 0
			@seconds = 0
			@milliseconds = 0


		increment:() ->

			#Update counters
			@milliseconds++

			if @milliseconds is 100
				@seconds++
				@milliseconds = 0

			if @seconds is 61
				@minutes++
				@seconds = 0

			if @minutes is 61
				@minutes =0
				@hours++

			#Update Reference object
			@callback {@milliseconds, @seconds, @minutes, @hours}


			self = @

			#Add call increment after 10 ms
			#Pass reference object

			@timeout (-> self.increment()), 10 if @hasStarted is true

		pause: ->
			@hasStarted = false

		start: (@callback) ->
			if @hasStarted is false
				@hasStarted = true
				@increment()

		reset: ->
			@init()
			@callback {@milliseconds, @seconds, @minutes, @hours}

	_StopWatchService.$inject = ['$timeout']

	#Directly registering a service
	myApp.service 'StopWatchService', _StopWatchService
)(myApp)
