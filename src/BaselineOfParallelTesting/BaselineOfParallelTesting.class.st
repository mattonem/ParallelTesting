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
		spec
			package: #ParallelTesting
			with: [ spec requires: #TaskIt ].
		spec
			package: #'ParallelTesting-Tests'
			with: [ spec requires: #ParallelTesting ] ].
	spec
		group: 'core' with: #( ParallelTesting );
		group: 'tests' with: #( 'ParallelTesting-Tests' );
		group: 'default' with: #( 'ParallelTesting-Tests' )
]
