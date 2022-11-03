Class {
	#name : #EExpression,
	#superclass : #Object,
	#category : #Expressions
}

{ #category : #accessing }
EExpression >> accept: aVisitor [
	self subclassResponsibility 
]

{ #category : #'public access' }
EExpression >> evaluateWith: anObject [
	^ self accept: (EEvaluatorVisitor new binding: anObject)
]

{ #category : #accessing }
EExpression >> negated [
	^ENegation new expression:self 
]
