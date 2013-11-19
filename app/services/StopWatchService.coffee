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

			@timeout (-> self.increment()), 1 if @hasStarted is true
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
			@hasStarted = false

		start: (@callback) ->
			if @hasStarted is false
				@startDate = new Date
				@hasStarted = true
				@increment()

		reset: ->
			@init()
			@callback {@milliseconds, @seconds, @minutes, @hours}

	_StopWatchService.$inject = ['$timeout']

	#Directly registering a service
	myApp.service 'StopWatchService', _StopWatchService
)(myApp)
