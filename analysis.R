### Laura Maria Fetz
### Reshaping the essence of personal growth, identity formation, and well-being
### Last updated 3rd of October 2026

#------------------------------------------------------------------------------- LOADING DATA AND PACKAGES
# Load packages
library(lavaan)
library(corrplot)
library(tidyverse)

# Import correlation matrix
data <- c(0.73,
          0.33, 0.40,
          0.66, 0.63, 0.41,
          0.20, 0.28, 0.14, 0.22,
          0.33, 0.42, 0.20, 0.30, 0.70,
          0.30, 0.29, 0.19, 0.34, 0.21, 0.30,
          0.33, 0.35, 0.32, 0.39, 0.46, 0.48, 0.54,
          -0.05, -0.20, 0.02, -0.07, -0.46, -0.44, 0.23, 0.03,
          0.20, 0.33, 0.18, 0.24, 0.32, 0.41, 0.08, 0.12, -0.46,
          -0.15, -0.27, -0.09, -0.16, -0.29, -0.36, -0.01, -0.06, 0.45, -0.58)


# Summary statistics
N   <- 551
M   <- c(3.04, 2.97, 2.33, 3.17, 3.54, 3.47, 3.53, 3.17, 2.58, 3.11, 0.91)
SDs <- c(0.86, 0.91, 1.14, 0.88, 0.95, 0.85, 0.78, 0.80, 0.96, 0.64, 0.65)

# Variable names
obsnames <- c("Change", "Planfulness", "Resources", "Intention", 
              "Commitment", "Identification", "ExploreBreadth", "ExploreDepth", 
              "ExploreRum", "SelfEsteem", "Depression")

#------------------------------------------------------------------------------- CORRELATION AND COVARIANCE MATRIX
# Correlation matrix
(corMat <- getCov(data, diagonal = FALSE, names = obsnames))


# Create a heatmap
corrplot(corMat, method = "color", type = "upper", 
         tl.col = "black", tl.srt = 45)


# Covariance matrix
(covMat <- getCov(data, diagonal = FALSE, sds= SDs, names = obsnames))

#------------------------------------------------------------------------------- INITIAL MODEL
# Define model
model1 <- '
    # Regressions
    Commitment       ~         b52*Planfulness
    Identification   ~         b62*Planfulness
    ExploreBreadth   ~         b74*Intention
    ExploreDepth     ~         b83*Resources + b84*Intention
    ExploreRum       ~         b91*Change + b92*Planfulness + b93*Resources
    SelfEsteem       ~         b102*Planfulness + b106*Identification + 
                               b107*ExploreBreadth + b109*ExploreRum
    Depression       ~         b112*Planfulness + b116*Identification + 
                               b119*ExploreRum

    # Residual variance
    Change          ~~         p11*Change
    Planfulness     ~~         p22*Planfulness
    Resources       ~~         p33*Resources
    Intention       ~~         p44*Intention
    Commitment      ~~         p55*Commitment
    Identification  ~~         p66*Identification
    ExploreBreadth  ~~         p77*ExploreBreadth
    ExploreDepth    ~~         p88*ExploreDepth
    ExploreRum      ~~         p99*ExploreRum
    SelfEsteem      ~~         p1010*SelfEsteem
    Depression      ~~         p1111*Depression
'

# Run model
model1Out <- lavaan(model1, sample.cov = covMat, 
                    sample.nobs = N, likelihood = "wishart")

# Print summary
summary(model1Out, standardized = TRUE, fit = TRUE)


#------------------------------------------------------------------------------- UPDATE MODELS ADDING ONLY COVARIANCES
# Adjust critical value for 40 df
crit <- qchisq(.05/40, df=1, lower.tail = TRUE)

# Modification indices
modificationIndices(model1Out, sort. = TRUE, minimum.value = crit)
 
# Update model
model2 <- c(model1, 'Planfulness ~~ p1122*Change')


# Run model
model2Out <- lavaan(model2, sample.cov = covMat,
                    sample.nobs = N, likelihood = "wishart")

# Print summary
summary(model2Out, fit = TRUE)


# Adjust critical value for 39 df
crit <- qchisq(.05/39, df=1, lower.tail = TRUE)

# Modification indices
modificationIndices(model2Out, sort. = TRUE, minimum.value = crit)

# Update model
model3 <- c(model2, 'Commitment ~~ p6655*Identification')


# Run model
model3Out <- lavaan(model3, sample.cov = covMat,
                    sample.nobs = N, likelihood = "wishart")

# Print summary
summary(model3Out, fit = TRUE)
 
 
# Adjust critical value for 38 df
crit <- qchisq(.05/38, df=1, lower.tail = TRUE)

