[V] = textread('mat.txt'); % Read in matrix data got from R
size(V); %10057*1996
PI_2D=PMI_2D(V); % PMI 
VW=times(V,PI_2D); % Get PMI weighted matrix
k=300; % Given in the paper
%[W,H] = nnmf(VW,k,n.beta = 1);  %10057*300
[W, H, bDsave] = betaNMF(VW,k,100,1)
dlmwrite('W.txt',W,'delimiter','\t','precision',5);

% 
% [M] = textread('tensor_vso_freq.txt');
%  size(M) %839016*4
% M(:,1)=M(:,1)+1;
% for i=1:989
%     if M(
%     P(i)=M
% P=cell2mat(accumarray(M(:,1),M(:,4),[],@(x){sum(x)}));
% size(P)
% 
% groupid = [1; 1; 1; 2; 2; 3; 3;]; 
% value=[1;2;3;4;5;6;7]; 
% gcs = cell2mat(accumarray(groupid,value,[],@(x){cumsum(x)}))
% 
% W=textread('W.txt');
% WT=transpose(W); %300*10057