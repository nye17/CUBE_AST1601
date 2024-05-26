# CUBE_AST1601


This is a simulation code forked and simplified from CUBE_XMU
(https://github.com/yuhaoran/CUBE_XMU), solely for the purpose of
showcasing the simple steps of running cosmological simulations to the
students of the SJTU AST1601 class.


This project requires you to learn how to use Linux or Unix operation
system (you need to install a virtual machine or use the Window Subsystem
for Linux if you use Windows), install computational libraries like the
FFTW, compile Fortran code, and run a cosmological N-body simulation.

1. Once you finished setting up your Linux/Unix environment, clone or
   download the CUBE_AST1601 code into your local directory.

2. Follow the manual under the ``manual`` directory to install the necessary
   fortran compiler and FFTW libraries into your OS. You probably need to seek
   help from the internet or those who have experience with programming to solve
   all the issues along the way. This is the whole point of the project ---
   solving practical problems to set up a correct programming environment for
   doing research.

3. Modify the ``utilities/module_load_brew.sh`` file to adapt to your own
   computer, and follow each step in the ``main/AST1601.sh`` file to generate
   the initial condition (ic.x), run the main simulation (main.x), and convert
   the simulation results from particle positions into a cold dark matter
   density field (cicpower.x). Whenever you encounter an error, modify and
   ``source`` the module_load_brew.sh file, and try again, until you computer
   successfully finish running a simulation and saving all the files under the
   ``output/universe1/`` directory.

4. Find the "X.XXX_delta_c_1.bin" files output by CUBE. Those are the
   smoothed density fields of the large-scale structures in binary data
   format. "X.XXX" indicates the redshift of the output. By default you
   will have 7 redshifts in the output directory.

5. Read the files (the default grid number is 256x256, so each binary can
   be read into a 2D array; see the manual). Make a plot exactly the same as the one below (except for the density field from the simulation).
   You can take a look at the ``visualization/Plot_slice.m`` file for some hints.


.. figure:: https://github.com/nye17/CUBE_AST1601/blob/main/density_evolution.png
   :scale: 80%
   Fig. 1 : The evolution of a Universe simulated by CUBE.
   

7. For the first simulation, you use the default cosmological parameters. Now
   you need to run two more simulations by changing the ``main/parameters.f90``
   file. You need to change the output directory ``opath`` to ``universe2`` (or ``universe3``), 
   for ``universe2``, you need to change the ``s8`` parameter to 0.9 while
   keeping everything else fixed; Meanwhile for ``universe3``, you need to
   change the ``omega_cdm'' parameter to 0.30 while keeping everything else
   fixed (keeping s8 as 0.8). Make similar plots as that for ``universe1''.

8. ``s8`` is ``\sigma_8``, the normalization for the matter power spectrum. The higher it
   is, the more clumpy the Universe becomes. ``omega_cdm`` is the cold dark matter
   density in the unit of the critical density, the higher it is, the denser the
   Universe becomes. You need to examine the three figures to describe how the
   evolution of the Universe changes after your change one of the two parameters
   and why.



