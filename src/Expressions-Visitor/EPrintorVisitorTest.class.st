Class {
	#name : #EPrintorVisitorTest,
	#superclass : #TestCase,
	#category : #'Expressions-Visitor'
}

{ #category : #tests }
EPrintorVisitorTest >> testVisitorPrintingAddition [
	|ep1 ep2 add|
	ep1:=EConstant constant5. 
	ep2:=EConstant constant3. 
	add:= EAddition left: ep1 right: ep2.
	self assert: (EPrintorVisitor new visitAddition:  add) 
	equals:'(5 + 3)'
]

{ #category : #tests }
EPrintorVisitorTest >> testVisitorPrintingAdditionNegation [
	|ep1 ep2 add|
	ep1:=EConstant constant5. 
   ep2:=ENegation expression: (EConstant constant3). 
	add:= EAddition left: ep1 right: ep2.
	self assert: (EPrintorVisitor new visitAddition:  add) 
	equals:'(5 + -3)'
]

{ #category : #tests }
EPrintorVisitorTest >> testVisitorPrintingConstant [
	|ep1|
	ep1:=EConstant constant5.  
	self assert: (EPrintorVisitor new visitConstant: ep1) equals:'5'
]

{ #category : #tests }
EPrintorVisitorTest >> testVisitorPrintingDivision [
	|ep1 ep2 div|
	ep1:=EConstant constant5. 
	ep2:=EConstant constant3. 
	div:= EDivision numerator: ep1 denominator: ep2.
	self assert: (EPrintorVisitor new visitDivision:  div) 
	equals:'(5 / 3)'
]

{ #category : #tests }
EPrintorVisitorTest >> testVisitorPrintingMultiplication [
	|ep1 ep2 pro|
	ep1:=EConstant constant5. 
	ep2:=EConstant constant3. 
	pro:= EMultiplication left: ep1 right: ep2.
	self assert: (EPrintorVisitor new visitMultiplication: pro) 
	equals:'(5 * 3)'
]

{ #category : #tests }
EPrintorVisitorTest >> testVisitorPrintingNegation [
	|ep1|
	ep1:=ENegation expression: (EConstant constant5). 
	self assert: (EPrintorVisitor new visitNegation: ep1) 
	equals:'-5'
]

{ #category : #tests }
EPrintorVisitorTest >> testVisitorPrintingVariable [
	|ep1 visitor|
	ep1:=EVariable new id: #x. 
	visitor:= EPrintorVisitor new binding: {#x->10.#Hello->12} asDictionary.
	self assert: (visitor visitVariable: ep1) 
	equals:'10'
]

{ #category : #tests }
EPrintorVisitorTest >> testVisitorPrintingVariableMultiplicationValue [
	|ep1 ep2 pro visitor|
	ep1:=EVariable new id: #x. 
	ep2:=EVariable new id: #y.
	pro:=EMultiplication left: ep1 right: ep2.
	visitor:= EPrintorVisitor new binding: 
		{#x->10.#Hello->12.#y->2} asDictionary.
	self assert: (visitor visitMultiplication: pro) equals:'(10 * 2)'
]
