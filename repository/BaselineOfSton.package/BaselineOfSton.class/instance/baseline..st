baseline
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec
			package: 'STON-Core';
			package: 'STON-Tests';
			package: 'STON-Text support';
			group: 'Core' with: #('STON-Core');
			group: 'default' with: #('STON-Core' 'STON-Text support' 'STON-Tests') ].

	spec for: #'pharo' do: [
		spec
			package: 'STON-Core'
				with: [ spec includes: #('STON-Pharo-Core') ];
			package: 'STON-Pharo-Core'
				with: [ spec requires: #('STON-Core') ] ].

	spec for: #'squeak' do: [
		spec
			package: 'STON-Core'
				with: [ spec includes: #('STON-Squeak-Core') ];
			package: 'STON-Squeak-Core'
				with: [ spec requires: #('STON-Core') ] ].

	spec for: #(#'squeak4.x' #'squeak5.0') do: [
		spec
			package: 'STON-Squeak-Core'
				with: [ spec includes: #('STON-Squeak45-Core') ];
			package: 'STON-Squeak45-Core'
				with: [ spec requires: #('STON-Squeak-Core') ] ].
		