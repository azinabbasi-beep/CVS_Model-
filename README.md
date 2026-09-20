Cardiovascular System (CVS) Model and PSO Optimization
This repository contains the MATLAB/Simulink model and optimization scripts used in the study to investigate cardiovascular system (CVS) behavior under normal and pathological conditions.
•	Model Structure
The main Simulink model is “CVS Model”. It contains four overall circuit configurations representing:
-	Normal condition (no disease): shown in blue
-	Aortic stenosis: shown in red
-	Hypertrophic cardiomyopathy: shown in green
-	Aortic regurgitation: shown in yellow
The four conditions are represented within the same overall CVS model. The disease states are distinguished and investigated by changing the corresponding model parameters. The model outputs generated from the different circuit configurations are used to characterize the cardiovascular responses under normal and pathological conditions.
•	Optimization Code
The optimization procedure is demonstrated using the aortic stenosis condition. The provided scripts contain the objective function and the particle swarm optimization (PSO) procedure used for parameter tuning.

1. tunningpulsepressure:
This MATLAB function defines the objective (cost) function used during optimization.
The candidate parameter vector K is assigned to the MATLAB base workspace and the corresponding Simulink model is simulated. Two pressure-related model outputs are then extracted and compared using the mean squared error (MSE). The objective function can be summarized as:
function cost = tunningpulsepressure(K)
assignin('base','K',K);
sim('StenosisDisease.slx');
A=NormalAorta1.data
B=stenosis.data
cost=immse(A,B);
Here, A and B are obtained from the Simulink simulation outputs. The optimization algorithm minimizes the MSE between these two signals.

2. PSO:
The PSO script implements the particle swarm optimization algorithm used to identify the optimized model parameters. The optimization is performed for four parameters. The parameter bounds are:
lb = [0.3,0.5,16,1.5];
ub = [5,3,20,3];
The main PSO settings are:
-	Number of particles: 50
-	Maximum number of iterations: 5
-	Cognitive coefficient (c1): 2
-	Social coefficient (c2): 2
Maximum and minimum particle velocities are defined as 20% of the parameter search range in each direction. The inertia weight is varied during the optimization from wMax = 1000 to wMin = 0.1.
For each particle, the objective function is evaluated, and the particle's personal best (PBEST) and the global best (GBEST) are updated. Particle velocities and positions are subsequently updated subject to the predefined parameter and velocity bounds.
The convergence of the optimization is recorded in cgCurve and plotted at the end of the optimization.

3. Disease-State Analysis:
The complete CVS Model contains the four cardiovascular conditions described above. The optimization code provided in this repository illustrates the parameter optimization procedure for the aortic stenosis condition.
The same general modeling framework is used to represent the other disease states by changing the corresponding model parameters.
