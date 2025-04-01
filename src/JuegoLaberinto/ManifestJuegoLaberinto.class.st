"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestJuegoLaberinto,
	#superclass : #PackageManifest,
	#category : #'JuegoLaberinto-Manifest'
}

{ #category : #'code-critics' }
ManifestJuegoLaberinto class >> ruleReIsNilAndConditionalRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#Tunel #entrar: #false)) #'2025-04-01T11:09:05.285+02:00') )
]
