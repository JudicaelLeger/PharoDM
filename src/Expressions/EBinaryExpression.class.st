Class {
	#name : #EBinaryExpression,
	#superclass : #EExpression,
	#instVars : [
		'right',
		'left'
	],
	#category : #Expressions
}

{ #category : #printing }
EBinaryExpression >> left [
	^left
]

{ #category : #printing }
EBinaryExpression >> operatorString [

	^ self subclassResponsibility 
]

{ #category : #printing }
EBinaryExpression >> printOn: aStream [
	aStream nextPutAll: '( '.
	left printOn: aStream.
	aStream nextPutAll: self operatorString.
	right printOn: aStream.
	aStream nextPutAll: ' )'
]

{ #category : #printing }
EBinaryExpression >> right [
	^right 
]
