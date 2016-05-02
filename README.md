JaynesCummings.jl
========

The JaynesCummings module implements (very basic for now...) various function to simulate a time independent Jaynes-Cummings model. With the included functions, it is possible to generate an initial state (a qubit resonator system) and compute its time evolution. From the qubit's excited state time evolution, it is possible to perform tomography of the initial resonator state (that is we can reconstruct the initial density matrix of the resonator).

Jaynes-Cummings.jl is currently a work-in-progress side project and is not meant to be used for anything other that satisfying your curiosity.

# TODO
1. Write tests and benchmarks to track progress
1. Implement parallel processing
1. Find a single package to plot everything
1. Replace time evolution with legit master equation, taking into account dephasing / relaxation
1. Full system tomography