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
title('���-�����ֲ�');
ylabel('���');
xlabel('����');
subplot(1,2,2);
loglog(x,y,'b.');
title('˫���������ķֲ�');

