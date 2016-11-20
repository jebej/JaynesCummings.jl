addprocs(4)
using JaynesCummings

N = 16  # N should be at least max(n)+1; where max(n) is the highest resonator initial state
ω_q = 2π*6.57E9
ω_r = ω_q
g = 0.5*2π*19E6
finalTime = 200E-9 # final evolution time in sec
samples = 200 # number of data points in time evolution
wigner_samples = 50 # number of points for the Wigner function 1D sampling (since the function is 2D, total number of points is wigner_samples^2)
#ket = ["|g,1>","1im|g,3>"]
ket = ["|g,0>","3.27|g,3>","2.39|g,6>","0.85|g,9>"] # zombie cat state
#ket = ["|g,0>","0.70710678+0.90710678im|g,3>","1.60254-0.5im|g,4>","-1.6|g,6>"]


# Generate the initial state and the Hamiltonian
ρ = gen_initialstate(N,ket)
H = gen_hamiltonian(ω_q,ω_r,g,N)
time_vec, time_evo_array = gen_timeevoarray(H,finalTime,samples)

# Calculate the excited probability of the qubit as a function of time
excited_prob = calc_qubittimeevo(ρ,time_evo_array)
plot_qubittimeevo(time_vec,excited_prob)

# Calculate the photon numbers in the resonator
photons = calc_photonnumbers(time_vec,excited_prob,N,g)
plot_photonnumbers(photons)

# Calculate the density matrix by repeating the above while displacing the resonator
ρ_resonator =  calc_ρ_resonator_resonator(N,g,ρ,time_vec,time_evo_array)
plot_ρ_resonator(ρ_resonator)

# Calculate the Wigner function (this will take some time)
W = calc_wignerfunction_resonator(N,wigner_samples,g,ρ,time_vec,time_evo_array)
plot_wignerfunction(W)
