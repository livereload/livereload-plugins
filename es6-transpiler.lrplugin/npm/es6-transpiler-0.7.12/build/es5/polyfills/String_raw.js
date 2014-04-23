if ( !String.raw )String.raw = function raw(quasis) {
	var raw$0 = quasis["raw"]
		, len = raw$0.length >>> 0
	;
	
	if (len === 0) return '';
	
	var s = '', i = 0;
	while (true) {
		s += raw$0[i];
		if (i + 1 === len) return s;
		s += arguments[++i];
	}
} 