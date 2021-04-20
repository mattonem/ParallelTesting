Trait {
	#name : #ParallelTestCase,
	#category : #ParallelTesting
}

{ #category : #factory }
ParallelTestCase classSide >> suiteClass [ 	
	^ ParallelTestSuite
]

{ #category : #running }
ParallelTestCase >> runCaseManaged [ 
	^ self runCase
]
