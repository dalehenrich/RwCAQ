Extension { #name : 'RwCAQTest' }

{ #category : 'tests' }
RwCAQTest >> testBasic_0 [
	"simple test to work out the kinks and play with difference options."

	| project components loadComponentName packages |
	components := {}.
	loadComponentName := 'Core'.
	components
		add:
				(RwCAQLoadComponent new
						name: 'Core';
						addPackageNamed: 'RwCAQ-Core';
						yourself);
		add:
				(RwCAQConditionalComponent new
						name: 'tests/Tests';
						condition: 'tests';
						addPackageNamed: 'RwCAQ-Tests';
						queryString: 'v361 < each.gemstoneVersion <= v370';
						yourself);
		yourself.	"each is traversal on conditional attributes "
	project := RwCAQProject new
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
	project := RwCAQProject new
		name: 'project';
		components: components;
		gemstoneVersion: '3.6.0' asRwGemStoneVersionNumber;
		attributes: {'tests'};
		yourself.
	packages := project packagesToLoad: loadComponentName.
	self assert: packages asArray sort equals: {'RwCAQ-Core'}
]