# Modification indices
modificationIndices(model3Out, sort. = TRUE, minimum.value = crit)

# Update model
model4 <- c(model3, 'ExploreBreadth ~~ p8877*ExploreDepth')


# Run model
model4Out <- lavaan(model4, sample.cov = covMat,
                    sample.nobs = N, likelihood = "wishart")

# Print summary
summary(model4Out, fit = TRUE)
 

# Adjust critical value for 37 df
crit <- qchisq(.05/37, df=1, lower.tail = TRUE)

# Modification indices
modificationIndices(model4Out, sort. = TRUE, minimum.value = crit)
 
# Update model
model5 <- c(model4, 'SelfEsteem ~~ p1110*Depression')


# Run model
model5Out <- lavaan(model5, sample.cov = covMat,
                    sample.nobs = N, likelihood = "wishart")

# Print summary
summary(model5Out, fit = TRUE)
 

# Adjust critical value for 36 df
crit <- qchisq(.05/36, df=1, lower.tail = TRUE)

# Modification indices
modificationIndices(model5Out, sort. = TRUE, minimum.value = crit)
 
# Update model
model6 <- c(model5, 'Intention ~~ p3344*Resources')


# Run model
model6Out <- lavaan(model6, sample.cov = covMat,
                    sample.nobs = N, likelihood = "wishart")

# Print summary
summary(model6Out, fit = TRUE)
 

# Adjust critical value for 35 df
crit <- qchisq(.05/35, df=1, lower.tail = TRUE)

# Modification indices
modificationIndices(model6Out, sort. = TRUE, minimum.value = crit)
 
# Update model
model7 <- c(model6, 'Intention ~~ p1144*Change')

# Run model
model7Out <- lavaan(model7, sample.cov = covMat,
                    sample.nobs = N, likelihood = "wishart")

# Print summary
summary(model7Out, fit = TRUE)
 
 
# Adjust critical value for 34 df
crit <- qchisq(.05/34, df=1, lower.tail = TRUE)

# Modification indices
modificationIndices(model7Out, sort. = TRUE, minimum.value = crit)

# Update model
model8 <- c(model7, 'Planfulness ~~ p4422*Intention')


# Run model
model8Out <- lavaan(model8, sample.cov = covMat,
                    sample.nobs = N, likelihood = "wishart")
# Print summary
summary(model8Out, fit = TRUE)
 
 
# Adjust critical value for 33 df
crit <- qchisq(.05/33, df=1, lower.tail = TRUE)

# Modification indices
modificationIndices(model8Out, sort. = TRUE, minimum.value = crit)
 
# Update model
model9<- c(model8, 'ExploreBreadth ~~ p9977*ExploreRum')


# Run model
model9Out <- lavaan(model9, sample.cov = covMat,
                    sample.nobs = N, likelihood = "wishart")
# Print summary
summary(model9Out, fit = TRUE)
 

 
# Adjust critical value for 32 df
crit <- qchisq(.05/32, df=1, lower.tail = TRUE)

# Modification indices
modificationIndices(model9Out, sort. = TRUE, minimum.value = crit)
 
# Update model
model10<- c(model9, 'Planfulness ~~ p3322*Resources')


# Run model
model10Out <- lavaan(model10, sample.cov = covMat,
                     sample.nobs = N, likelihood = "wishart")
# Print summary
summary(model10Out, fit = TRUE)
 
 
# Adjust critical value for 31 df
crit <- qchisq(.05/31, df=1, lower.tail = TRUE)

# Modification indices
modificationIndices(model10Out, sort. = TRUE, minimum.value = crit)
 
# Update model
model11<- c(model10, 'Resources ~~ p1133*Change')


# Run model
model11Out <- lavaan(model11, sample.cov = covMat,
                     sample.nobs = N, likelihood = "wishart")
# Print summary
summary(model11Out, fit = TRUE)
 
 
# Adjust critical value for 30 df
crit <- qchisq(.05/30, df=1, lower.tail = TRUE)

# Modification indices
modificationIndices(model11Out, sort. = TRUE, minimum.value = crit)
 
# Update model
model12<- c(model11, 'Identification ~~ p9966*ExploreRum')


# Run model
model12Out <- lavaan(model12, sample.cov = covMat,
                     sample.nobs = N, likelihood = "wishart")

# Print summary
summary(model12Out, fit = TRUE)
 

# Adjust critical value for 29 df
crit <- qchisq(.05/29, df=1, lower.tail = TRUE)

# Modification indices
modificationIndices(model12Out, sort. = TRUE, minimum.value = crit)
 
# Update model
model13<- c(model12, 'Commitment ~~ p9955*ExploreRum')


# Run model
model13Out <- lavaan(model13, sample.cov = covMat,
                     sample.nobs = N, likelihood = "wishart")

