Installing and Running OpenMPI
==============================

 * Download OpenMPI from http://www.open-mpi.org/software/ompi/v1.8/. Note that Boost 1.48 uses OpenMPI 1.3 (http://www.open-mpi.org/software/ompi/v1.3/downloads/openmpi-1.3.4.tar.bz2), so this version should be installed if using this version of Boost.
 * Extract the archive
 * Switch to the new directory
 * Run `./configure`
 * Run `sudo make all install`
 * To run two instances of a single program (e.g., mpi-test), run `mpirun -np 2 mpi-test`. Sample code for mpi-test.cpp to test mpirun can be found at http://www.boost.org/doc/libs/1_48_0/doc/html/mpi/getting_started.html.
 * To run a instances of two program (e.g., mpi-test and mpi-test2), run `mpirun -np 1 mpi-test : -np 1 mpi-test2`
