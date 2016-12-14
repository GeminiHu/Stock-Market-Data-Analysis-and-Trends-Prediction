function [me,stde,e,pv] = compare(data,p)
len = length(data);
pv = zeros(1,len);
e = zeros(1,len);
pv(1:3*p) = data(1:3*p);
for i = 3*p:len-1
    pv(i+1) = LSE_FIR(data(1:i),p);
    e(i+1) = abs(pv(i+1)-data(i+1))/data(i+1);
end
e = e(3*p+1:end);
me = mean(e);
stde = std(e);