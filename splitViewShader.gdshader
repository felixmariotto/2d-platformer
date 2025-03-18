shader_type canvas_item;

uniform sampler2D player0tex;
uniform sampler2D player1tex;
uniform vec2 player0pos;
uniform vec2 player1pos;
uniform vec2 playersAxis;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// convert UV to normalized device coordinates
	vec2 NDC = UV * 2.0 - 1.0;
	
	if ( dot( NDC, playersAxis ) > 0.0 ) {
		COLOR = texture( player0tex, UV );
	} else {
		// COLOR = texture( player1tex, UV );
		COLOR = texture( player1tex, UV );
	}
	
	// COLOR = vec4( UV, 0.0, 1.0 );
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
