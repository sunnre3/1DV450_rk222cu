app.filter('literalResourceType', function() {
	return function(input, pluralize) {
		var pluralize = pluralize || false;

		switch (input) {
			case 'Image':
			return pluralize ? 'Bilder' : 'Bild';

			case 'Video':
			return pluralize ? 'Videor' : 'Video';

			case 'Audio':
			return pluralize ? 'Ljudklipp' : 'Ljudklipp';

			case 'Note':
			return pluralize ? 'Anteckningar' : 'Anteckning';
		}
	};
});