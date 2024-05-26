# CUBE_AST1601


This is a simulation code forked and simplified from CUBE_XMU
(https://github.com/yuhaoran/CUBE_XMU), solely for the purpose of
showcasing the simple steps of running cosmological simulations to the
students of the SJTU AST1601 class.


This project requires you to learn how to use Linux or Unix operation
system (you need to install a virtual machine or use the Window Subsystem
for Linux if you use Windows), install computational libraries like the
FFTW, compile Fortran code, and run a cosmological N-body simulation.

1. Once you finished setting up your Linux/Unix (included in Mac OS)
   environment, clone or download the CUBE_AST1601 code into your local
   directory.

2. Follow the manual under the ``manual`` directory to install the necessary
   fortran compiler and FFTW libraries into your OS. You will need to learn
   to use the Linux/Unix ``terminal``, and probably need to seek help from
   the internet or those who have experience with programming to solve all
   the issues along the way. You will probably be super frustrated if you
   have never done this before, but remember: ``this frustration is the
   whole point of the project`` --- solving practical problems to set up a
   correct programming environment for doing research (or anything
   challenging) in the future.

3. Before you start running the simulation, make sure you have enough storage
   space --- As a first run or if your computer is relatively slow, you can go
   to ``main/parameters.f90`` and change the value of ``nc`` from ``128`` to ``32``.
   This number determines the resolution of the simulation --- the lower ``nc``
   is, the faster the simulation runs and the less storage the output needs. For
   the final figure, you need to set the value of ``nc`` to at least higher than
   ``64`` (it must be a power of 2).

4. Modify the ``utilities/module_load_brew.sh`` file to adapt to your own
   computer, and follow each step in the ``main/AST1601.sh`` file to generate
   the initial condition (ic.x), run the main simulation (main.x), and convert
   the simulation results from particle positions into a cold dark matter
   density field (cicpower.x). Whenever you encounter an error, modify and
   ``source`` the module_load_brew.sh file, and try again, until you computer
   successfully finish running a simulation and saving all the files under the
   ``output/universe1/`` directory.

5. Find the "X.XXX_delta_c_1.bin" files output by CUBE. Those are the
   smoothed density fields of the large-scale structures in binary data
   format. "X.XXX" indicates the redshift of the output. By default you
   will have 7 redshifts in the output directory.

6. Read the files (the default grid number is 256x256, so each binary can be
   read into a 2D array; see the manual). Make a plot exactly the same as the
   one below (except for the density field from the simulation).  You can take a
   look at the ``visualization/Plot_slice.m`` file for some hints.

   ![alt text](https://github.com/nye17/CUBE_AST1601/blob/main/density_evolution.png)
   Fig. 1 : The evolution of a Universe simulated by CUBE.
   

7. For the first simulation, you have used the default cosmological parameters for ``universe1``. Now
   you need to run two more simulations by changing the ``main/parameters.f90``
   file each time before repeating the steps from 4-6. 1) You need to change the output directory ``opath`` to ``universe2`` (or ``universe3``);
   2) For ``universe2``, you need to change the ``s8`` parameter to 0.9 while
   keeping everything else fixed; 3) For ``universe3``, you need to
   change the ``omega_cdm`` parameter to 0.30 while keeping everything else
   fixed (keeping s8 as 0.8); 4) Make two similar figures as that for ``universe1''.

9. Back to physics: ``s8`` is ``\sigma_8``, the normalization for the matter power spectrum. The higher it
   is, the more clumpy the Universe becomes. ``omega_cdm`` is the cold dark matter
   density in units of the ``critical density``(what is it? google it!), the higher it is, the denser the
   Universe becomes. You need to examine the three figures and describe how the
   evolution of the Universe changes after your modified one of the two parameters
   and why.



