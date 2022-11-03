Class {
	#name : #EEvaluatorVisitor,
	#superclass : #Object,
	#instVars : [
		'binding'
	],
	#category : #'Expressions-Visitor'
}

{ #category : #visiting }
EEvaluatorVisitor >> binding [
	^binding
	
]

{ #category : #visiting }
EEvaluatorVisitor >> binding: aDictionary [
	binding:= aDictionary 
	
]

{ #category : #visiting }
EEvaluatorVisitor >> initialize [ 
	super initialize.
	binding:=Dictionary new
	
]

{ #category : #visiting }
EEvaluatorVisitor >> visitAddition: anAddition [
	^(anAddition left evaluateWith: self binding)
	+ (anAddition right evaluateWith: self binding )
]

{ #category : #visiting }
EEvaluatorVisitor >> visitConstant: aConstant [
	^aConstant value 
	
]

{ #category : #visiting }
EEvaluatorVisitor >> visitDivision: aDivision [
	^(aDivision  numerator evaluateWith: self binding) 
	/ (aDivision denominator evaluateWith: self binding)
]

{ #category : #visiting }
EEvaluatorVisitor >> visitMultiplication: aMultiplication [
	^(aMultiplication left evaluateWith: self binding) 
	* (aMultiplication right evaluateWith: self binding)
]

{ #category : #visiting }
EEvaluatorVisitor >> visitNegation: aNegation [
	^(aNegation expression evaluateWith: self binding) * -1
]

{ #category : #visiting }
EEvaluatorVisitor >> visitVariable: aVariable [
	^(self binding at: (aVariable id))
]
