versions
version21: spec
	<version: '0.21' imports: #('0.4-baseline')>

	spec for: #'common' do: [
		spec 
			blessing: #'release';
			package: 'STON-Core' with: 'STON-Core-SvenVanCaekenberghe.76';
			package: 'STON-Text support' with: 'STON-Text support-PavelKrivanek.1';
			package: 'STON-Tests' with: 'STON-Tests-SvenVanCaekenberghe.66' ]