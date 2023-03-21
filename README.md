# Normalization_Monosensitive: A tool for the normalization of mono-sensitive active material behavior
The provided software tool is a Matlab application (.mlapp). It performs the normalization procedure according to [Ehrenhofer2018a] of a mono-sensitive active material behavior. An example material according to [Ehrenhofer2016] is provided. 

The Graphical User Interface consists of 3 sections:

1. The input of the behavior. Here, it can be chosen, which kind of material behavior is used.
(i) Analytical dummy functions like the error function (erf) and the tangens hyperbolicus function (tanh) with the parameters a (stretch), b (slope), c (reference point) and d (ordinate) can be defined.
(ii) It is also possible to choose a material from a file. Then, it can be chosen what kind of data is provided: 1D (diameter/length), 2D (area) or 3D (volume, e.g. from the mass) data can be provided. It is then divided by a correction factor, which can, e.g., be used to transform the data into the SI unit system.
After choosing (i) or (ii), the "Run input" button has to be pressed. This leads to the plot of the input function in the respective axes (for (ii), first a file has to be chosen).

2. The second part of the program performs the normalization acccording to [Ehrenhofer2018a]. Further details can be found in [Ehrenhofer2017, Ehrenhofer2018b]. Therefore, it can chosen if the model kinematics should be linear or nonlinear. This leads to a different definition of the expansion coefficient (linear: alpha, nonlinear: beta), see [Ehrenhofer2016, Ehrenhofer2018a]. Furthermore, it can be chosen, if the reference state is computed at the inflexion point of a (sigmoid) function or a free value "Ref" can be provided. Ref has to be in the stimulus range. Finally, it can be chosen if the stimulus axis should be normalized as well, which is important for any non-temperature stimuli

3. In the output section, it can be chosen, if a standard name should be given or if the name should be chosen from the filename input field. The order of the values that are exported to the to-be-created file can be chosen as well.


The output file is a list of stimulus values and corresponding expansion coefficients.This list can be imported to Finite Element tools like Abaqus or Ansys. Then, a temperature change can be applied to gain an output of the active material. Please note that the reference state of the temperature has to be chosen adequately: If the stimulus axis was normalized, the reference temperature is 1, if not, then it is the chosen reference value for the derivation of the expansion coefficients.

# Target group:
The tool is provided to engineers and scientists working in the field of active materials. Basic knowledge of handling Matlab is required. The model has to be chosen according to the Finite Element software. For example, using Abaqus with thermal expansion (*EXPANSION) requires the linear model. If *NLGEOM is to be switched on, the nonlinear model is required.

# Getting started:
The Matlab App can be opened directly in Matlab. The source code and the interface can be viewed and changed in the Matlab App Designer. The input file from which the active behavior should be extracted should be structured in the same way as the example provided: A list with the headers "Stimulus-Value | Active-Value", where the Stimulus-Value can be any physical value, such as temperature; and Active-Value is diameter/surface-area/volume data for the free active deformation (e.g., swelling) of the sample. 

# Sources:
[Ehrenhofer2018a] Ehrenhofer, A.; Elstner, M. & Wallmersperger, T.
Normalization of Hydrogel Swelling Behavior for Sensoric and Actuatoric Applications, Sensors and Actuators B: Chemical, 2018, 255(2), 1343 - 1353

[Ehrenhofer2016] Ehrenhofer, A.; Bingel, G.; Paschew, G.; Tietze, M.; Schröder, R.; Richter, A. & Wallmersperger, T. Permeation Control in Hydrogel-Layered Patterned PET Membranes with Defined Switchable Pore Geometry - Experiments and Numerical Simulation Sensors and Actuators B: Chemical, 2016, 232, 499-505

[Ehrenhofer2017] Ehrenhofer, A. & Wallmersperger, T. Hydrogels for engineering: Normalization of swelling due to arbitrary stimulus, Proc. SPIE 10163, Electroactive Polymer Actuators and Devices XIX, 2017, 10163, 1016321-15

[Ehrenhofer2018b] Ehrenhofer, A. & Wallmersperger, T. A normalization concept for smart material actuation by the example of hydrogels, Proc. Appl. Math. Mech., 2018: 1-2 e201800176.

# Final notes:
The software is referenced in Zenodo.
I would be happy about your feedback and comments via Github.
I thank the DFG for the funding of the Research Training Group DFG-GRK1865 'Hydrogel-based microsystems', the Free State of Saxony & TU Dresden for the funding of the Dresden Center for Intelligent Materials, and my colleagues at the Institute of Solid Mechanics at TU Dresden for their support.

