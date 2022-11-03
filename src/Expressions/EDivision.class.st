Class {
	#name : #EDivision,
	#superclass : #EBinaryExpression,
	#instVars : [
		'numerator',
		'denominator'
	],
	#category : #Expressions
}

{ #category : #'instance creation' }
EDivision class >> fiveDividedbythree [
	<sampleInstance>
	|ep1 ep2|
	ep1:= EConstant constant5.
	ep2:= EConstant constant3.
	^self new numerator:ep1;denominator:ep2
]

{ #category : #'instance creation' }
EDivision class >> numerator: anExpression1 denominator: anExpression2 [
	^self new numerator:anExpression1;denominator:anExpression2
]

{ #category : #visiting }
EDivision >> accept: aVisitor [
	^aVisitor visitDivision: self
]

{ #category : #visiting }
EDivision >> denominator [
	^denominator 
	
]

{ #category : #visiting }
EDivision >> denominator: anExpression [
	denominator:= anExpression 
	
]

{ #category : #visiting }
EDivision >> numerator [ 
	^numerator  
	
]

{ #category : #visiting }
EDivision >> numerator: anExpression [
	numerator:= anExpression 
	
]

{ #category : #visiting }
EDivision >> operatorString [ 
	^' / ' 
	
]

{ #category : #visiting }
EDivision >> printOn: aStream [
	aStream nextPutAll: '( '.
	numerator printOn: aStream.
	aStream nextPutAll: self operatorString.
	denominator printOn: aStream.
	aStream nextPutAll: ' )'
	
]
