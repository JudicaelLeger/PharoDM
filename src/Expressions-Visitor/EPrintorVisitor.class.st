Class {
	#name : #EPrintorVisitor,
	#superclass : #Object,
	#instVars : [
		'binding'
	],
	#category : #'Expressions-Visitor'
}

{ #category : #visiting }
EPrintorVisitor >> binding [
	^binding 

]

{ #category : #visiting }
EPrintorVisitor >> binding:  anObject [
	binding:= anObject 

]

{ #category : #visiting }
EPrintorVisitor >> visitAddition:  anAddition [
	|left right|
	left:=anAddition  left accept: self.
	right:=anAddition  right accept: self.
	^ '(', left , ' + ' , right , ')'
]

{ #category : #visiting }
EPrintorVisitor >> visitConstant: aConstant [
	^aConstant value asString
]

{ #category : #visiting }
EPrintorVisitor >> visitDivision:   aDivision [
	|left right|
	left:=aDivision numerator accept: self.
	right:=aDivision denominator accept: self.
	^ '(', left , ' / ' , right , ')'
]

{ #category : #visiting }
EPrintorVisitor >> visitMultiplication: aMultiplication [
	|left right|
	left:=aMultiplication left accept: self.
	right:=aMultiplication right accept: self.
	^ '(', left , ' * ' , right , ')'
]

{ #category : #visiting }
EPrintorVisitor >> visitNegation:  aNegation [
	|exp|
	exp:=aNegation expression accept: self.
	^ '-', exp  
]

{ #category : #visiting }
EPrintorVisitor >> visitVariable:  aVariable [
	|bin value|
	bin:=self binding.
	value:= (bin at: (aVariable id)) asString.
	^ value  
]
