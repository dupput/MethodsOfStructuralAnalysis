clc
clear
array = importdata("lomaprieta.AT2");
data = array.data;

time = [0.005: 0.005: 39.955];
s = size(data);
new = zeros(s(1)*s(2),1);
value = 1;
 for ii = 1: s(1)
     for jj = 1:s(2)
         new(value) = data(ii, jj);
         value = value + 1;
     end    
 end
        
acceleration = rmmissing(new);
plot(time,acceleration)
xlabel("Time (ms)")
ylabel("Acceleration")