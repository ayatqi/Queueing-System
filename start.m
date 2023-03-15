clear;
clc;

fprintf('Welcome to Hostpital self-service registration! \n\n');
n = input('Please enter number of patients : ');

fprintf('\n\n');
fprintf('___________________________________________________________________\n');
fprintf('           Choose The Random Number Generator List             \n');
fprintf('___________________________________________________________________\n\n');
fprintf('1. Choice 1 (Round Robin)\n');
fprintf('2. Choice 2 (Idle Waiting Rule)\n');
fprintf('___________________________________________________________________\n\n');

choice = input('Please enter random number choice :');
fprintf('\n\n');

if (choice == 1)
    

    for i=1:1
        
        Generate_table();
        
        
        a=(1.*randi(zeros(1,n-1),80*ones(1,n-1))+1).*mod(n-1,2);
        arrival = randi(zeros(1,n),zeros(1,n));
        arrival(1:1,2:n) = a;
        fprintf('Random Number For Inter Arrival Time:    '); disp(a);
        service=(1.*randi(zeros(1,n),40*ones(1,n))+1).*mod(n,3);
        fprintf('Random Number For Service Time      : ');  disp(service);
        %disp(arrival);
        
        
       
        %InterArrival Time Array
        InterArrivalTime = zeros(1,n);
        
      
        for y=1:(n)
           
            if(y == 1)
            InterArrivalTime(y)=(0);
            
            elseif(arrival(y) < 16)
            InterArrivalTime(y)=(1);
            
            elseif(arrival(y) < 41)
            InterArrivalTime(y)=(2);
            
            elseif(arrival(y) < 56)
            InterArrivalTime(y)=(3);
            
            elseif(arrival(y) < 81)
            InterArrivalTime(y)=(4);
            
            else
            InterArrivalTime(y)=(5);
            
            end 
            
        end
           
            AD = 0;
            AT = 0;
            num = 0;
            %Deapart Time Array
            DepartTime = zeros(1,n);
            %Arrival Time Array
            ArrivalTime = zeros(1,n);
            
            
            fprintf('\n____________________________________________________________________________________________________________________________\n');
            fprintf('Arrival and Departure Details:                                                                                               ');
            fprintf('\n____________________________________________________________________________________________________________________________\n');
        
            for y=1:(n) 
            
            num = y+1;
            
            if (y == 1)
            AD = AT + InterArrivalTime(2); 
            DepartTime(y) = (AD);
            else
            AD =  InterArrivalTime(y) + AT;
            DepartTime(y) = AD;
            end 
                        
            fprintf('\nPatient %1d ',y);
            fprintf('arrives at minute %1d',  AT );
            ArrivalTime(y) = AT;
            
            if(num > n)
                num = n-1;
            else 
                AT = AT + InterArrivalTime(num);
            end
            
            fprintf('\nPatient %1d ',y);
            fprintf('departs at minute %1d',  AD ); 
            fprintf('\n\n');
        end
        
       
        fprintf('\n__________________________________________________________________\n');
        fprintf('                       SIMULATION TABLE Part 1                      \n'); 
        fprintf('__________________________________________________________________\n');
        fprintf('Patient   |  RN for              | Inter-arrival  |  Arrival Time   \n');
        fprintf('          |  Inter-arrival Time  | Time           |                 \n');
        fprintf('\n__________________________________________________________________\n');
     
        
        
        for h=1:(n)
            
            fprintf('%5.0f',h);
            fprintf('%22.0f',arrival(h));
            fprintf('%18.0f',InterArrivalTime(h));
            fprintf('%17.0f',ArrivalTime(h));
            fprintf('\n');
            
        end   
        

        fprintf('\n____________________________________________________________________________________________________________________________\n');
        fprintf('                                              SIMULATION TABLE Part 2                                                     ');
        fprintf('\n____________________________________________________________________________________________________________________________\n');
        fprintf('\n          |              |                 kiosk 1               |              kiosk 2                  |         |     ');
        fprintf('\n          |              |                                       |                                       | Waiting | Time'); 
        fprintf('\n Patient  | RN For       | Service | Time Service | Time Service | Service | Time Service | Time Service | time    | spent');
        fprintf('\n          | Service Time | Time    | begins       | ends         | Time    | begins       | ends         |         |      ');
        fprintf('\n____________________________________________________________________________________________________________________________\n');
         
        numK1 = 0;
        numK2 = 0;
        
        % The array size for kiosks depends on the number of patients 
        if(rem(n,2) ==0)
            
            numK1 = n/2;
            numK2 = n/2;
            %kiosk 1 Array
            kisok1 = zeros(1,numK1);
            %kiosk 2 Array
            kisok2 = zeros(1,numK2);
        else
            numK1 = (n+1)/2;
            numK2 = (n - numK1);
            kisok1 = zeros(1,numK1);
            %kiosk 2 Array
            kisok2 = zeros(1,numK2);
        end
            

            for x=1:(n)
                
            if(rem(x,2) == 0)
                
                if(service(x) < 16)
                    kisok2(x)=(1);
            
                elseif(service(x) < 46)
                    kisok2(x)=(2);
            
                elseif(service(x) < 66)
                    kisok2(x)=(3);
            
                elseif(service(y) < 81)
                    kisok2(x)=(4);
            
                else
                    kisok2(x)=(5);
            
                end 
                
             else
                
                if(service(x) < 11)
                    kisok1(x)=(1);
                elseif(service(x) < 36)
                    kisok1(x)=(2);
                elseif(service(x) < 66)
                    kisok1(x)=(3);
                elseif(service(y) < 86)
                    kisok1(x)=(4);
                else
                    kisok1(x)=(5);
            
                end 

                
            end
            
         end    
         
       TSE1 = 0;
       TSE2 = 0;
       %Time Service End Array
       TSEArr=zeros(1,n);
       % Waiting Time
       WT = 0;
       % Waiting Time Arr
       WTArr=zeros(1,n);
       %Total Waiting Time
       TotalWT = 0;
       %Total Time Spent in the registration system
       ATSRSTotal = 0;
       %kiosk 2 Total;
       Totalkisok2 = 0;
       %kiosk 1 Total
       Totalkisok1 = 0;
            
        for y=1:(n)
            
            fprintf('%5.0f     |',y);
            fprintf('%8.0f      |',service(y));
            
            if(rem(y,2) == 0)
            fprintf('%45.0f    |',kisok2(y));
            fprintf('%8.0f      |',ArrivalTime(y));
            TSE2 = kisok2(y) + ArrivalTime(y);
            fprintf('%8.0f      |',TSE2);
            TSEArr(y) = TSE2;

            
            else
                   
            fprintf('%5.0f    |',kisok1(y));
            fprintf('%8.0f      |',ArrivalTime(y));
            TSE1 = kisok1(y) + ArrivalTime(y);
            fprintf('%8.0f      |',TSE1);
            TSEArr(y) = TSE1;

            end
            
            if(y == 1)
                WT = 0;
                fprintf('%45.0f    |',WT);
                WTArr(y) = WT;
            elseif(TSEArr(y-1) > ArrivalTime(y))
                
                WT = TSEArr(y-1) - ArrivalTime(y);
                WTArr(y) = WT;
                if(rem(y,2) == 0)
                    fprintf('%5.0f    |',WT);
                else
                fprintf('%45.0f    |',WT);
                end
            else
                WT = 0;
                WTArr(y) = WT;
                if(rem(y,2) == 0)
                    fprintf('%5.0f    |',WT);
                else
                fprintf('%45.0f    |',WT);
                end
            end
            
            if(rem(y,2) == 0)
            fprintf('%5.0f    ',kisok2(y));
            ATSRSTotal = ATSRSTotal + kisok2(y);
            Totalkisok2 = Totalkisok2 + kisok2(y);
            
            else
               fprintf('%5.0f    ',kisok1(y));
               ATSRSTotal = ATSRSTotal + kisok1(y); 
               Totalkisok1 = Totalkisok1 + kisok1(y);
            end
            
            TotalWT = TotalWT +  WTArr(y);
            
            fprintf('\n');
            
            end

            fprintf('\n____________________________________________________________________________________________________________________________\n');
            fprintf('Results Evaluation:                                                                                               ');
            fprintf('\n____________________________________________________________________________________________________________________________\n\n');

            fprintf('Average Waiting Time : ');
            disp(TotalWT/n);
            fprintf('Average Time Spent in the registration system : ');
            disp(ATSRSTotal/n);
            fprintf('Probability that a patient has to wait : ');
            disp(TotalWT/n);
            fprintf('Average Service Time of Kiosk 1 :');
            disp(Totalkisok1/numK1);
            fprintf('Average Service Time of Kiosk 2 :');
            disp(Totalkisok2/numK2);
            
    end
    


