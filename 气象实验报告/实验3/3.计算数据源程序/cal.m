clc
clear
load data.mat
[m ,n] = size(data);

Data=zeros(37584,368+8);
temp=1;
t=1;
for i=1:m
    for j=1:32
        Data(temp,t)=data(i,j);
        t=t+1;
        if t>=368
            break;
        end
    end
    if t>=368
        temp=temp+1;
        t=1;
    end
end

[m,n]=size(Data);
mynumber=zeros(5,1);
mydata=zeros(100,368+8);
t=1;
tt=1;
for i=1:m
    temp=Data(i,1);
    if mod(temp,100)==03
        mydata(tt,:)=Data(i,:);
        tt=tt+1;
        flag=1;
        for j=1:t
            if temp==mynumber(j,1)
                flag=0;
                break;
            end
        end
        if flag
            mynumber(t)=temp;
            t=t+1;
        end
    end
end

[m,n]=size(mydata);
ji_jie=[100,220,220,100];
for k=1:m
    now=1;
    for i=3:368
        if mydata(k,i)==32766||mydata(k,i-2)==32766||mydata(k,i-1)...
                ==32766|| mydata(k,i+1)==32766||mydata(k,i+2)==32766
            continue;
        end
        if now <=2
            if mydata(k,i)>=ji_jie(now)   
                for j=i:i+10
                    if j>367||j-2<3   
                        break;
                    end
                    sum1=mydata(k,j-2)+mydata(k,j-1)+...
                        mydata(k,j)+mydata(k,j+1)+mydata(k,j+2);
                    sum2=mydata(k,j-1)+mydata(k,j)+...
                        mydata(k,j+1)+mydata(k,j+2)+mydata(k,j+3);
                    sum3=mydata(k,j)+mydata(k,j+1)+...
                        mydata(k,j+2)+mydata(k,j+3)+mydata(k,j+4);
                    sum4=mydata(k,j+1)+mydata(k,j+2)+...
                        mydata(k,j+3)+mydata(k,j+4)+mydata(k,j+5);
                    sum5=mydata(k,j+2)+mydata(k,j+3)+...
                        mydata(k,j+4)+mydata(k,j+5)+mydata(k,j+6);
                    sum1=sum1/5;sum2=sum2/5;sum3=sum3/5;sum4=sum4/5;sum5=sum5/5;
          
                    if sum1>=ji_jie(now)&&sum2>=ji_jie(now)&&sum3>=ji_jie(now)... 
                            &&sum4>=ji_jie(now)&&sum5>=ji_jie(now)
                        for jj=j-2:j+2  
                            if mydata(k,jj)>=ji_jie(now)
                                 mydata(k,370+now-1)=jj-3+1;
                                 break;
                            end
                        end
                        now=now+1; 
                        break;
                    end
                end
            end
        else
            if mydata(k,i)<ji_jie(now)
                for j=i:i+10
                    if j>367||j-2<3
                        break;
                    end
                    sum1=mydata(k,j-2)+mydata(k,j-1)+...
                        mydata(k,j)+mydata(k,j+1)+mydata(k,j+2);
                    sum2=mydata(k,j-1)+mydata(k,j)+...
                        mydata(k,j+1)+mydata(k,j+2)+mydata(k,j+3);
                    sum3=mydata(k,j)+mydata(k,j+1)+...
                        mydata(k,j+2)+mydata(k,j+3)+mydata(k,j+4);
                    sum4=mydata(k,j+1)+mydata(k,j+2)+...
                        mydata(k,j+3)+mydata(k,j+4)+mydata(k,j+5);
                    sum5=mydata(k,j+2)+mydata(k,j+3)+...
                        mydata(k,j+4)+mydata(k,j+5)+mydata(k,j+6);
                    sum1=sum1/5;sum2=sum2/5;sum3=sum3/5;sum4=sum4/5;sum5=sum5/5;
                    if sum1<ji_jie(now)&&sum2<ji_jie(now)&&sum3<ji_jie(now)...
                            &&sum4<ji_jie(now)&&sum5<ji_jie(now)
                        if abs(mydata(k,370+now-2)-j+2)<=40
                            continue;
                        end
                        for jj=j-2:j+2
                            if mydata(k,jj)< ji_jie(now)
                                 mydata(k,370+now-1)=jj-3+1;
                                 break;
                            end
                        end
                        now=now+1;
                        break;
                    end
                end
            end
        end
        if now>=5
            break;
        end
    end
end


        