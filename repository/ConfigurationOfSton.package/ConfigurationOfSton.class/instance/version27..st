versions
version27: spec
	<version: '0.27' imports: #('0.4-baseline')>

	spec for: #'common' do: [
		spec 
			blessing: #'release';
			package: 'STON-Core' with: 'STON-Core-SvenVanCaekenberghe.90';
			package: 'STON-Text support' with: 'STON-Text support-TheIntegrator.2';
			package: 'STON-Tests' with: 'STON-Tests-SvenVanCaekenberghe.83' ]