function [pv,s] = predict(data,p,n)
pv = zeros(1,n);
len = length(data);
s = zeros(1,len+n);
s(1:len) = data;
for i = 1:n
   pv(i) = LSE_FIR(s(1:len+i-1),p);
   s(len+i) = pv(i);
end