# CUBE_AST1601


This is a simulation code forked and simplified from CUBE_XMU
(https://github.com/yuhaoran/CUBE_XMU), solely for the purpose of
showcasing the simple steps of running cosmological simulations to the
students of the SJTU AST1601 class.

The project report should be sent to the instructor's email address with the
title: "AST1601+姓名+bonus project"，and your report should be named
"project3_姓名.pdf". The deadline for submission is by the end of June the 16th,
2024 (Sunday of the 17th week).


This project requires you to learn how to use Linux or Unix operation
system (you need to install a virtual machine or use the ``Window Subsystem
for Linux`` if you use Windows; For MacOS you are already good to go), install 
computational libraries like the FFTW, compile Fortran code, and run a cosmological N-body simulation.
Please follow the 9 steps below carefully.

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
   ``source`` (what is it? you need to find out yourself) the ``module_load_brew.sh file``,
   and try again, until your computer successfully finishes running a simulation and saving
   all the files under the ``output/universe1/`` directory.

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
   

7. For the first simulation, you have used the default cosmological parameters for ``universe1`` (omega_cdm=0.3, s8=0.8). Now
   you need to run two more simulations by changing the ``main/parameters.f90``
   file each time before repeating the steps from 4-6. 1) You need to change the output directory ``opath`` to ``universe2`` (or ``universe3``);
   2) For ``universe2``, you need to change the ``s8`` parameter to 0.9 while
   keeping everything else fixed; 3) For ``universe3``, you need to
   change the ``omega_cdm`` parameter to 0.30 while keeping everything else
   fixed (keeping s8 as 0.8); 4) Make two similar figures as that for ``universe1``.

8. Back to physics: ``s8`` is ``\sigma_8``, the normalization for the ``matter power spectrum`` (we briefly
   mentioned the matter power spectrum when talking about the ``large scale structure``). The higher ``\sigma_8``
   is, the more clumpy the dark matter distribution is. ``omega_cdm`` is the cold dark matter
   density in units of the ``critical density of the Universe``(what is it?), the higher ``omega_cdm`` is, the more dark matter there is in the Universe.
   You need to examine the three figures (mark clearly which is fiducial, which is high-s8, and which is high-omega_cdm) and
   describe how the evolution of the Universe changes after your modified one of the two parameters
   and why. You can also try to modifiy other cosmological parameters in ``parameters.f90`` and see how it affects the growth of the Universe.

9. 你最终的书面大作业报告必须包含：a) 系统的安装步骤，编译器的调试过程，以及程序的运行步骤，并包含必要的debug过程；b）必须对“终端”（terminal）的窗口截屏，显示小宇宙正在运行的状态；c）三个不同宇宙学模型下的simulation在7个不同红移处的大尺度结构，画成7X3的一张pdf大图（必须是pdf格式！其它图片格式会压缩造成图片分辨率降低！），每行代表某一个宇宙学模型的演化，并清晰标记你改变的宇宙学参数，确保你的simulation的分辨率达到nc>64；d）调研并解释sigma8和Omega_cdm的数学定义和物理意义，描述并解释你看到的三个不同宇宙学演化的差别。


Enjoy simulating your own Universes!



