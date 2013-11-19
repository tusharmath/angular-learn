describe 'StopWatchServiceTest', ->

	beforeEach ->
		module 'myAppModule'
		FakeTimeVarianceService = {
			reset: ->
			getVariance: ->
		}
		FakeTimeout = ->

		module ($provide) ->
			$provide.value 'TimeVarianceService', FakeTimeVarianceService
			$provide.value '$timeout', FakeTimeout
			return null

	it 'should have 3 WatchStates', inject ['StopWatchService', (stopWatch) ->
		stopWatch.WatchStates.should.have.property 'STOPPED'
		stopWatch.WatchStates.should.have.property 'PAUSED'
		stopWatch.WatchStates.should.have.property 'RUNNING'
	]

	it 'should set the correct states', inject ['StopWatchService', (stopWatch)->
		stopWatch.state.should.equal 1
		stopWatch.start ->
		stopWatch.state.should.equal 3
		stopWatch.pause()
		stopWatch.state.should.equal 2
	]
