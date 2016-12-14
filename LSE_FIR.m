function [pv,M,N,a] = LSE_FIR(data,p)
%输入一维向量data，滤波器的阶数p,用最小二乘法原理的有限阶滤波器返回预测值pv（predicted value）
n = 2*p;
X = zeros(n,p);
len = length(data);
y = data(len-n+1:len);
y = y';
for i = 1:n
    X(i,:)=data(len-p+i-n:len-n+i-1);
end
%求预测系数a向量
D = X'*X;
B = y'*X;
M = zeros(p,p);
for k = 1:p
    for i = 1:p
       M(k,i) = D(i,k) + D(k,i); 
    end
end
N = 2*B';
a = M\N;
pv = 0;
for i = 1:p
   pv = pv +a(i)*y(n-p+i);
end