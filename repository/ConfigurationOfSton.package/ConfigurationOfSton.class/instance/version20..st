versions
version20: spec
	<version: '0.20' imports: #('0.4-baseline')>

	spec for: #'common' do: [
		spec 
			blessing: #'release';
			package: 'STON-Core' with: 'STON-Core-PavelKrivanek.74';
			package: 'STON-Text support' with: 'STON-Text support-PavelKrivanek.1';
			package: 'STON-Tests' with: 'STON-Tests-SvenVanCaekenberghe.64' ]