# Print summary
summary(model13Out, fit = TRUE)
 

# Adjust critical value for 28 df
crit <- qchisq(.05/28, df=1, lower.tail = TRUE)

# Modification indices
modificationIndices(model13Out, sort. = TRUE, minimum.value = crit)
 
# Update model
model14<- c(model13, 'ExploreDepth ~~ p9988*ExploreRum')


# Run model
model14Out <- lavaan(model14, sample.cov = covMat,
                     sample.nobs = N, likelihood = "wishart")

# Print summary
summary(model14Out, fit = TRUE)
 

 
# Adjust critical value for 27 df
crit <- qchisq(.05/27, df=1, lower.tail = TRUE)

# Modification indices
modificationIndices(model14Out, sort. = TRUE, minimum.value = crit)
 
# Update model
model15<- c(model14, 'Commitment ~~ p8855*ExploreDepth')


# Run model
model15Out <- lavaan(model15, sample.cov = covMat,
                     sample.nobs = N, likelihood = "wishart")

# Print summary
summary(model15Out, fit = TRUE)
 

# Adjust critical value for 26 df
crit <- qchisq(.05/26, df=1, lower.tail = TRUE)

# Modification indices
modificationIndices(model15Out, sort. = TRUE, minimum.value = crit)
 
# Update model
model16<- c(model15, 'Identification ~~ p7766*ExploreDepth')


# Run model
model16Out <- lavaan(model16, sample.cov = covMat,
                     sample.nobs = N, likelihood = "wishart")

# Print summary
summary(model16Out, fit = TRUE)
 
 
# Adjust critical value for 25 df
crit <- qchisq(.05/25, df=1, lower.tail = TRUE)

# Modification indices
modificationIndices(model16Out, sort. = TRUE, minimum.value = crit)

# Update model
model17<- c(model16, 'Identification ~~ p8866*ExploreBreadth')


# Run model
model17Out <- lavaan(model17, sample.cov = covMat,
                     sample.nobs = N, likelihood = "wishart")

# Print summary
summary(model17Out, fit = TRUE)

 
# Adjust critical value for 24 df
crit <- qchisq(.05/24, df=1, lower.tail = TRUE)

# Modification indices
modificationIndices(model17Out, sort. = TRUE, minimum.value = crit)
 
# Update model
model18<- c(model17, 'Commitment ~~ p7755*ExploreBreadth')


# Run model
model18Out <- lavaan(model18, sample.cov = covMat,
                     sample.nobs = N, likelihood = "wishart")

# Print summary
summary(model18Out, fit = TRUE)
 
 
# Adjust critical value for 23 df
crit <- qchisq(.05/23, df=1, lower.tail = TRUE)

# Modification indices
modificationIndices(model18Out, sort. = TRUE, minimum.value = crit)


#------------------------------------------------------------------------------- ADDING EFFECT
# Update model
model19<- c(model18, 'ExploreBreadth ~ b71*Change')

# Run model
model19Out <- lavaan(model19, sample.cov = covMat,
                     sample.nobs = N, likelihood = "wishart")

# Print summary
summary(model19Out, fit = TRUE)

 
#------------------------------------------------------------------------------- COMPARING MODELS
# Assuming model1Out to model19Out are your SEM model results
model_list <- list(model1Out, model2Out, model3Out, model4Out, model5Out,
                   model6Out, model7Out, model8Out, model9Out, model10Out,
                   model11Out, model12Out, model13Out, model14Out, model15Out,
                   model16Out, model17Out, model18Out, model19Out)

# Perform LRT
for(i in 2:length(model_list)) {
  lrt_result <- lavTestLRT(model_list[[i-1]], model_list[[i]])
  print(paste("Model", i-1, "vs Model", i, ":"))
  print(lrt_result)
}


#------------------------------------------------------------------------------- EXTRACTING FIT INDICES FOR PLOTTING 
# Function to extract model fit indices
extract_fit_indices <- function(model) {
  chi_square <- as.numeric(lavaan::fitMeasures(model, "chisq"))
  df <- as.numeric(lavaan::fitMeasures(model, "df"))
  rmsea <- as.numeric(lavaan::fitMeasures(model, "rmsea"))
  cfi <- as.numeric(lavaan::fitMeasures(model, "cfi"))
  
  return(c(chi_square = chi_square, df = df, rmsea = rmsea, cfi = cfi))
}

# Initialize an empty list to store the results
results <- list()

# Loop over the models and extract the fit indices
for (i in 1:19) {
  model_name <- paste0("model", i, "Out")
  model <- get(model_name)
  results[[model_name]] <- extract_fit_indices(model)
}

