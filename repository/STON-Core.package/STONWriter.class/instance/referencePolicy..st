initialization
referencePolicy: policy
	self assert: ( #(#normal #ignore #error) includes: policy ).
	referencePolicy := policy