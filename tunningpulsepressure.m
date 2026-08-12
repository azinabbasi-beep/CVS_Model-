function cost = tunningpulsepressure(K)
assignin('base','K',K);
sim('StenosisDisease.slx');
A=NormalAorta1.data
B=stenosis.data
cost=immse(A,B);