function [best_p,minimum] = find_best_p(data)
len = length(data);
mean_value = ones(1,len);
hwait=waitbar(0,'请等待>>>>>>>>');
for p = 2:len/3-1
     if len/3-p-6<=2
        waitbar(p/(len/3-2),hwait,'即将完成');
     else
        str=['已完成',num2str(100*p/(len/3-2)),'%'];
        waitbar(p/(len/3-2),hwait,str);
    end
    pv = zeros(1,len);
    d = zeros(1,len);
    pv(1:3*p) = data(1:3*p);
    for i = 3*p:len-1
        pv(i+1) = LSE_FIR(data(1:i),p);
        d(i+1) = (pv(i+1)-data(i+1))/data(i+1);
    end
    mean_value(p) = mean(abs(d(3*p+1:end)));
end
[minimum,best_p] = min(mean_value);
waitbar(p/(len/3-2),hwait,'已完成'); 