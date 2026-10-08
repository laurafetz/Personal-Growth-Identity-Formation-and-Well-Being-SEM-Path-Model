# Personal Growth, Identity Formation, and Well-Being

An exploratory structural equation model linking personal growth initiative, identity formation, self-esteem, and depressive symptoms. The R script reconstructs a covariance matrix from reported correlations, standard deviations, and a sample size of 551 Belgian adolescents and young adults aged 14–35.

## Analysis

The script fits paths from four personal-growth variables to five identity-formation variables and two well-being outcomes, using `lavaan` with Wishart maximum likelihood. It compares successive specifications using fit statistics and likelihood-ratio tests, and visualizes changes in CFI, RMSEA, and chi-square.

Modification indices guide the exploratory model changes. Improvements in fit on the same summary data do not validate a causal mediation mechanism or establish performance on independent data. See [the original report](docs/original_report.docx) for the original interpretation.

## Run

```r
install.packages(c("lavaan", "corrplot", "tidyverse"))
```

From the repository root:

```bash
Rscript analysis.R
```

All summary inputs are embedded in the script; no participant-level dataset is needed. R prints model output, creates plots, and exports model-fit and parameter tables to `results/`. The complete script ran on 8 October 2026. The script no longer installs packages during analysis.

## Files

```text
Personal-Growth-Identity-Formation-and-Well-Being-SEM-Path-Model/
├── analysis.R
├── docs/original_report.docx
├── results/
├── .gitignore
└── README.md
```

Laura M. Fetz
