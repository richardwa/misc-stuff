//
// Simple and fast corned cube!
// Anaximandro de Godinho.
//

module cubeX( size, radius=1, rounded=true, center=false, corner_resolution = 100)
{
	l = len( size );
	if( l == undef )
		_cubeX( size, size, size, radius, rounded, center ,corner_resolution);
	else
		_cubeX( size[0], size[1], size[2], radius, rounded, center ,corner_resolution);
}

module _cubeX( x, y, z, r, rounded, center , corner_resolution)
{
	if( rounded )
		if( center )
			translate( [-x/2, -y/2, -z/2] )
			__cubeX( x, y, z, r ,corner_resolution);
		else
			__cubeX( x, y, z, r ,corner_resolution);
	else
		cube( [x, y, z], center );
}

module __cubeX(	x, y, z, r ,res)
{
	//TODO: discount r.
	rC = r;
	hull()
	{
		translate( [rC, rC, rC] )
			sphere( r ,$fn=res);
		translate( [rC, y-rC, rC] )
			sphere( r ,$fn=res);
		translate( [rC, rC, z-rC] )
			sphere( r ,$fn=res);
		translate( [rC, y-rC, z-rC] )
			sphere( r ,$fn=res);

		translate( [x-rC, rC, rC] )
			sphere( r ,$fn=res);
		translate( [x-rC, y-rC, rC] )
			sphere( r ,$fn=res);
		translate( [x-rC, rC, z-rC] )
			sphere( r ,$fn=res);
		translate( [x-rC, y-rC, z-rC] )
			sphere( r ,$fn=res);
	}
}