 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%             kMC Simulation of Point Defects in Si                     %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
clc
rng('shuffle')
 t=0;% Time Step
 x=0:9999;
 y=0:9999 ;
[X,Y]=meshgrid(x,y);%The underlying lattice for the simulation
N = 7;
dx=randi(100,[N,1]);%%Selecting random x values for defects
dy=randi(100,[N,1]);%Selecting random y values for defects 
[Dx,Dy]=meshgrid(dx,dy);%Getting the coordinates of defects
temp=1685;%The initial temperature is set to 50000K
r_rec=1.702;%Recombination Distance
N_iter=0;N_itermax=100;%Setting the number of iterations
type=randi([0,1],[1,N*N]);%Assigning randomly the type of defect
Defect=zeros(N*N,3);%Developing a matrix with coordinates of the defect as well as its type
Defect(1:N*N,3)=type(1,1:N*N);
Defect(1:N*N,1)=reshape(Dx,[],1);
Defect(1:N*N,2)=reshape(Dy,1,[]);
neighbors_count=0; 
for i=1:size(Defect,1)
    plot(Defect(i,1),Defect(i,2),'*');%Plotting the initial defect configuration
    hold on
end
saveas(gcf,"C:\Users\PushkarPC\Desktop\KMC-initial.png");
hold off
pause(2);
%imwrite(Defect(:,1),Defect(:,2),"kMC-initial.png");
N2=N*N;% No. of defects
while N_iter<N_itermax
     for a=1:size(Defect,1)
         neighbors_count=0;
         
         for b=1:size(Defect,1)
             if Defect(a,1)^2+Defect(a,2)^2+r_rec^2>=Defect(b,1)^2+Defect(b,2)^2 && ...
                     ((Defect(a,1)^2+Defect(a,2)^2)^(1/2)+r_rec)^2>=Defect(b,1)^2+Defect(b,2)^2 && ...
                     ((Defect(a,1)^2+Defect(a,2)^2)^(1/2)-r_rec)^2<=Defect(b,1)^2+Defect(b,2)^2
                 if Defect(a,3) ~= Defect(b,3)
                     neighbors_count=neighbors_count+1;
                    
                    neigh_cells(neighbors_count,a)=b;% Storing the indices of neighbors

                 end
             end
         end
         Neighbors(a,1)=neighbors_count;%Storing the number of  neighbors of opposite nature

     end
     %Removing the repeated copy of a neighbor
     for p=1:size(neigh_cells,1)
         for q=1:size(neigh_cells,2)
         neigh=neigh_cells(p,q);
         for r=1:size(neigh_cells,1)
             for s=1:size(neigh_cells,2)
                 if r~=p && s~=q 
                     if neigh_cells(r,s)==neigh
                         neigh_cells(r,s)=0;
                     end 
                 end
             end
         end
         end
     end        
     %Modifying the Neighbors array to effective neighbor count

     for i=1:size(Defect,1)
         neigh_c=0;
         for j=1:size(neigh_cells,1)
             if neigh_cells(j,i)~=0
                 neigh_c=neigh_c+1;

             end
         end
         Neighbors(i,1)=neigh_c;
     end

     % Enacting recombination
     for i=1:size(neigh_cells,2)
         count=0;
         for j=1:size(neigh_cells,1)
             if neigh_cells(j,i)~=0
                 count=count+1;
                 temp_neigh_cells(count,1)=neigh_cells(j,i);
             end  
         end
         int_neigh=randi(length(temp_neigh_cells),1);
         Defect(temp_neigh_cells(int_neigh),1:3)=-1;
         N2=N2-1;
         temp_neigh_cells=ones;
     end
     %Modifying the defect matrix to remove recombined sites
     g=0;
     for p=1:size(Defect,1)
         if Defect(p,1)~=-1
             g=g+1;
             Defect_mod(g,1:3)=Defect(p,1:3);
         end
     end
     for i=1:size(Defect_mod,1)
         if Defect_mod(i,1)~=0 && Defect_mod(i,2)~=0
             plot(Defect(i,1),Defect(i,2),'*');
             hold on
         end
     end
     saveas(gcf,"C:\Users\PushkarPC\Desktop\KMC-after recombination.png");
     hold off
     pause(2);

      %Calculating the jump rates of interstitials and vacancies
      rate_int=1.717*exp(-1.37/8.61733*10^(-5)*temp);
      rate_vac=0.001282*exp(-0.1/8.61733*10^(-5)*temp);
      g=0;
      for k=1:size(Defect_mod,1)
          g=g+1;
          if Defect_mod(k,3)==1

              w(g,1)=rate_int;
          else
              w(g,1)=rate_vac;
          end
      end
      Defect=[Defect_mod w];
      R=zeros(size(Defect,1),1);
       for i=1:size(Defect,1)
           for j=1:i
               R(i,1)=R(i,1)+Defect(j,4);
           end
       end
       R_N=R(size(Defect,1),1);
       u=rand;
       for i=2:size(Defect,1)
           if R(i-1,1)<u*R_N && R(i,1)>u*R_N
               g=randi(4);
               if g==1
                   Defect(i,2)=Defect(i,2)+1;
               elseif g==2
                   Defect(i,1)=Defect(i,1)+1;
               elseif g==3
                   Defect(i,2)=Defect(i,2)-1;
               else
                   Defect(i,1)=Defect(i,1)-1;
               end
           end
       end
       for i=1:size(Defect,1)
           if Defect(i,1)~=0 && Defect(i,2)~=0
               plot(Defect(i,1),Defect(i,2),'*');
               hold on
           end
       end
       saveas(gcf,"C:\Users\PushkarPC\Desktop\KMC-remaining vacancies.png");
       hold off
       pause(2);


     u=rand;
     dt=-log(u)/R_N;
     t=t+dt;
     N_iter=N_iter+1;
end
 
     
              
         
 
     
