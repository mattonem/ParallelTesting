Class {
	#name : #ParallelTestingTest,
	#superclass : #TestCase,
	#category : #'ParallelTesting-Tests'
}

{ #category : #'as yet unclassified' }
ParallelTestingTest >> testParalleleTesting [

	| time result |
	time := [ result := DummyParallelTestingTestCase suite run ] timeToRun.
	self assert: time < 3 seconds.
	"self assert: result passed size equals: 3" 
]
