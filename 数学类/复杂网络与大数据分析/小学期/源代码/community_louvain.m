function [M,Q]=community_louvain(W,gamma,M0,B)
                         % convert to double format
n=single(length(W));                                % get number of nodes
s=single(sum(sum(W)));                              % get sum of edges

if ~exist('B','var') || isempty(B)
    type_B = 'modularity';
elseif ischar(B)
    type_B = B;
else
    type_B = 0;
    if exist('gamma','var') && ~isempty(gamma)
        warning('Value of gamma is ignored in generalized mode.')
    end
end
if ~exist('gamma','var') || isempty(gamma)
    gamma = 1;
end

if strcmp(type_B,'negative_sym') || strcmp(type_B,'negative_asym')
    W0 = W.*(W>0);                          %positive weights matrix
    s0 = sum(sum(W0));                      %weight of positive links
    B0 = W0-gamma*(sum(W0,2)*sum(W0,1))/s0; %positive modularity
    
    W1 =-W.*(W<0);                          %negative weights matrix
    s1 = sum(sum(W1));                      %weight of negative links
    if s1                                   %negative modularity
        B1 = W1-gamma*(sum(W1,2)*sum(W1,1))/s1;
    else
        B1 = 0;
    end
elseif min(min(W))<-1e-10
    err_string = [
        'The input connection matrix contains negative weights.\nSpecify ' ...
        '''negative_sym'' or ''negative_asym'' objective-function types.'];
    error(sprintf(err_string))              %#ok<SPERR>
end
if strcmp(type_B,'potts') && any(any(W ~= logical(W)))
    error('Potts-model Hamiltonian requires a binary W.')
end

if type_B
    switch type_B
        case 'modularity';      B = single((W-gamma*(sum(W,2)*sum(W,1))/s)/s);
        case 'potts';           B =  W-gamma*(~W);
        case 'negative_sym';    B = B0/(s0+s1) - B1/(s0+s1);
        case 'negative_asym';   B = B0/s0      - B1/(s0+s1);
        otherwise;              error('Unknown objective function.');
    end
else                            % custom objective function matrix as input
    B = double(B);
    if ~isequal(size(W),size(B))
        error('W and B must have the same size.')
    end
end
if ~exist('M0','var') || isempty(M0)
    M0=1:n;
elseif numel(M0)~=n
    error('M0 must contain n elements.')
end

[~,~,Mb] = unique(M0);
Mb = single(Mb);
M = Mb;

B = (B+B.')/2;                                          % symmetrize modularity matrix
Hnm=zeros(n,n,'single');                                         % node-to-module degree
for m=1:max(Mb)                                         % loop over modules
    Hnm(:,m)=sum(B(:,Mb==m),2);
end

Q0 = -inf;
Q = sum(B(bsxfun(@eq,M0,M0.')));                        % compute modularity
first_iteration = true;
while Q-Q0>1e-10
    flag = true;                                        % flag for within-hierarchy search
    while flag
        flag = false;
        for u=randperm(n)                               % loop over all nodes in random order
            ma = Mb(u);                                 % current module of u
            dQ = Hnm(u,:) - Hnm(u,ma) + B(u,u);
            dQ(ma) = 0;                                 % (line above) algorithm condition
            
            [max_dQ,mb] = max(dQ);                      % maximal increase in modularity and corresponding module
            if max_dQ>1e-10                             % if maximal increase is positive
                flag = true;
                Mb(u) = mb;                             % reassign module
                
                Hnm(:,mb) = Hnm(:,mb)+B(:,u);           % change node-to-module strengths
                Hnm(:,ma) = Hnm(:,ma)-B(:,u);
            end
        end
    end
    [~,~,Mb] = unique(Mb);                              % new module assignments
    Mb = single(Mb);
    M0 = M;
    if first_iteration
        M=Mb;
        first_iteration=false;
    else
        for u=1:n                                       % loop through initial module assignments
            M(M0==u)=Mb(u);                             % assign new modules
        end
    end
    
    n=max(Mb);                                          % new number of modules
    B1=zeros(n,'single');                                        % new weighted matrix
    for u=1:n
        for v=u:n
            bm=sum(sum(B(Mb==u,Mb==v)));                % pool weights of nodes in same module
            B1(u,v)=bm;
            B1(v,u)=bm;
        end
    end
    B=B1;
    
    Mb=1:n;                                             % initial module assignments
    Hnm=B;                                              % node-to-module strength
    
    Q0=Q;
    Q=trace(B);                                         % compute modularity
end
