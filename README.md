# Invariable Plane

Sandro Ricardo De Souza (<sandro.fisica@gmail.com>)

The objective of this project is to test a transformation of ecliptic
coordinates to the invariant plane. Thus, let us evaluate the evolution
of the orbital elements, a, e, inc, capom and omega in the two reference
systems (ecliptic and invariant plane), we will integrate the orbits of
the four giants into 1Ma. taking as reference the date:
2451544.500000000 = A.D. 2000-Jan-01 00: 00: 00.0000 TDB.

Here,
- a: semi-major axis [au]
- e: eccentricity 
- inc: slope [deg]
- capom: longitude of the ascending node [deg]
- omega: periastro argument. [deg]

To perform these integrations, we will use the
[Swift integration package](https://www.boulder.swri.edu/~hal/swift.html).

The coordinates are in astronomical units [au] and the velocities in
astronomical units per year [au/a]. These values were taken from
[JPL's HORIZONS system](https://ssd.jpl.nasa.gov/horizons.cgi)
