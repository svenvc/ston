baselines
baseline04: spec
	<version: '0.4-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://ss3.gemtalksystems.com/ss/STON'.
		spec
			package: 'STON-Core';
			package: 'STON-Tests';
			package: 'STON-Text support';
			group: 'Core' with: #('STON-Core');
			group: 'default' with: #('STON-Core' 'STON-Text support' 'STON-Tests') ].
		