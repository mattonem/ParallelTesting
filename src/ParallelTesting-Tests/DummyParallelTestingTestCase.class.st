Class {
	#name : #DummyParallelTestingTestCase,
	#superclass : #TestCase,
	#traits : 'ParallelTestCase',
	#classTraits : 'ParallelTestCase classTrait',
	#category : #'ParallelTesting-Tests'
}

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
