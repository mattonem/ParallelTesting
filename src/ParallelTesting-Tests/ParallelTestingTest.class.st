Class {
	#name : #ParallelTestingTest,
	#superclass : #TestCase,
	#category : #'ParallelTesting-Tests'
}

{ #category : #'as yet unclassified' }
ParallelTestingTest >> testParalleleTesting [

	| time result |
	ParallelTestSuite defaultParallelTestingPoolSize: 20.
	time := [ result := DummyParallelTestingTestCase suite run ] timeToRun.
	self assert: time < 3 seconds.
	self assert: result passed size equals: 3
]

{ #category : #'as yet unclassified' }
ParallelTestingTest >> testParalleleTestingSingle [

	| time result |
	ParallelTestSuite defaultParallelTestingPoolSize: 1.
	time := [ result := DummyParallelTestingTestCase suite run ]
		        timeToRun.
	self assert: time > 6 seconds.
	self assert: result passed size equals: 3
]
