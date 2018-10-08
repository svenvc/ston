baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec blessing: #baseline.
			spec
				package: 'STON-Core';
				package: 'STON-Tests';
				package: 'STON-Text support';
				group: 'Core' with: #('STON-Core');
				group: 'default' with: #('STON-Core' 'STON-Text support' 'STON-Tests') ]