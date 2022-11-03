Class {
	#name : #EDivisionTest,
	#superclass : #TestCase,
	#category : #Expressions
}

{ #category : #tests }
EDivisionTest >> testEvaluate [

	| ep1 ep2 |
	ep1 := EConstant new value: 15.
	ep2 := EConstant new value: 3.
	self
		assert: ((EDivision  new
				  denominator: ep2;
				  numerator: ep1) evaluateWith: Dictionary new)
		equals: 5
]

{ #category : #tests }
EDivisionTest >> testEvaluateNegated [

	| ep1 ep2 |
	ep1 := EConstant new value: 15.
	ep2 := EConstant new value: 3.
	self
		assert: ((EDivision new
				  denominator: ep2;
				  numerator: ep1) negated evaluateWith: Dictionary new)
		equals: -5
]

{ #category : #tests }
EDivisionTest >> testEvaluateWithClassCreationMessage [

	| ep1 ep2 |
	ep1 := EConstant value: 15.
	ep2 := EConstant value: 3.
	self
		assert:
		((EDivision numerator: ep1 denominator: ep2) evaluateWith: Dictionary new)
		equals: 5
]

{ #category : #tests }
EDivisionTest >> testPrinting [
	self assert: EDivision fiveDividedbythree printString 
	equals: '( 5 / 3 )'.
	self assert: EDivision fiveDividedbythree negated printString 
	equals: '- ( 5 / 3 )'
]
