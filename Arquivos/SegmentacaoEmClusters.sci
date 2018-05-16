//Ler Matriz de vizinhança
exec('C:\Users\erick\Desktop\Projeto Matematica\neighborhood.m',-1)
N = M;

//Tamanho de Linhas e Colunas
[rowsN,colsN]=size(N);

//Criar matriz identidade com o mesmo tamanho
MatrizIdentidade = eye(rowsN,colsN);

//Somar Valores da coluna da Matriz N
SomaN = sum(N,"r");

//Criar matriz de peso das arestas
for i=1:rowsN
    MatrizIdentidade(i,i) = SomaN(i);
end

//Matriz Laplaciana
L = MatrizIdentidade-N;

//Autovalores e Autovetores
[Ve,Va]=spec(L);

//Vetor com valores dos autovalores
[AVa] = diag(Va);

//Pegar segundo menor valor
[mMin,nMin]=min(AVa);
[mMax,nMax]=max(AVa);
AVa(nMin) = mMax;
[mMin,nMin]=min(AVa);

//Coluna de AutoVetores
ColunaCluster = Ve(:,nMin);

//Separar valores em dois clusters, armazenando em cada um seus respectivos index
Cluster1a = [];
Cluster2a = [];

for i=1:rowsN
   if ColunaCluster(i) > 0 then
     Cluster1a = cat(2,Cluster1a,i)
   else 
     Cluster2a = cat(2,Cluster2a,i);
   end
end

//Separa os clusters para realizar nova iteração para gerar um total de 4 clusters
MatrizA = [];
MatrizB = [];

[rowsN,colsN]=size(Cluster1a);
for i=1:colsN
   aux = []; 
   for j=1:colsN
       aux = cat(2,aux,N(Cluster1a(i),Cluster1a(j)))
   end
   MatrizA = cat(1,MatrizA,aux)
end

[rowsN,colsN]=size(Cluster2a);
for i=1:colsN
   aux = []; 
   for j=1:colsN
       aux = cat(2,aux,N(Cluster2a(i),Cluster2a(j)))
   end
   MatrizB = cat(1,MatrizB,aux)
end

//Agora que separamos a MatrizA e Matriz B, iremos repetir o mesmo processo para geração de novos Clusters.
//A parte a seguir não será comentada por ser exatamente o processo anterior
N = MatrizA;
[rowsN,colsN]=size(N);
MatrizIdentidade = eye(rowsN,colsN);
SomaN = sum(N,"r");

for i=1:rowsN
    MatrizIdentidade(i,i) = SomaN(i);
end

L = MatrizIdentidade-N;
[Ve,Va]=spec(L);
[AVa] = diag(Va);

[mMin,nMin]=min(AVa);
[mMax,nMax]=max(AVa);
AVa(nMin) = mMax;
[mMin,nMin]=min(AVa);

ColunaCluster = Ve(:,nMin);

ClusterA = [];
ClusterB = [];

for i=1:rowsN
   if ColunaCluster(i) > 0 then
     ClusterA = cat(2,ClusterA,Cluster1a(i))
   else 
     ClusterB = cat(2,ClusterB,Cluster1a(i));
   end
end

//Criar cluster 3 e 4
N = MatrizB;
[rowsN,colsN]=size(N);
MatrizIdentidade = eye(rowsN,colsN);
SomaN = sum(N,"r");

for i=1:rowsN
    MatrizIdentidade(i,i) = SomaN(i);
end

L = MatrizIdentidade-N;
[Ve,Va]=spec(L);
[AVa] = diag(Va);

[mMin,nMin]=min(AVa);
[mMax,nMax]=max(AVa);
AVa(nMin) = mMax;
[mMin,nMin]=min(AVa);

ColunaCluster = Ve(:,nMin);

ClusterC = [];
ClusterD = [];

for i=1:rowsN
   if ColunaCluster(i) > 0 then
     ClusterC = cat(2,ClusterC,Cluster2a(i))
   else 
     ClusterD = cat(2,ClusterD,Cluster2a(i));
   end
end
