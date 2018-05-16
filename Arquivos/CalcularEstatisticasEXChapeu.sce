//Carrega tabela drinks editada
arquivo = csvRead("drinksEdit.csv",[],[],["string"],[],[],[],1);
A = strtod(arquivo(:,3:5));
b = strtod(arquivo(:,6));

//Calcular xChapeu para matriz inteira
xChapeu = (A' * b)\(A' * A)

//Criar Matriz com os Clusters criados
MCluster1A = [];
MCluster2A = [];
MCluster3A = [];
MCluster4A = [];

MCluster1B = [];
MCluster2B = [];
MCluster3B = [];
MCluster4B = [];

//Cluster 1
[rowsC,colsC]=size(ClusterA);
for i=1:colsC
    MCluster1A = cat(1,MCluster1A,A(ClusterA(i),:));
    MCluster1B = cat(1,MCluster1B,b(ClusterA(i),:));
end

//Cluster 2
[rowsC,colsC]=size(ClusterB);
for i=1:colsC
    MCluster2A = cat(1,MCluster2A,A(ClusterB(i),:));
    MCluster2B = cat(1,MCluster2B,b(ClusterB(i),:));
end

//Cluster 3
[rowsC,colsC]=size(ClusterC);
for i=1:colsC
    MCluster3A = cat(1,MCluster3A,A(ClusterC(i),:));
    MCluster3B = cat(1,MCluster3B,b(ClusterC(i),:));
end

//Cluster 4
[rowsC,colsC]=size(ClusterD);
for i=1:colsC
    MCluster4A = cat(1,MCluster4A,A(ClusterD(i),:));
    MCluster4B = cat(1,MCluster4B,b(ClusterD(i),:));
end

//Calcular xChapeu para cada Cluster
xChapeu1 = (MCluster1A' * MCluster1B)\(MCluster1A' * MCluster1A);
xChapeu2 = (MCluster2A' * MCluster2B)\(MCluster2A' * MCluster2A);
xChapeu3 = (MCluster3A' * MCluster3B)\(MCluster3A' * MCluster3A);
xChapeu4 = (MCluster4A' * MCluster4B)\(MCluster4A' * MCluster4A);

//Reconher Informações estatisticas
//Matriz Completa
MediaATotal = mean(A,'r');
MediaBTotal = mean(b);
MedianaATotal = median(A,'r');
MedianaBTotal = median(b);
VarianciaATotal = variance(A,'r');
VarianciaBTotal = variance(b);
DesvioPadraoATotal = stdev(A,'r');
DesvioPadraoBTotal = stdev(b);

//Cluster 1
MediaA1 = mean(MCluster1A,'r');
MediaB1 = mean(MCluster1B);
MedianaA1 = median(MCluster1A,'r');
MedianaB1 = median(MCluster1B);
VarianciaA1 = variance(MCluster1A,'r');
VarianciaB1 = variance(MCluster1B);
DesvioPadraoA1 = stdev(MCluster1A,'r');
DesvioPadraoB1 = stdev(MCluster1B);

//Cluster 2
MediaA2 = mean(MCluster2A,'r');
MediaB2 = mean(MCluster2B);
MedianaA2 = median(MCluster2A,'r');
MedianaB2 = median(MCluster2B);
VarianciaA2 = variance(MCluster2A,'r');
VarianciaB2 = variance(MCluster2B);
DesvioPadraoA2 = stdev(MCluster2A,'r');
DesvioPadraoB2 = stdev(MCluster2B);

//Cluster 3
MediaA3 = mean(MCluster3A,'r');
MediaB3 = mean(MCluster3B);
MedianaA3 = median(MCluster3A,'r');
MedianaB3 = median(MCluster3B);
VarianciaA3 = variance(MCluster3A,'r');
VarianciaB3 = variance(MCluster3B);
DesvioPadraoA3 = stdev(MCluster3A,'r');
DesvioPadraoB3 = stdev(MCluster3B);

//Cluster 4
MediaA4 = mean(MCluster4A,'r');
MediaB4 = mean(MCluster4B);
MedianaA4 = median(MCluster4A,'r');
MedianaB4 = median(MCluster4B);
VarianciaA4 = variance(MCluster4A,'r');
VarianciaB4 = variance(MCluster4B);
DesvioPadraoA4 = stdev(MCluster4A,'r');
DesvioPadraoB4 = stdev(MCluster4B);
