# set up the compiler and its environment
source ../utilities/module_load_brew.sh

cd ../utilities/
# clean up the directory
make clean
# compile necessary binary executables for the simulation.
make ic.x dsp.x cicpower.x
# generate initial conditions for the simulation.
./ic.x

cd ../main/
make clean
# compile the main simulation code.
make
# run the simulation
./main.x

cd ../utilities/
# convert particle distribution to density field.
./cicpower.x

cd ../main/
