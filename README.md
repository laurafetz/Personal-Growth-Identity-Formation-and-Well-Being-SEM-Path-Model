# Project-2--SEM-Path-Model
# Personal Growth, Identity Formation, and Well-Being in R

This project examines whether identity formation mediates the relationship between personal growth initiative and psychological well-being, specifically self-esteem and depressive symptoms.

The analysis was conducted in **R** using structural equation modelling, covariance matrix reconstruction, model comparison, modification indices, fit statistics, and path analysis.

## Research Question

Does identity formation mediate the relationship between personal growth initiative and self-esteem and depressive symptoms?

## Data

The analysis is based on published summary statistics from **551 adolescents and young adults aged 14–35 years in Belgium**.

The dataset contains eleven variables:

| Variable            | Description                                                      |
| ------------------- | ---------------------------------------------------------------- |
| `Change`            | Readiness for change                                             |
| `Planfulness`       | Ability to plan personal growth                                  |
| `Resources`         | Use of resources for personal growth                             |
| `Intention`         | Intentional behaviour related to personal growth                 |
| `Commitment`        | Commitment making                                                |
| `Identification`    | Identification with commitment                                   |
| `ExploreBreadth`    | Exploration in breadth                                           |
| `ExploreDepth`      | Exploration in depth                                             |
| `ExploreRum`        | Ruminative exploration                                           |
| `SelfEsteem`        | Self-esteem                                                      |
| `Depression`        | Depressive symptoms                                              |

The R script reconstructs the correlation and covariance matrices from the published correlations, standard deviations, and sample size.

## Analysis

The analysis consists of several steps:

1. **Correlation and covariance matrices**
   The published correlations are entered into R and converted into a correlation matrix and covariance matrix using the reported standard deviations.

2. **Initial model specification**
   A structural equation model is specified linking the four personal growth initiative variables to identity formation processes and, subsequently, to self-esteem and depressive symptoms.

3. **Model estimation**
   The model is estimated using the `lavaan` package with Wishart maximum likelihood estimation.

4. **Model modification**
   Modification indices are inspected and additional covariance parameters are introduced sequentially to investigate whether model fit can be improved.

5. **Model comparison**
   Successive models are compared using likelihood-ratio tests to assess whether the additional parameters significantly improve model fit.

6. **Fit assessment**
   Model fit is evaluated using the chi-square test of exact fit, RMSEA, and CFI.

7. **Visualisation**
   Changes in RMSEA, chi-square, and CFI across model specifications are visualised using line plots.

## Methods & R Packages

The project demonstrates the use of:

* Structural equation modelling
* Path analysis
* Mediation modelling
* Covariance matrix reconstruction
* Modification indices
* Nested model comparison
* Likelihood-ratio testing
* Model fit assessment
* Standardized effect estimates
* Statistical visualisation

### Packages

```r
library(lavaan)
library(semPlot)
library(corrplot)
library(tidyverse)
```

## Repository Structure

```text
Project-2---SEM/
│
├── Project 2 - Path Model.R          # R analysis script
├── Project 2 - Path Model.docx       # Written analysis/report
└── README.md                         # Project documentation
```

## Running the Analysis

Clone the repository and open the project in R or RStudio.

No separate raw dataset is required because the correlation matrix, standard deviations, and sample size are entered directly in the R script.

Then run the analysis contained in:

```text
Project 2 - Path Model.R
```

## Skills Demonstrated

This project demonstrates practical experience with structural equation modelling in R, including covariance matrix reconstruction, path-model specification, mediation analysis, model modification, nested model comparison, model-fit evaluation, effect interpretation, and statistical visualisation.

## Author

**Laura M. Fetz**

