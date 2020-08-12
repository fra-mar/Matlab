% training with loops in matlab

N=20;
                           %my_matrix doesn´t need to be defined
for i= 1:N                 % no ':' needed at the end
    my_matrix(i) = i^2;    % ';' prevents showing each value as the loop goes
end

my_matrix(1:6)              %indexes are included, both, and start in 1


                    %now with if
num = randi(100)
if num < 34
   sz = 'low'
elseif num < 67
   sz = 'medium'    %look! just excluding ';' prints the answer!!!
else
   sz = 'high'
end

for ii=1:10
    ff(1,ii)=rand*ii;
    if ff(1,ii) <3
        ff(2,ii)=0;
    elseif ff(1,ii) >3
        ff(2,ii)=1;
    end
end
ff
