[M] = textread('tensor_vso_freq.txt');
%  size(M) %839016*4
%  989*10057*10057
 
M(:,1)=M(:,1)+1;
M(:,2)=M(:,2)+1;
M(:,3)=M(:,3)+1;
P=zeros(1,989);

for i=1:989
    for j=1:839016
        if M(j,1)==i
            P(i)=P(i)+M(j,4);
        end
    end
end

Q=zeros(1,10057);
for i=1:10057
    for j=1:839016
        if M(j,2)==i
            Q(i)=Q(i)+M(j,4);
        end
    end
end

R=zeros(1,10057);
for i=1:10057
    for j=1:839016
        if M(j,3)==i
            R(i)=R(i)+M(j,4);
        end
    end
end

pmi=zeros(1,839016);
for i=1:839016
    if P(M(i,1))>0 && Q(M(i,2))>0 && R(M(i,3))>0
        pmi(i)=M(i,4)*8909701*8909701/(P(M(i,1))*Q(M(i,2))*R(M(i,3)));
    end
end
pmi = log2(pmi);
pmi(pmi<0)=0;
PI=transpose(pmi);
tensor=M(:,4).*PI;

C=[M,tensor];
dlmwrite('PMI.txt',C,'delimiter','\t','precision',5);


% W=textread('W.txt');
% WT=transpose(W); %300*10057
% size(WT(:,1)) %300*1
% WT(:,1).'*WT(:,2) %3.3964e+10
% size(W(1,:)) %1*300
% W(1,:).'*W(2,:)  %300*300
% 
% n=0;
% 
% T=zeros(989,300,300);
% for i=1:989
%     for j=1:10057
%         for k=1:10057
%             t=zeros(1,989);
%             t(i)=1;
%             for l=1:839016
%                 if C(l,1)==i && C(l,2)==j && C(l,3)==k
%                     n=C(l,5);
%                 end
%             end
%             T=T+n *W(j,:).'*W(k,:); 
%         end
%     end
% end
            
            


