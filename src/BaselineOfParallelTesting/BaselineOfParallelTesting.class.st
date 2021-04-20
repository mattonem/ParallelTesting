Class {
	#name : #BaselineOfParallelTesting,
	#superclass : #BaselineOf,
	#category : #BaselineOfParallelTesting
}

{ #category : #baselines }
BaselineOfParallelTesting >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			baseline: 'TaskIt'
			with: [ 
			spec repository: 'github://pharo-contributions/taskit:master' ].
		spec package: #ParallelTesting ]
]
