%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%           Simulation of Ising Model using Kawasaki Dynamics           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear all
N=128; % Size of the domain
spin=randi([0 1],N*N,1); %Randomly selecting ground state configuration

  r=N;c=N;
Spin=reshape(spin,N,N);
           imagesc((1:c)+0.5, (1:r)+0.5, Spin);
           colormap(gray);                              
           axis equal     
           pause(0.2)

for MCS=1:10000
    for lattice=1:N*N
        k=randi(N*N); %Randomly selecting a site
        
        [Neighbor,n]=neighbor8(spin,k,N); % Calcualting neighborhood based on Periodic BC
        Energy_old=0;
        Energy_new=0;
        Energy_old=energy(spin,k,Neighbor,n); % Calculating energy of the configuration
        
      [spin,ne]=kawasaki(spin,k,N,n); %Spin after kawasaki dynamics
        Energy_new=energy(spin,k,Neighbor,n);
        
        dE=Energy_new-Energy_old;
         if dE>0
             if rand()>exp(-dE/0.0001)
                spin=revkawa(spin,k,N,n,spin(k));%After reverse swapping            
             end
             
         end
      
           
    end
    
%   r=N;c=N;
% Spin=reshape(spin,N,N);
%            imagesc((1:c)+0.5, (1:r)+0.5, Spin);
%            colormap(gray);                              
%            axis equal     
%            pause(10000)
end

    