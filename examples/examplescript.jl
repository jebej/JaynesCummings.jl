addprocs(4)
using JaynesCummings

cutoffN = 12  #cutoffN should be at least max(n)+1; where max(n) is the highest resonator initial state
qubit_freq = 2*pi*6.57E9
resonator_freq = qubit_freq
coupling_freq = 0.5*2*pi*19E6
finalTime = 200E-9 # final evolution time in sec
samples = 200 # number of data points in time evolution
wigner_samples = 50 # number of points for the Wigner function 1D sampling (since the function is 2D, total number of points is wigner_samples^2)
#ket = ["|g,1>","1im|g,3>"]
ket = ["|g,0>","0.70710678+0.90710678im|g,3>","1.60254-0.5im|g,4>","-1.6|g,6>"]


# Generate the initial state and the hamiltonian
initialstate = gen_initialstate(cutoffN,ket)
hamiltonian = gen_hamiltonian(qubit_freq,resonator_freq,coupling_freq,cutoffN,0)
time_vec, time_evo_array = gen_timeevoarray(hamiltonian,finalTime,samples)

# Calculate the excited probability of the qubit as a function of time
excited_prob = calc_qubittimeevo(initialstate,time_evo_array)
plot_qubittimeevo(time_vec,excited_prob)

# Calculate the photon numbers in the resonator
photons = calc_photonnumbers(time_vec,excited_prob,cutoffN,coupling_freq)
plot_photonnumbers(photons)

# Calculate the density matrix by repeating the above while displacing the resonator
densitymatrix =  calc_densitymatrix_resonator(cutoffN,coupling_freq,initialstate,time_vec,time_evo_array)
plot_densitymatrix(densitymatrix)

# Calculate the Wigner function (this will take some time)
wignerfunction = calc_wignerfunction_resonator(cutoffN,wigner_samples,coupling_freq,initialstate,time_vec,time_evo_array)
plot_wignerfunction(wignerfunction)
