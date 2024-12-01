Class {
	#name : 'RwCAQTest',
	#superclass : 'TestCase',
	#category : 'RwCAQ-Core'
}

{ #category : 'tests' }
RwCAQTest >> testBasic_1 [
	"simple test to work out the kinks and play with difference options."

	| project components loadComponentName packages |
	components := {}.
	loadComponentName := 'Core'.
	components
		add:
				(RwCAQLoadComponent_1 new
						name: 'Core';
						addPackageNamed: 'RwCAQ-Core';
						addComponentNamed: 'tests/Tests';
						yourself);
		add:
				(RwCAQConditionalComponent_1 new
						name: 'tests/Tests';
						condition: 'tests';
						addPackageNamed: 'RwCAQ-Tests';
						queryString: 'v361 < each.gemstoneVersion <= v370';
						yourself);
		yourself.	"each is traversal on conditional attributes "
	project := RwCAQProject_1 new
		name: 'project';
		components: components;
		gemstoneVersion: '3.6.2' asRwGemStoneVersionNumber;
		attributes: {'tests'};
		yourself.
	packages := project packagesToLoad: loadComponentName.
	self
		assert: packages asArray sort
		equals:
			{'RwCAQ-Tests'.
			'RwCAQ-Core'} sort.
	project := RwCAQProject_1 new
		name: 'project';
		components: components;
		gemstoneVersion: '3.6.2' asRwGemStoneVersionNumber;
		attributes: {'blue'};
		yourself.
	packages := project packagesToLoad: loadComponentName.
	self
		assert: packages asArray sort
		equals:
			{'RwCAQ-Core'} sort.
	project := RwCAQProject_1 new
		name: 'project';
		components: components;
		gemstoneVersion: '3.6.6' asRwGemStoneVersionNumber;
		attributes: {};
		yourself.
	packages := project packagesToLoad: loadComponentName.
	self assert: packages asArray sort equals: {'RwCAQ-Core'}.
	project := RwCAQProject_1 new
		name: 'project';
		components: components;
		gemstoneVersion: '3.6.0' asRwGemStoneVersionNumber;
		attributes: {'tests'};
		yourself.
	packages := project packagesToLoad: loadComponentName.
	self assert: packages asArray sort equals: {'RwCAQ-Core'}
]

{ #category : 'tests' }
RwCAQTest >> testGsQuery_1 [
	""

	| query   |
	query := GsQuery fromString: '3.4 < value'.
	query bind: 'value'  to: 3.3.
	self assert: (query on: {'true'}) queryResult isEmpty
]

{ #category : 'tests' }
RwCAQTest >> testRwCAQ_Query_1 [
	"Arrange to use RwCaqGrammar, using the queryString, that can be used with GsQuery ( 'v361 < each.gemstoneVersion <= v370')"

	| project components loadComponentName packages |
	components := {}.
	loadComponentName := 'Core'.
	components
		add:
				(RwCAQLoadComponent_1 new
						name: 'Core';
						addPackageNamed: 'RwCAQ-Core';
						addComponentNamed: 'tests/Tests';
						yourself);
		add:
				(RwCAQConditionalComponent_2 new
						name: 'tests/Tests';
						condition: 'tests';
						addPackageNamed: 'RwCAQ-Tests';
						queryString: 'v361 < each.gemstoneVersion <= v370';
						yourself);
		yourself.	
	project := RwCAQProject_1 new
		name: 'project';
		components: components;
		gemstoneVersion: '3.6.2' asRwGemStoneVersionNumber;
		attributes: {'tests'};
		yourself.
	packages := project packagesToLoad: loadComponentName.
	self
		assert: packages asArray sort
		equals:
			{'RwCAQ-Tests'.
			'RwCAQ-Core'} sort.
]

{ #category : 'tests' }
RwCAQTest >> testRwCAQ_Query_2 [
	"literal RwGemStoneVersionNumber in the query ..."

	| project components loadComponentName packages |
	components := {}.
	loadComponentName := 'Core'.
	components
		add:
				(RwCAQLoadComponent_1 new
						name: 'Core';
						addPackageNamed: 'RwCAQ-Core';
						addComponentNamed: 'tests/Tests';
						yourself);
		add:
				(RwCAQConditionalComponent_2 new
						name: 'tests/Tests';
						condition: 'tests';
						addPackageNamed: 'RwCAQ-Tests';
						queryString: '3.6.1< each.gemstoneVersion <= 3.7.1';
						yourself);
		yourself.	
	project := RwCAQProject_1 new
		name: 'project';
		components: components;
		gemstoneVersion: '3.6.2' asRwGemStoneVersionNumber;
		attributes: {'tests'};
		yourself.
	packages := project packagesToLoad: loadComponentName.
	self
		assert: packages asArray sort
		equals:
			{'RwCAQ-Tests'.
			'RwCAQ-Core'} sort.
]

{ #category : 'tests' }
RwCAQTest >> testRwCAQ_Query_3 [
	"literal RwGemStoneVersionNumber in the query ..."

	| project components loadComponentName packages |
	components := {}.
	loadComponentName := 'Core'.
	components
		add:
				(RwCAQLoadComponent_1 new
						name: 'Core';
						addPackageNamed: 'RwCAQ-Core';
						addComponentNamed: 'tests/Tests';
						yourself);
		add:
				(RwCAQConditionalComponent_2 new
						name: 'tests/Tests';
						condition: 'tests';
						addPackageNamed: 'RwCAQ-Tests';
						queryString: '3.6.1< each.gemstoneVersion ';
						yourself);
		yourself.	
	project := RwCAQProject_1 new
		name: 'project';
		components: components;
		gemstoneVersion: '3.6.2' asRwGemStoneVersionNumber;
		attributes: {'tests'};
		yourself.
	packages := project packagesToLoad: loadComponentName.
	self
		assert: packages asArray sort
		equals:
			{'RwCAQ-Tests'.
			'RwCAQ-Core'} sort.
]
