# Project-2--SEM-Path-Model

Project Overview
This project investigates the relationship between personal growth initiative, identity formation, self-esteem, and depressive symptoms using structural equation modelling (SEM).
The analysis is based on published summary statistics from a sample of 551 adolescents and young adults and examines whether the relationship between personal growth initiative and psychological well-being is mediated by different identity-formation processes.
The project demonstrates the specification, estimation, evaluation, and modification of structural equation models in R.
Research Question
Does identity formation mediate the relationship between personal growth initiative and psychological well-being, specifically self-esteem and depressive symptoms?
The hypothesised model includes four dimensions of personal growth initiative:
- Readiness for change
- Planfulness
- Using resources
- Intentional behaviour
These are linked to five identity-formation processes:
- Commitment making
- Identification with commitment
- Exploration in breadth
- Exploration in depth
- Ruminative exploration
The two outcome variables are:
- Self-esteem
- Depressive symptoms
Data
The analysis uses the correlation matrix and summary statistics reported by Luyckx and Robitschek (2014).
Characteristic	Description
Sample size	551
Population	Adolescents and young adults
Age range	14–35 years
Country	Belgium
PGI variables	4
Identity variables	5
Outcome variables	2
Total observed variables	11


The R script reconstructs the correlation and covariance matrices from published correlations, standard deviations, and the reported sample size. As a result, no separate raw-data file is required to run the analysis.
Analysis
1. Reconstructing the covariance matrix
The published correlation matrix is entered directly into R and converted into a covariance matrix using the reported standard deviations.
This allows the structural model to be estimated from summary-level information rather than individual-level observations.
2. Specifying the structural model
The model represents relationships between personal growth initiative, identity-formation processes, self-esteem, and depressive symptoms.
The script specifies:
- Regression paths between variables
- Residual variances
- Covariances between theoretically related constructs
3. Model estimation
Models are estimated using the lavaan package with Wishart maximum likelihood estimation.
Model fit is evaluated using:
- Chi-square test of exact fit
- Root Mean Square Error of Approximation (RMSEA)
- Comparative Fit Index (CFI)
4. Model modification
The analysis evaluates model fit and investigates whether the initial specification can be improved.
Modification indices are inspected, additional parameters are introduced sequentially, and nested models are compared using likelihood-ratio tests.
The workflow also tracks changes in:
- Chi-square
- RMSEA
- CFI
across successive models.
5. Model comparison and visualisation
The script compares successive SEM specifications and extracts model-fit statistics for plotting.
Line plots are used to visualise changes in:
- RMSEA
- Chi-square
- CFI
across the fitted models.
Methods & R Packages
library(lavaan)
library(semPlot)
library(corrplot)
library(tidyverse)
The main statistical methods used in this project include:
- Structural equation modelling
- Path analysis
- Mediation modelling
- Covariance modelling
- Modification indices
- Nested-model comparison
- Likelihood-ratio testing
- Model-fit evaluation
- Standardised effect interpretation
Model Fit
Model fit is evaluated using several complementary indices.
Chi-square evaluates exact model fit, while RMSEA evaluates approximate fit and CFI compares the specified model with a more restrictive baseline model.
The analysis additionally visualises how these indices change during model modification.
Repository Structure
Project-2---SEM/
│
├── Project 2.R
│   └── R code for covariance-matrix reconstruction,
│       SEM estimation, model modification,
│       model comparison, and visualisation
│
├── Project 2.docx
│   └── Written research report describing the theoretical model,
│       methodology, results, and interpretation
│
└── README.md
    └── Project documentation
Running the Analysis
1. Clone or download the repository.
2. Open Project 2.R in RStudio.
3. Install the required packages if necessary.
4. Run the script sequentially from top to bottom.
Because the covariance matrix is reconstructed directly from published summary statistics, no separate raw-data file is required.
Skills Demonstrated
- Structural equation modelling in R
- Path-model specification
- Mediation modelling
- Model identification
- Covariance-matrix reconstruction
- Evaluation of SEM fit statistics
- Interpretation of modification indices
- Nested-model comparison
- Statistical visualisation
- Reproducible quantitative research
- Translation of theoretical hypotheses into statistical models
Reference
Luyckx, K., & Robitschek, C. (2014). Personal growth initiative and identity formation in adolescence through young adulthood: Mediating processes on the pathway to well-being. Journal of Adolescence, 37(7), 973–981.
Author
Laura Maria Fetz
