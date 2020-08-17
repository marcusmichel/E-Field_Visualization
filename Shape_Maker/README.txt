***Waveguide Shape Generator****

This is a modified version of Elliot's fortran code for making a spherical shape file.

The file waveguide.f90 creates two rails, and a substrate. 
Each has their own dielectric index--the left rail (-y) is 1, the right rail (+y) is 2, and the substrate is 3. 

For best results, use a dipole spacing that evenly divides into the gap.
As of now, my way of dealing with dipole spacings that don't evenly divide into the gap is to
include an offset--essentially removing a layer of dipoles from the left rail. This offset is helpful
when the dipole spacing is under 10% of the total gap, but hurts accuracy when dipole spacing
is greater than that. Comment in or out that offset accordingly.

***Note***
When the gap between rails isn't evenly divisible by half of the dipole spacing,
this code maintains the width of the gap by simply removing a layer of dipoles
from the left rail. This makes the shape slightly asymmetrical, but minimally so.


***Making a Shape***
In order to execute the code, simply compile using fortran

gfortran waveguide.f90

and execute the output file

./a.out 

which will output a shape.dat file, which can be used in ddscat simulations.
