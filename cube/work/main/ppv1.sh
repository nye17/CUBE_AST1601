rm ext_pp_force.o
ln -svf pp_v1.F90 ext_pp_force.f90 && make && ./main.x
