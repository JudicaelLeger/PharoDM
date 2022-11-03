Class {
	#name : #EAddition,
	#superclass : #EBinaryExpression,
	#category : #Expressions
}

{ #category : #'instance creation' }
EAddition class >> fivePlusthree [
	<sampleInstance>
	|ep1 ep2|
	ep1:= EConstant constant5.
	ep2:= EConstant constant3.
	^self new left:ep1;right:ep2
]

{ #category : #'instance creation' }
EAddition class >> left: anExpression1 right: anExpression2 [
	^self new left:anExpression1;right:anExpression2
]

{ #category : #accessing }
EAddition >> accept: aVisitor [
	^aVisitor visitAddition: self
]

{ #category : #accessing }
EAddition >> left: anExpression [
	left:= anExpression  
]

{ #category : #accessing }
EAddition >> operatorString [ 
	^' + '
]

{ #category : #accessing }
EAddition >> right: anExpression [
	right:= anExpression 
]
