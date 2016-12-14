function x =powerlaw(sd,n)
x = zeros(1,n);
m = max(sd);
y = m/n:m/n:m;
j = 1;
for i=1:n
    while j~=length(sd) && sd(j)<i*m/n
       x(i)= x(i)+1;
       j = j+1;
    end
end
subplot(1,2,1);
plot(x,y,'b.');
title('误差-数量分布');
ylabel('误差');
xlabel('数量');
subplot(1,2,2);
loglog(x,y,'b.');
title('双对数处理后的分布');

