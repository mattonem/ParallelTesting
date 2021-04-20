Class {
	#name : #ParallelTestSuite,
	#superclass : #TestSuite,
	#instVars : [
		'testPool'
	],
	#classVars : [
		'DefaultParallelTestingPoolSize'
	],
	#category : #ParallelTesting
}

{ #category : #accessing }
ParallelTestSuite class >> defaultParallelTestingPoolSize [
	^ DefaultParallelTestingPoolSize ifNil: [ DefaultParallelTestingPoolSize := 10 ]
]

{ #category : #accessing }
ParallelTestSuite class >> defaultParallelTestingPoolSize: anInteger [ 
	^ DefaultParallelTestingPoolSize := anInteger
]

{ #category : #accessing }
ParallelTestSuite class >> defaultParallelTestingPoolSizeSettingOn: aBuilder [ 
	<systemsettings>
	(aBuilder setting: #defaultParallelTestingPoolSize) 
		label: 'Default parallel testing pool size' translated;
		default: 10;
		target: self;
		parent: #sunit.
]

{ #category : #running }
ParallelTestSuite >> runUnmanaged: aResult [ 

	| futures |
	self setUp.
	[ 
	futures := self tests collect: [ :each | 
		           self testPool future: [ 
			           each run: aResult.
			           self announceTest: each.
			           self changed: each ] ].
	(TKTFuture all: futures) synchronizeTimeout: 2 minutes ] ensure: [ 
		self tearDown ]
]

{ #category : #accessing }
ParallelTestSuite >> setUp [

	super setUp.
	self testPool start
]

{ #category : #accessing }
ParallelTestSuite >> tearDown [ 	
	super tearDown.
	self testPool stop
]

{ #category : #accessing }
ParallelTestSuite >> testPool [

	^ testPool ifNil: [ 
		  self testPoolSize: self class defaultParallelTestingPoolSize ]
]

{ #category : #accessing }
ParallelTestSuite >> testPool: anObject [

	testPool := anObject
]

{ #category : #accessing }
ParallelTestSuite >> testPoolSize: size [

	^ testPool := TKTWorkerPool new
		              name: self asString , ' test pool';
		              poolMaxSize: size
]
