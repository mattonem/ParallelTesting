Class {
	#name : #DummyParallelTestingTestCase,
	#superclass : #TestCase,
	#traits : 'ParallelTestCase',
	#classTraits : 'ParallelTestCase classTrait',
	#instVars : [
		'shouldFail'
	],
	#category : #'ParallelTesting-Tests'
}

{ #category : #tests }
DummyParallelTestingTestCase >> runFailures [
	^ shouldFail ifNil: [ false ]
]

{ #category : #tests }
DummyParallelTestingTestCase >> shouldFail: bool [
	shouldFail := bool
]

{ #category : #tests }
DummyParallelTestingTestCase >> test1 [
	2 second wait
]

{ #category : #tests }
DummyParallelTestingTestCase >> test2 [
	2 second wait
]

{ #category : #tests }
DummyParallelTestingTestCase >> test3 [
	2 second wait
]

{ #category : #tests }
DummyParallelTestingTestCase >> testFailure [
	self runFailures ifFalse: [ self skip ].
	self assert: false.
]
