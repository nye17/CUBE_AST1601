module parameters
  implicit none
  save
  ! output directory (change this if you don't want your data overwritten!!!)
  character(*),parameter :: opath='../../output/universe1/'

  ! simulation parameters
  integer(8),parameter :: izipx=2 ! size to store xp as
  integer(8),parameter :: izipv=2 ! size to store vp as
  integer(8),parameter :: izipx_nu=2 ! size to store xp_nu as
  integer(8),parameter :: izipv_nu=2 ! size to store vp_nu as
  integer(8), parameter :: izipi = 1 ! if neutrino ids are on, size to store as

  integer(8),parameter :: nvbin=int(2,8)**(8*izipv)
  integer(8),parameter :: nvbin_nu=int(2,8)**(8*izipv_nu)
  integer(8),parameter :: ishift=-(int(2,8)**(izipx*8-1))
  integer(8),parameter :: ishift_nu=-(int(2,8)**(izipx_nu*8-1))
  real(8),parameter :: rshift=0.5-ishift
  real(8),parameter :: rshift_nu=0.5-ishift_nu

  ! (hereafter 'number of fine cells' = 'nf')
  ! (hereafter 'number of coarse cells' = 'nc')
  ! (hereafter 'per dimension' = '/dim')
  integer(8),parameter :: nn=1 ! number of imgages (nodes) /dim
  integer(8),parameter :: ncore=32
  integer(8),parameter :: n_nest=1 ! number of nested threads
  integer(8),parameter :: ncell=4 ! number of nf in each nc, /dim
  integer(8),parameter :: nnt=2 ! number of tiles /image/dim
  integer(8),parameter :: nc=128 ! nc/image/dim, in physical volume, >=24
  integer(8),parameter :: nt=nc/nnt ! nc/tile/dim, in physical volume, >=12

  integer(8),parameter :: nf=nc*ncell ! >=96
  integer(8),parameter :: nf_global=nf*nn
  integer(8),parameter :: nc_global=nc*nn
  integer(8),parameter :: nft=nt*ncell ! >=48 ! nf/tile/dim

  ! ngrid /image/dim for pencil-fft
# ifdef FFTFINE
    integer(8),parameter :: ng=nf ! fine grid fft, for IC, dsp, convert_zip_to_xv
# else
    integer(8),parameter :: ng=nc ! coarse grid fft, for N-body main code
# endif
  integer(8),parameter :: npen=ng/nn ! ng /dim in shorter side of the pencil, for pencil decomposition
  integer(8),parameter :: ng_global=ng*nn
  integer(8),parameter :: nyquist=ng_global/2

  integer(8),parameter :: ncb=6 ! nc in buffer /dim, single side; 6 by default
  integer(8),parameter :: nce=nc+2*ncb ! extended nc
  integer(8),parameter :: nte=nt+2*ncb ! extended nt

  integer(8),parameter :: nfb=ncb*ncell ! 24
  integer(8),parameter :: nf_cutoff=16 ! beyond this length, fine force is zero

  integer(8),parameter :: nfe=nft+2*nfb ! 96

  logical,parameter :: body_centered_cubic=.false.
  integer(8),parameter :: np_nc=ncell ! number of particles / coarse cell / dim
  integer, parameter :: np_nc_nu = ncell/2 ! number of neutrinos per dim per coarse cell

  logical,parameter :: Extended_pp_force=.false.
  real,parameter :: rsoft=0.3 ! PP softening length
  integer,parameter :: pp_range=1 ! set <=4
  real,parameter :: image_buffer=1.5
  real,parameter :: tile_buffer=2.5
  real,parameter :: vbuf=0.9

  real,parameter :: pi=4*atan(1.)

  ! cosmological parameters
  real,parameter :: box=300*nn  ! simulation scale /dim, in unit of Mpc/h
  real,parameter :: s8=0.80 ! use -Dsigma_8 in initial_conditions
  integer,parameter :: zdim=2 ! the dimension being the redhisft direction

  real,parameter :: z_i_nu=5.0 ! initial redshift for neutrinos
  real,parameter :: a_i_nu=1./(1.+z_i_nu) ! initial scale factor for neutrinos
  real,parameter :: z_tf=5 ! redshift of transfer functions

  ! neutrino parameters
  real, parameter :: Tcmb = 2.7255
  real, parameter :: Tcnb = (4./11.)**(1./3.)*Tcmb ! temperature for active neutrinos

  integer, parameter :: Nnu = 3 ! number of massive neutrinos
  real, dimension(Nnu), parameter :: Mnu = (/ 0.,0.,0. /)
  real, dimension(Nnu), parameter :: Tnu = (/ Tcnb,Tcnb,Tcnb /)
  real, parameter :: Meff = sum( Mnu*(Tnu/Tcnb)**3. )

  integer, parameter :: Nur = 0 ! number of massless neutrinos
  real, parameter :: Tur = Tcnb ! temperature of massless neutrinos
  real, parameter :: Neff = Nur*(Tur/Tcnb)**4.

  ! background parameters
  real, parameter :: h0 = 0.7

  real, parameter :: omega_g = 2.471*10**(-5.)/h0**2. ! photon energy
  real, parameter :: omega_u = Nur*(7.*pi**4/180.)*Tur*(Tur/Tcnb)**3./94.1/h0**2 ! ur energy
  real, parameter :: omega_r = omega_g+omega_u ! total radiation

  real, parameter :: omega_cdm = 0.2500 ! cdm energy
  real, parameter :: omega_bar = 0.0462 ! baryon energy, goes into cdm
  real, parameter :: omega_mhd = 0.0 ! mhd energy, evolved separately
  real, parameter :: omega_nu = sum( Mnu*(Tnu/Tcnb)**3 )/94.1/h0**2 ! nu energy
  real, parameter :: omega_m = omega_cdm+omega_bar+omega_mhd+omega_nu ! total matter
  real, parameter :: f_nu=omega_nu/omega_m
  real, parameter :: f_cdm=1-f_nu

  !real, parameter :: omega_l = 1-omega_m-omega_r
  real, parameter :: omega_l = 1-omega_m
  real, parameter :: wde = -1 ! de equation of state

  ! initial conditions
  real,parameter :: f_nl=0
  real,parameter :: g_nl=0
  real,parameter :: n_s=0.96
  real,parameter :: A_s=2.46e-9
  real,parameter :: k_o=0.05/h0

  integer(8),parameter :: istep_max=250000
  real,parameter :: ra_max=0.2
  real(8),parameter :: v_resolution=2.1/(int(2,8)**(izipv*8))
  real(8),parameter :: x_resolution=1.0/(int(2,8)**(izipx*8))
  real(8),parameter :: v_resolution_nu=2.1/(int(2,8)**(izipv_nu*8))
  real(8),parameter :: x_resolution_nu=1.0/(int(2,8)**(izipx_nu*8))
  !real(8),parameter :: vdisp_boost=1.0
  real(8),parameter :: vrel_boost=2.5

  !! MPI image variables !!
  integer(8) image,rank,icx,icy,icz,inx,iny,inz,ipx,ipy,ipz
  integer(8) m1,m2,m3,m
  logical head
  ! checkpoint variables
  integer(8),parameter :: nmax_redshift=1000
  integer(8) n_checkpoint[*],n_halofind[*]
  real z_checkpoint(nmax_redshift)[*],z_halofind(nmax_redshift)[*]
  logical checkpoint_step[*],halofind_step[*],final_step[*]

  type sim_header
    integer(8) nplocal,npglobal,nplocal_nu,npglobal_nu
    integer(8) izipx,izipv,izipx_nu,izipv_nu
    integer(8) image
    integer(8) nn,nnt,nt,ncell,ncb
    integer(8) timestep
    integer(8) cur_checkpoint
    integer(8) cur_halofind

    real a, t, tau
    real dt_pp, dt_fine, dt_coarse, dt_vmax, dt_vmax_nu
    real mass_p_cdm,mass_p_nu
    real box

    real h0
    real omega_m
    real omega_l
    real s8
    real vsim2phys
    real sigma_vres
    real sigma_vi
    real sigma_vi_nu
    real z_i,z_i_nu
    real vz_max
  endtype

  type(sim_header) sim[*]

  contains
    subroutine print_header(s)
      type(sim_header),intent(in) :: s
      if (this_image()==1) then
      print*,'-------------------------------- CUBE info --------------------------------'
      print*,'| np local/global =',s%nplocal,s%npglobal
      print*,'|    (neutrinos)  =',s%nplocal_nu,s%npglobal_nu
      print*,'| a,t,tau         =',s%a,s%t,s%tau
      print*,'| timestep        =',s%timestep
      print*,'| dt pp,f,c       =',s%dt_pp,s%dt_fine,s%dt_coarse
      print*,'| dt v,v_nu       =',s%dt_vmax,s%dt_vmax_nu
      print*,'| cur_checkpoint  =',int(s%cur_checkpoint,2)
      print*,'| cur_halofind    =',int(s%cur_halofind,2)
      print*,'| mass_p  c/nu    =',s%mass_p_cdm,s%mass_p_nu
      print*,'| '
      print*,'| box             =',s%box, 'Mpc/h'
      print*,'| image           =',s%image
      print*,'| nn              =',s%nn
      print*,'| nnt             =',s%nnt
      print*,'| nt              =',s%nt, ' ( nf_tile=',int(ncell*(nt+2*ncb),2),')'
      print*,'| ncell           =',s%ncell
      print*,'| ncb             =',s%ncb
      print*,'| izip x,v        =',int(s%izipx,1),int(s%izipv,1)
      print*,'| izip x,v(nu)    =',int(s%izipx_nu,1),int(s%izipv_nu,1)
      print*,'| '
      print*,'| h_0             =',s%h0,'*100 km/s/Mpc'
      print*,'| omega_m         =',s%omega_m
      print*,'| omega_l         =',s%omega_l
      print*,'| sigma_8         =',s%s8
      print*,'| vsim2phys       =',s%vsim2phys, '(km/s)/(1.0)'
      print*,'| sigma_vres      =',s%sigma_vres,'(km/s)'
      print*,'| sigma_vi        =',s%sigma_vi,'(simulation unit)'
      print*,'| sigma_vi_nu     =',s%sigma_vi_nu,'(simulation unit)'
      print*,'| z_i             =',s%z_i
      print*,'| z_i_nu          =',s%z_i_nu
      print*,'| vz_max          =',s%vz_max
      print*,'------------------------------------------------------------------------------'
      endif
      sync all
    endsubroutine

    include 'basic_functions.f08'
endmodule
