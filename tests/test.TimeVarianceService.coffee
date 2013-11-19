describe 'TimeVarianceServiceTest', ->

	beforeEach ->
		module 'myAppModule'
		

	it 'should have methods: getVariance, rest', inject ['TimeVarianceService', (variance) ->
		variance.getVariance.should.be.a 'function'
		variance.reset.should.be.a 'function'
	]