# ParallelTesting

A very simplistic implementation of parallel testing using TaskIt and Traits.

## Loading

```smalltalk
Metacello new
  baseline: 'ParallelTesting';
  repository: 'github://mattonem/ParallelTesting:master';
  load.
```

## Usage
When your test cases could run in parallel (e2e testing for instance), just add the Trait ParallelTestCase to your test case.

If you want to configure how many tests can be run in concurently:
- in UI change the setting `Default parallel testing pool size` available in System>SUnit params
- in headless mode, use `ParallelTestSuite>>defaultParallelTestingPoolSize:`
