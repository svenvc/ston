versions
version25: spec
	<version: '0.25' imports: #('0.4-baseline')>

	spec for: #'common' do: [
		spec 
			blessing: #'release';
			package: 'STON-Core' with: 'STON-Core-SvenVanCaekenberghe.89';
			package: 'STON-Text support' with: 'STON-Text support-TheIntegrator.2';
			package: 'STON-Tests' with: 'STON-Tests-SvenVanCaekenberghe.81' ]