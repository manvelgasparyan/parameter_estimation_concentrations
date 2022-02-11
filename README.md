This repository contains the Matlab library corresponding to the manuscript "Parameter estimation for models of chemical reaction networks from partial experimental data of species' concentrations" published in "The Journal". The manuscript is available at "the website".

The MATLAB library uses the information of a given CRN and the available observed time-series partial experimental data of species' concentrations provided by the user to automatically determine the best-fitting values of the parameters contained in the corresponding mathematical model. 

We have provided two real-life computaional models of biologial processes retrieved from the BioModels database (see, [1] and https://www.ebi.ac.uk/biomodels/). We consider a model of nicotinic acetylcholine receptors (NAR, [2]) and a model of trypanosoma brucei trypanothione synthetase (TBTS, [3]). The schematic representations of these two models can be found in the file named "Schematic" located in the folder "Figures".  For each of these models we first generate data corresponding to the concentrations of some of the species with initially provided values of parameters involved in the model. Next, we perturbe these data with a white Gaussian noise with zero mean and sfficiently small standard deviation. We then apply our parameter estimation technique to determine the best-fitting values of parameters in a fully automated model.

For each of these models, since we are not conducting experiments, we generate data corresponding to the reaction rates using the values of parameters provided in the corresponding reference. Next, we perturb with a white Gaussian noise with zero mean and sufficiently small standard deviation. We then apply our estimation technique to determine the best-fitting values of parameters in a fully automated manner. 

The Matlab library uses the information of a given chemical reaction network provided by the user to automatically estimate the parameters involved in the corresponding mathematical model.
             
The automatic parameter estimation procedure provides the following outputs:

     1. The generated time-series partial data of species' concentrations.
     2. The mathematical model with the best-fitting values of parameters. 
     3. The complete Kron-reduced mathematical model with the corresponding best-fitting values of parameters.
     4. The comparison of the time-series partial data of species' concentrations and the corresponding model-predicted valeus. 
     5. The comparison of the concentration profiles of the species' concentrations involved in the Kron-reduced model and the time-series partial data of species' concentrations.
     
REFERENCES

[1]  Nicolas Le Novere et al. 
     Biomodels Database: a Free, Centralized Database of Curated, Pub647 lished, Quantitative Kinetic Models of Biochemical and Cellular Systems. 
     Nucleic Acids Research, 34:D689–D691, 2006.

[2]  Stuart J. Edelstein, Olivier Schaad, Eric Henry, Daniel Bertrand, and Jean-Pierre Changeux. 
     A kinetic mechanism for nicotinic acetylcholine receptors based on multiple allosteric transitions. 
     Biological Cybernetics, 75(5):361—379, 1996.
     
[3]   Alejandro E. Leroux, Jurgen R. Haanstra, Barbara M. Bakker, and R. Luise Krauth-Siegel. 
      Dissecting the catalytic mechanism of trypanosoma brucei trypanothione synthetase by kinetic analysis and computational modeling. 
      Journal of Biological Chemistry, 288(33):23751–23764, 2013.
