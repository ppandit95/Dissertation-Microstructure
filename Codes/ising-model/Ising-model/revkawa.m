function sp=revkawa(spin,k,N,n,temp)
 switch(n)
            case 1
                if rem(k,N)==1
                        spin(k+N-1)=spin(k);
                        spin(k)=temp;
                else
                    spin(k-1)=spin(k);
                    spin(k)=temp;
                end
                
                
            case 2
                if rem(k,N)==0
                        spin(k-N+1)=spin(k);
                        spin(k)=temp;
                else
                    spin(k+1)=spin(k);
                    spin(k)=temp;
                end
                
                
            case 3
                if fix(k/N)==0
                        spin(N*N-(N-rem(k,N)))=spin(k);
                        spin(k)=temp;
                         elseif fix(k/N)==1
                            spin(N*N)=spin(k);
                            spin(k)=temp;
                
                else
                    spin(k-N)=spin(k);
                    spin(k)=temp;
                end
              
                
            case 4
                if fix(k/N)==N-1
                    if rem(k,N)==0
                         spin(k+N)=spin(k);
                        spin(k)=temp;
               
                    else
                        spin(rem(k,N))=spin(k);
                        spin(k)=temp;
                    end
                     elseif fix(k/N)==N
                     spin(k)=spin(N);
                    spin(N)=temp;
                else
                    spin(k+N)=spin(k);
                    spin(k)=temp;
                end
                 case 5
                if rem(k,N)==1
                        spin(k+N-1)=spin(k);
                        spin(k)=temp;
                else
                    spin(k-1)=spin(k);
                    spin(k)=temp;
                end
                if fix(k/N)==0
                        spin(N*N-(N-rem(k,N)))=spin(k);
                        spin(k)=temp;
                         elseif fix(k/N)==1
                            spin(N*N)=spin(k);
                            spin(k)=temp;
                
                else
                    spin(k-N)=spin(k);
                    spin(k)=temp;
                end
              
            case 6
               if fix(k/N)==0
                        spin(N*N-(N-rem(k,N)))=spin(k);
                        spin(k)=temp;
                         elseif fix(k/N)==1
                            spin(N*N)=spin(k);
                            spin(k)=temp;
                
                else
                    spin(k-N)=spin(k);
                    spin(k)=temp;
               end
                 if rem(k,N)==0
                        spin(k-N+1)=spin(k);
                        spin(k)=temp;
                else
                    spin(k+1)=spin(k);
                    spin(k)=temp;
                end
                
              
            case 7
                if rem(k,N)==0
                        spin(k-N+1)=spin(k);
                        spin(k)=temp;
                else
                    spin(k+1)=spin(k);
                    spin(k)=temp;
                end
                 if fix(k/N)==N-1
                    if rem(k,N)==0
                         spin(k+N)=spin(k);
                        spin(k)=temp;
               
                    else
                        spin(rem(k,N))=spin(k);
                        spin(k)=temp;
                    end
                     elseif fix(k/N)==N
                     spin(k)=spin(N);
                    spin(N)=temp;
                else
                    spin(k+N)=spin(k);
                    spin(k)=temp;
                end
                
            case 8 
                if fix(k/N)==N-1
                    if rem(k,N)==0
                         spin(k+N)=spin(k);
                        spin(k)=temp;
               
                    else
                        spin(rem(k,N))=spin(k);
                        spin(k)=temp;
                    end
                     elseif fix(k/N)==N
                     spin(k)=spin(N);
                    spin(N)=temp;
                else
                    spin(k+N)=spin(k);
                    spin(k)=temp;
                end
                 if rem(k,N)==1
                        spin(k+N-1)=spin(k);
                        spin(k)=temp;
                else
                    spin(k-1)=spin(k);
                    spin(k)=temp;
                end
                
 end
        sp=spin;
end