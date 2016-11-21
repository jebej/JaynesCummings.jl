#addprocs(4)
using JaynesCummings

N = 16  # N should be larger than the highest resonator initial state
ω_q = 2π*6.57E9
ω_r = ω_q
g = 0.5*2π*19E6
t_f = 200E-9 # final evolution time in sec
t_samples = 200 # number of data points in time evolution
w_samples = 50 # number of points in each dimension of Wigner matrix
#ket = ["|g,1>","1im|g,3>"]
ket = ["|g,0>","3.27|g,3>","2.39|g,6>","0.85|g,9>"] # zombie cat state
#ket = ["|g,0>","0.70710678+0.90710678im|g,3>","1.60254-0.5im|g,4>","-1.6|g,6>"]


# Generate the initial state and the Hamiltonian
ρ = gen_initialstate(N,ket)
H = gen_hamiltonian(N,ω_q,ω_r,g)

# Calculate the time evolution operators for each time
times, U_array = gen_timeevoarray(H,t_f,t_samples)

# Calculate the excited probability of the qubit as a function of time
e_prob = calc_qubittimeevo(ρ,U_array)
plot_qubittimeevo(times,e_prob)

# Calculate the photon numbers in the resonator
photons = calc_photonnumbers(N,g,times,e_prob)
plot_photonnumbers(photons)

# Calculate the density matrix by repeating the above while displacing the resonator
ρ_resonator =  calc_densitymatrix_resonator(N,ρ,g,times,U_array)
plot_densitymatrix(ρ_resonator)

# Calculate the Wigner function (this will take some time)
W = calc_wignerfunction_resonator(N,ρ,g,times,U_array,w_samples)
plot_wignerfunction(W)
