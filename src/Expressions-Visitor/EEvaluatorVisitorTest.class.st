Class {
	#name : #EEvaluatorVisitorTest,
	#superclass : #TestCase,
	#category : #'Expressions-Visitor'
}

{ #category : #tests }
EEvaluatorVisitorTest >> testVisitAdditionReturnsAdditionvalue [
	|expression result|
	expression := EAddition left:(EConstant value: 7) right:(EConstant value:-2).
	result := expression accept: EEvaluatorVisitor new.
	self assert: result equals:5

]

{ #category : #tests }
EEvaluatorVisitorTest >> testVisitConstantReturnsConstantvalue [
	|constant result|
	constant := EConstant value: 5.
	result := constant accept: EEvaluatorVisitor new.
	self assert: result equals:5

]

{ #category : #tests }
EEvaluatorVisitorTest >> testVisitDivisionReturnsDivisionvalue [
	|expression result|
	expression := EDivision  numerator:(EConstant value: 14) denominator:(EConstant value:-2).
	result := expression accept: EEvaluatorVisitor new.
	self assert: result equals:-7

]

{ #category : #tests }
EEvaluatorVisitorTest >> testVisitDivisionZeroraiseError [
	|expression|
	expression := EDivision  numerator:(EConstant value: 14) denominator:(EConstant value:0).
	self should: [expression accept: EEvaluatorVisitor new] raise: ZeroDivide 

]

{ #category : #tests }
EEvaluatorVisitorTest >> testVisitMultiplicationReturnsMultipliedvalue [
	|expression result|
	expression := EMultiplication  left:(EConstant value: 7) right:(EConstant value:-2).
	result := expression accept: EEvaluatorVisitor new.
	self assert: result equals:-14

]

{ #category : #tests }
EEvaluatorVisitorTest >> testVisitNegationReturnsNegatedConstant [
	|expression result|
	expression := (EConstant value: 7) negated.
	result := expression accept: EEvaluatorVisitor new.
	self assert: result equals: -7

]

{ #category : #tests }
EEvaluatorVisitorTest >> testVisitVariableReturnsVariableResult [
	|variable result dic|
	variable := (EVariable new id: #x).
	dic := EEvaluatorVisitor new binding: { #x->2 . #y->12 } asDictionary .
	result := variable  accept: dic.
	self assert: result equals: 2

]