elseif (choice == 2)
    
   for i=1:1
        

       ArrivalTime = 0;
        
       Generate_table();
        
        table =[];
       

    end
    
        fprintf('Random Number For Inter Arrival Time:    ');
        
        for y=1:(n)
            

        arrival =floor(rand()*100) + 1; 
        
        if(y == 1)
            RNInterArrival=0;
            InterArrival = 0;
            ArrivalTime = 0;
            arrival=0;
        end
        %display random number for InterArrival time
        fprintf('%0.0f ',arrival);
       RandNumServTime=floor(rand()*100) + 1;
        
        RNInterArrival = arrival;
       
       
       
        if(y == 1)
            InterArrival=(0);
            
            elseif(arrival < 16)
            InterArrival=(1);
            
           elseif(arrival < 41)
            InterArrival=(2);
            
            elseif(arrival < 56)
            InterArrival=(3);
            
           elseif(arrival < 81)
            InterArrival=(4);
            
            else
           InterArrival=(5);
            
        end 
        
        ArrivalTime = ArrivalTime + InterArrival;
        noOfPatientInSystem = 0;
        K1ServTime = 0;
        K1TimeServBegin = 0;
        K1TimeServEnd = 0;
        K2ServTime = 0;
        K2TimeServBegin = 0;
        K2TimeServEnd =0;
        WaitingTime = 0;
        TimeSpent = 0;
        table = [table;RNInterArrival,InterArrival,ArrivalTime,noOfPatientInSystem,RandNumServTime,K1ServTime,K1TimeServBegin,K1TimeServEnd,K2ServTime,K2TimeServBegin,K2TimeServEnd,WaitingTime,TimeSpent];
        end
        
        
      %display random number for service time
        fprintf('\nRandom Number For Service Time      : ');  for y=1:(n); fprintf('%0.0f ',table(y,5));  end
        
        
            loop = true;
            Queue = [];
            K1_idle = true;
            K2_idle = true;
            K1_end = 0;
            K2_end = 0;
            AT = 0;
            currentTime = 0;
            noOfPatientInCentre = 0;
            
            fprintf('\n________________________________________________________________________________\n');
            fprintf('Arrival & Departure Time Details\n');
            fprintf('________________________________________________________________________________\n');
            
            %The loop will stop when all patients are being served
       while(loop == true)
                   
           %add patient into the queue
            for (y=1:size(table,1))
            AT = table(y,3);
          
                if( AT == currentTime)
                fprintf('\nPatient %1d ',y);
               fprintf('arrives at minute %1d\n',   AT );
               
               Queue = [Queue,y];
                table(y,4) = noOfPatientInSystem;
                noOfPatientInSystem = noOfPatientInSystem + 1;
                end
             
            end
            
            %if Kiosk 1&2 end time equals to current time No. Patient in the system will decrement and message will be prompted
            %remove the finish patient and assign the kiosk back to idle state
            if(K1_end == currentTime)
                K1_idle = true;
                if(K1_end ~= 0)
                    noOfPatientInSystem = noOfPatientInSystem -1;
                    printf('Depature of Patient at minute %0.0f.\n',  K1_end);
                end
            end
            if(K2_end == currentTime)
                K2_idle = true; 
                if(K2_end ~= 0)
                    noOfPatientInSystem= noOfPatientInSystem -1;
                    printf('Depature of Patient at minute %0.0f.\n',  K2_end);
                end
            end
      
            
         %loop through patient queue and assign to kiosk
                
                 for(y = 1:size(Queue,2))
                     if(K1_idle == true)
                         K1_idle = false;
 
                         PatientNo = Queue(1);
                         Queue(1) = [];
                         RandNumServTime = table(PatientNo,5);
                              
                              if(RandNumServTime < 11)
                                  serviceTime=(1);
            
                              elseif(RandNumServTime < 36)
                                  serviceTime=(2);
            
                              elseif(RandNumServTime < 66)
                                  serviceTime=(3);
            
                              elseif(RandNumServTime < 86)
                                  serviceTime=(4);
            
                              else
                                  serviceTime=(5);
                                  
                              end 
            
                         table(PatientNo,6) = serviceTime;
                         table(PatientNo,7) = currentTime;
                         table(PatientNo,8) = currentTime + serviceTime;
                         K1_end = currentTime + serviceTime;
           
                         printf('Patient %0.0f gets service by K1 at minute %0.0f \n', PatientNo, currentTime);
                     elseif(K2_idle == true)
                         K2_idle = false;
                         
                         PatientNo = Queue(1);
                         Queue(1) = [];
           
                         RandNumServTime = table(PatientNo,5);
                         
                         
                              if(RandNumServTime < 16)
                                  serviceTime=(1);
            
                              elseif(RandNumServTime < 46)
                                  serviceTime=(2);
            
                              elseif(RandNumServTime < 66)
                                  serviceTime=(3);
            
                              elseif(RandNumServTime < 81)
                                  serviceTime=(4);
            
                              else
                                  serviceTime=(5);
            
                              end 
                         
                         table(PatientNo,9) = serviceTime;
                         table(PatientNo,10) = currentTime;
                         table(PatientNo,11) = currentTime + serviceTime;
                         K2_end = currentTime + serviceTime;
                         
                         printf('Patient %0.0f gets service by K2 at minute %0.0f \n', PatientNo, currentTime);
                    
                     end
                 end
                 
                 largestArrivalTime = table(size(table,1),3);
                 currentTime = currentTime + 1;
                 
                 if(size(Queue,2) == 0 & K1_idle == true & K2_idle == true & currentTime > largestArrivalTime)
                     loop = false;
                 end
         
        end
            
        fprintf('\n____________________________________________________________________________________\n');
        fprintf('                              SIMULATION TABLE Part 1                           \n');
        fprintf('____________________________________________________________________________________\n');
        fprintf('Patient   |  RN for              | Inter-arrival  |  Arrival Time |  No. of patient \n');
        fprintf('          |  Inter-arrival Time  | Time           |               | in the system \n');
        fprintf('____________________________________________________________________________________\n');
     
        
        Ps=0;
        Patient= zeros(1,10);
        totalWaitingTime=0;
        TotTimeSpend=0;
        AvgServT1=0;
        AvgServT2=0;
        ServT1count=0;
        ServT2count=0;
        
        %display table part 1 info
        for y=1:(n)
            
            RNInter = table(y,1);
            InterArrivalTime = table(y,2);
            AT = table(y,3);
            NoPatientInSystem = table(y,4);
            fprintf('%5.0f',y);
            fprintf('%22.0f',RNInter);
            fprintf('%18.0f',InterArrivalTime);
            fprintf('%17.0f',AT);
            fprintf('%15.0f',NoPatientInSystem);
            fprintf('\n');
            
        end
        
        
        fprintf('\n____________________________________________________________________________________________________________________________\n');
        fprintf('                                              SIMULATION TABLE Part 2                                                     ');
        fprintf('\n____________________________________________________________________________________________________________________________\n');
        fprintf('\n          |              |                 kiosk 1               |              kiosk 2                  |         |     ');
        fprintf('\n          |              |                                       |                                       | Waiting | Time'); 
        fprintf('\n Patient | RN For       | Service | Time Service | Time Service | Service | Time Service | Time Service | time    | spend');
        fprintf('\n          | Service Time | Time    | begins       | ends         | Time    | begins       | ends         |         |      ');
        fprintf('\n____________________________________________________________________________________________________________________________\n');
        %Calculate waiting time and time spend
        for(y=1:size(table,1))
    
 
            AT = table(y,3);
            K1ServBegin = table(y,7);
            K2ServBegin = table(y,10);
            
            K1ServT = table(y,6);
            K2ServT = table(y,9);
    
            if(K2ServT > 0)
                ServBegin = K2ServBegin;
            else
                ServBegin = K1ServBegin;
            end
    
            WT = ServBegin - AT;
            table(y,12) = WT;
            totalWaitingTime = totalWaitingTime + WT;
    
            if(K1ServT > 0)
                ServiceT = K1ServT;
                AvgServT1 = AvgServT1 + K1ServT;
                ServT1count = ServT1count + 1;
            else
                ServiceT = K2ServT;
                AvgServT2 = AvgServT2 + K2ServT;
                ServT2count = ServT2count + 1;
             
            end
    
            TimeSpend = WT + ServiceT;
            TotTimeSpend = TotTimeSpend + TimeSpend;
            table(y,13) = TimeSpend;
        end
        %display table part 2 info
         for y=1:(n)
            
            RandNumServTime = table(y,5);
            K1ServTime = table(y,6);
            K1TimeServBegin = table(y,7);
            K1TimeServEnd = table(y,8);
            K2ServTime = table(y,9);
            K2TimeServBegin = table(y,10);
            K2TimeServEnd =table(y,11);
            WaitingTime = table(y,12);
            TimeSpend = table(y,13);
            
            fprintf('%5.0f',y);
            if(RandNumServTime==0)
                fprintf('         -   ');
            else
            fprintf('%13.0f',RandNumServTime);
            end
            if(K1ServTime==0)
                fprintf('            - ');
                fprintf('           - ');
                fprintf('           -');
            else
            fprintf('%13.0f',K1ServTime);
            fprintf('%13.0f',K1TimeServBegin);
            fprintf('%13.0f',K1TimeServEnd);
            end
            if(K2ServTime==0)
                fprintf('            - ');
                fprintf('           - ');
                fprintf('           -');
            else
            fprintf('%13.0f',K2ServTime);
            fprintf('%13.0f',K2TimeServBegin);
            fprintf('%13.0f',K2TimeServEnd);
            end
            
            fprintf('%13.0f',WaitingTime);
            fprintf('%13.0f',TimeSpend);
            fprintf('\n--------------------------------------------------------------------------------------------------------------------------\n');
            
        end
    %statistics
         fprintf('\n____________________________________________________________________________________________________________________________\n');
            fprintf('Results Evaluation:                                                                                               ');
            fprintf('\n____________________________________________________________________________________________________________________________\n\n');

            fprintf('Average Waiting Time : ');
            disp(totalWaitingTime/n);
            fprintf('Average Time Spent in the registration system : ');
            disp(TotTimeSpend/n);
            fprintf('Probability that a patient has to wait : ');
            disp(totalWaitingTime/n);
            fprintf('Average Service Time of Kiosk 1 :');
            disp(AvgServT1/ServT2count);
            fprintf('Average Service Time of Kiosk 2 :');
            disp(AvgServT2/ServT2count);
    
    
else
    fprintf('Incorect Choice \n\n');
end


