versions
version24: spec
	<version: '0.24' imports: #('0.4-baseline')>

	spec for: #'common' do: [
		spec 
			blessing: #'release';
			package: 'STON-Core' with: 'STON-Core-SvenVanCaekenberghe.87';
			package: 'STON-Text support' with: 'STON-Text support-TheIntegrator.2';
			package: 'STON-Tests' with: 'STON-Tests-SvenVanCaekenberghe.79' ]