# Convert the results to a data frame for easier manipulation
results_df <- results %>%
  do.call(cbind, .) %>%
  t() %>%
  as.data.frame() 

# Transpose results for plotting
results_transposed_df <- results_df %>%
  mutate(Model = seq_len(nrow(results_df)))


#------------------------------------------------------------------------------- PLOTTING
# Create a line graph - RMSEA
plot(results_transposed_df$Model, results_transposed_df$rmsea,
     type = "l", # This specifies a line graph
     main = "RMSEA",
     xlab = "Model",
     ylab = "RMSEA")

# Add dots at each x value
points(results_transposed_df$Model, 
       results_transposed_df$rmsea, col = "black", pch = 19)  

# Add a red line for y = 0.05
abline(h = 0.05, col = "red", lty = 2)

# Adjust the x-axis to show every number
axis(1, at = 1:length(results_transposed_df$Model), 
     labels = results_transposed_df$Model)


# Create a line graph - Chi Square
plot(results_transposed_df$Model, results_transposed_df$chi_square,
     type = "l", # This specifies a line graph
     main = "Chi Square",
     xlab = "Model",
     ylab = "Chi Square")

# Add dots at each x value
points(results_transposed_df$Model, 
       results_transposed_df$chi_square, col = "black", pch = 19)  

# Adjust the x-axis to show every number
axis(1, at = 1:length(results_transposed_df$Model), 
     labels = results_transposed_df$Model)


# Create a line graph - CFI
plot(results_transposed_df$Model, results_transposed_df$cfi,
     type = "l", # This specifies a line graph
     main = "CFI",
     xlab = "Model",
     ylab = "CFI")

# Add dots at each x value
points(results_transposed_df$Model, 
       results_transposed_df$cfi, col = "black", pch = 19)  

# Add a red line for y = 0.9
abline(h = 0.9, col = "red", lty = 2)

# Add a red line for y = 0.95
abline(h = 0.95, col = "red", lty = 2)

# Adjust the x-axis to show every number
axis(1, at = 1:length(results_transposed_df$Model), 
     labels = results_transposed_df$Model)

#------------------------------------------------------------------------------- FINAL MODEL
# Define final model for transparency 
modelFinal <- '
    # Regressions
    Commitment       ~         b52*Planfulness
    Identification   ~         b62*Planfulness
    ExploreBreadth   ~         b74*Intention
    ExploreDepth     ~         b83*Resources + b84*Intention
    ExploreRum       ~         b91*Change + b92*Planfulness + b93*Resources
    SelfEsteem       ~         b102*Planfulness + b106*Identification + 
                               b107*ExploreBreadth + b109*ExploreRum
    Depression       ~         b112*Planfulness + b116*Identification + 
                               b119*ExploreRum

    # Residual variance
    Change          ~~         p11*Change
    Planfulness     ~~         p22*Planfulness
    Resources       ~~         p33*Resources
    Intention       ~~         p44*Intention
    
    Commitment      ~~         p55*Commitment
    Identification  ~~         p66*Identification
    ExploreBreadth  ~~         p77*ExploreBreadth
    ExploreDepth    ~~         p88*ExploreDepth
    ExploreRum      ~~         p99*ExploreRum
    
    SelfEsteem      ~~         p1010*SelfEsteem
    Depression      ~~         p1111*Depression
    
    # Covariance  
    Planfulness     ~~         p12*Change + p32*Resources + p43*Intention
    Resources       ~~         p13*Change
    Intention       ~~         p14*Change + p34*Resources
    
    Commitment      ~~         p65*Identification + p75*ExploreBreadth + 
                               p85*ExploreDepth + p95*ExploreRum
    Identification  ~~         p76*ExploreBreadth + p86*ExploreDepth + 
                               p96*ExploreRum
    ExploreBreadth  ~~         p87*ExploreDepth + p97*ExploreRum
    ExploreDepth    ~~         p98*ExploreRum
    
    SelfEsteem      ~~         p1110*Depression
'

# Run model
modelFinalOut <- lavaan(modelFinal, sample.cov = covMat, 
                        sample.nobs = N, likelihood = "wishart")

# Print summary
summary(modelFinalOut, standardized = TRUE, fit = TRUE)


#------------------------------------------------------------------------------- EQUIVALENCE TEST
# Compare fitMeasures of both models
fitMeasures(modelFinalOut)
fitMeasures(model18Out)

dir.create("results", showWarnings = FALSE)
write.csv(results_transposed_df, "results/model_fit.csv", row.names = FALSE)
write.csv(parameterEstimates(modelFinalOut, standardized = TRUE, ci = TRUE),
          "results/final_parameters.csv", row.names = FALSE)
capture.output(sessionInfo(), file = "results/session_info.txt")
