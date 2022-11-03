Class {
	#name : #EMultiplication,
	#superclass : #EBinaryExpression,
	#category : #Expressions
}

{ #category : #'instance creation' }
EMultiplication class >> fiveTimesthree [
	<sampleInstance>
	|ep1 ep2|
	ep1:= EConstant constant5.
	ep2:= EConstant constant3.
	^self new left:ep1;right:ep2
]

{ #category : #'instance creation' }
EMultiplication class >> left:anExpression1 right:anExpression2 [
	^self new left:anExpression1;right:anExpression2
]

{ #category : #accessing }
EMultiplication >> accept: aVisitor [
	^aVisitor visitMultiplication: self
]

{ #category : #accessing }
EMultiplication >> left: anExpression [
 left:= anExpression 
]

{ #category : #accessing }
EMultiplication >> operatorString [ 
	^' * '
]

{ #category : #accessing }
EMultiplication >> right: anExpression [
 right:= anExpression 
]
