# RippleEvol
The repository contains the cases for JGR-Earth Surface (2021JF006132R) publication.
7 cases are simulated to study the effect  of wave period on ripple evolution and equilibrium geometry.
for each case the set up files (initial and boundary condition, solvers and schemes) are provided.
###############################################################################################################
To simulate each case:
A- Run the 1DV (sheet flow case for t=0-250sec)
(1) foamClearPolyMesh
(2) blockMesh
(3) writeCellcenters -time 0
(4) funkySetFields -time 0
(5) sedFoam (you can make the parallel if you want)

B- Map the final sediment concentration field (t=250sec) to ripple shape
(1) copy 1DV directory to each case directory
(2) in MATLAB directory run the PlotProfiles.m to read the sedFoam output and save them.

C- Run the 2DV Ripple case
(1) foamClearPolyMesh
(2) blockMesh
(3) writeCellcenters -time 0
(4) funkySetFields -time 0 (this will read the output of stage B(2) and map it to ripple shape)
(5) sedFoam (you can make the parallel if you want)

Note: For Case2, Case3, Case4 and Case5 the final ripple profile of Case1 is utilized as the initial ripple bed.
