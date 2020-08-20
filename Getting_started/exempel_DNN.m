          x=[500 900 1200 1700 2100 2500 3100 4200 5400 7000];

          lag=3;    
          iinput=x; 
          n=length(iinput);

          inputs=zeros(lag,n-lag);
          for i=1:n-lag
              inputs(:,i)=iinput(i:i+lag-1)';
          end
          targets=x(lag+1:end);

          hiddenLayerSize = 10; 
          net = fitnet(hiddenLayerSize);

          net.divideParam.trainRatio = 70/100;
          net.divideParam.valRatio = 15/100;
          net.divideParam.testRatio = 15/100;

          [net,tr] = train(net,inputs,targets);

          yn=net(inputs);
          errors=targets-yn;
          figure, ploterrcorr(errors)                     
          %figure, parcorr(errors)                         
          %[h,pValue,stat,cValue]= lbqtest(errors)        
          figure,plotresponse(con2seq(targets),con2seq(yn)) 
          %figure, ploterrhist(errors)                   
          %figure, plotperform(tr)                        

          fn=5;  
          f_in=iinput(n-lag+1:end)';
          f_out=zeros(1,fn);  

          for i=1:fn
              f_out(i)=net(f_in);
              f_in=[f_in(2:end);f_out(i)];
          end

          figure,plot(2006:2015,iinput,'b',2015:2020,[iinput(end),f_out],'r')