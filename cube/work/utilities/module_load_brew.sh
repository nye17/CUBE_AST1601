export FC='gfortran'
export XFLAG=' -O3 -cpp -mcmodel=medium -fopenmp -fcoarray=single'
export XFLAG_NO_OMP='-O3 -cpp -mcmodel=medium -fcoarray=single'
# export XFLAG=' -cpp -fopenmp -fcoarray=single -fcheck=all'
# export XFLAG='-O3 -cpp -fcoarray=single -fopenmp'
export OFLAG=${XFLAG}' -c'
export OFLAG_NO_OMP=${XFLAG_NO_OMP}' -c'

export FFTFLAG='-I/usr/local/Cellar/fftw/3.3.10_1/include/ -L/usr/local/Cellar/fftw/3.3.10_1/lib/ -lfftw3f -lfftw3 -lfftw3_omp -lfftw3f_omp -lm -ldl'

export OMP_STACKSIZE=6000M
export OMP_NUM_THREADS=12
#export OMP_THREAD_LIMIT=4
ulimit -s 64000
ulimit
