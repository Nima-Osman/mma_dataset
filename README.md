# MMA Marketing

## 1. Introduction
Data-driven decision-making (DDDM) leverages data, facts, and metrics to guide strategic decisions. Despite its potential, a 2018 IDC study revealed that 70% of organisations fail in their digital transformations due to a lack of a supportive data culture (Forth et al., 2020).

DDDM plays a crucial role in organisational growth and is demonstrated in the Portuguese bank's telemarketing campaign. The dataset used spans 2008–2013 and includes:
- **Observations**: 4,100 records
- **Output Target**: Client decision (y)
- **Input Features**: 19 variables, including:
  - **Client Information**: Age, job, marital status, etc.
  - **Marketing Campaign Details**: Contact history and outcomes

### Data Types:
- **Categorical Variables**: Ordinal, nominal, binary
- **Numerical Variables**: Continuous, discrete

### Objective:
To build a predictive model for identifying clients likely to open long-term deposit accounts.

---

## 2. Methodology

It's crucial to thoroughly analyse and visualise data before model development. This involves assessing data quality, exploring variable relationships and relevance, and examining data distribution (Sanat, 2018).

## Exploratory Data Analysis (EDA)

### 3.1 Initial Observation

Both **R** and **Python** were used for creating histograms and scatterplots to display the data. Histograms show categorical variables' distribution, making it easy to interpret. Scatterplots visualise numerical values, displaying each data point and identifying outliers while showing data concentration.  
All dataset-based plots are in the appendices. Notable plots follow.

### Figure 1:
This figure illustrates the last contact month, with May having the most clients contacted, and December the least. The month may impact call outcomes.

<p align="center">
<img src="images\mma_1.png"  alt="Centered Image" title="Entity-Relationship Diagram" width="500">
</p>

### Figure 2:
Displays client contact frequency in the previous campaign. The sharp drop after one or two contacts could affect their willingness to open long-term accounts. Research suggests buyers may say no up to 4 times before saying yes, but few clients were contacted 5 times (acumen.sg, 2022).

<p align="center">
<img src="images\mma_2.png"  alt="Centered Image" title="Entity-Relationship Diagram" width="500">
</p>

### Figure 3:
Most clients are married. Marital status's impact on long-term deposit account willingness is uncertain. Financial stability, goals like property purchase, and family planning are more likely indicators for account opening (Husejinovic et al., 2020).

<p align="center">
<img src="images\mma_3.png"  alt="Centered Image" title="Entity-Relationship Diagram" width="500">
</p>

### Figure 4:
Shows client job distribution, with admin and blue-collar jobs being the most common. Students are the least represented group. Offering more benefits to students could attract more of them as clients.

<p align="center">
<img src="images\mma_4.png"  alt="Centered Image" title="Entity-Relationship Diagram" width="500">
</p>

### Figure 5:
Euribor is the rate at which European banks lend money to each other. This bank's Euribor 3-month rate, comprising the current figure, varies among clients due to factors like credit score, loan details, and their relationship with the bank. Most clients have around a 5% interest rate, with a significant group falling between <1% and 2%.

<p align="center">
<img src="images\mma_5.png"  alt="Centered Image" title="Entity-Relationship Diagram" width="500">
</p>

## 3.2 Correlations

To ensure relevant variables and avoid overfitting, variable selection is essential (Hastie et al., 2009; Harrell, 2015). Assessing correlations aids in this process (Kuhn, 2013). Strong correlations (±0.7-1.0) suggest redundancy; weaker correlations (±0-0.3) indicate unique information (Hair et al., 2019).  
Categorical to numeric conversion and renaming were performed to create a correlation matrix. A heatmap (Figure 6) used thresholds:  
- **Strong:** ±0.7-1.0  
- **Moderate:** ±0.3-0.7  
- **Weak:** ±0-0.3 (Ratner, 2009).

### Figure 6:
The heatmap indicates mainly weak correlations among variables. Notable strong correlations include:
- Euribor3m and emp.var.rate: Very strong positive (0.97).
- Nr.employed and emp.var.rate: Strong (0.9).
- Cons.price.idx and emp.var.rate: Moderate (0.76).
- Poutcome and previous: Strong (0.85).
- Poutcome and pdays: Strong negative (-0.74).

<p align="center">
<img src="images\mma_6.png"  alt="Centered Image" title="Entity-Relationship Diagram" width="500">
</p>

## 3.3 Assessing the Relevance of Variables

Initially, **emp.var.rate** and **nr.employed** were excluded as they pertain to employees, not clients. Additionally, **poutcome** will be excluded due to numerous non-existent values (Figure 7).

### Figure 7:
Demonstrates the outcome of the previous marketing campaign.

<p align="center">
<img src="images\mma_7.png"  alt="Centered Image" title="Entity-Relationship Diagram" width="500">
</p>

**Day_of_week** values are evenly distributed across the working week, showing little variation in the day clients were last contacted. Consequently, this variable is unlikely to impact the final client outcome and will be excluded from the model.

### Figure 8:
A plot showing the day of the week a client was last contacted.

<p align="center">
<img src="images\mma_8.png"  alt="Centered Image" title="Entity-Relationship Diagram" width="500">
</p>

**Credit Default:** A vast majority of clients report no credit default. Since almost none in this dataset have credit default, it's a constant/near-constant variable, offering no useful model information (Hair et al., 2019).

### Figure 9:
Plot demonstrating client credit default status.

<p align="center">
<img src="images\mma_9.png"  alt="Centered Image" title="Entity-Relationship Diagram" width="500">
</p>

## 3.4 Conclusion

In conclusion, the model will use the following variables:
- **Age**
- **Job**
- **Marital**
- **Education**
- **Housing**
- **Loan**
- **Contact**
- **Month**
- **Duration**
- **Campaign**
- **Cons.conf.idx**
- **Cons.price.idx**
- **Outcome**
- **Euribor3m**

# Model Selection/building

Choosing the right model is crucial as different models address specific problems, impacting accuracy and performance. The model choice depends on factors like interpretability, scalability, complexity, data type, and business objectives (Müller & Guido, 2017).

## 4.1. Determining the model type

Regression analysis predicts a variable (e.g., client's decision on a long-term deposit account) based on selected variables. The choice between simple and multiple regression was straightforward. With multiple variables, simple regression wasn't suitable due to data variety. Multiple regression accommodates quantitative and qualitative variables. Among multiple regression types, **logistic regression** is chosen for binary (yes/no) output, aligning with the report’s requirements (Mitchell, 2019).

## 4.2. Logistic model

Two logistic regression models were constructed to assess the impact of excluded variables on the model's suitability. The first model includes all variables, serving as the initial reference model.

### Logistic regression model 1:

<p align="center">
<img src="images\mma_10.png"  alt="Centered Image" title="Entity-Relationship Diagram" width="500">
</p>

**Train data accuracy score**: 0.9118466898954704  
**Test data accuracy score**: 0.9252032520325203

91.2% of the train data’s output was accurate, whilst 92.5% of the test data output was accurate. The output of the train and test data set are similar, suggesting good accuracy of the model.

### Logistic regression model 2:

This model (Figure 11) had all the variables removed and used only the ones highlighted in section 3.3.

<p align="center">
<img src="images\mma_9.png"  alt="Centered Image" title="Entity-Relationship Diagram" width="500">
</p>


**Train data set accuracy score**: 0.9097560975609756  
**Test data set accuracy score**: 0.9219512195121952

After excluding specific variables, minor adjustments occurred in the train and test data outputs. The training dataset's accuracy decreased marginally to 91.0%, and the test dataset's accuracy reduced slightly to 92.2%. This minimal accuracy change indicates that the removed variables exert little to no influence on the outcome.

## 4.3. Model evaluation

To evaluate the performance of the model, both a classification report and a ROC/AUC plot were done.

### Logistic regression model 1:

#### Classification report:

<p align="center">
<img src="images\mma_12.png"  alt="Centered Image" title="Entity-Relationship Diagram" width="500">
</p>


**Table 1**: Table showing classification report of logistic regression model one. All variables included and Class_weight imbalanced.

The classification report showed a high F1 score for '0' (no) and a low F1 score for '1' (yes) due to data imbalance. Changing the threshold post-learning might introduce bias and overfitting. Balancing class weights can mitigate the imbalance issue and improve the F1-score.

Below is the classification report of model 1 after introducing the class weight as balanced into the regression model. The F1 score for 1 is significantly improved, however, the recall score has decreased. Improving precision will reduce recall scores and vice versa.

<p align="center">
<img src="images\mma_13.png"  alt="Centered Image" title="Entity-Relationship Diagram" width="500">
</p>


**Table 2**: Classification report of Model 1. All variables included and Class_weight balanced.

The F1 score is a combination of the precision and recall score and reflects the model's overall ability to make correct positive predictions whilst minimizing false positives and false negatives.  
Additionally, the accuracy score of the train data has dropped to 85%, and 86% for the test data.

### Logistic regression Model 2:

#### Classification report model:

<p align="center">
<img src="images\mma_14.png"  alt="Centered Image" title="Entity-Relationship Diagram" width="500">
</p>


**Table 3**: Classification report of model 2. Irrelevant variables were removed and class_weight was balanced.

### ROC curve:

<p align="center">
<img src="images\mma_15.png"  alt="Centered Image" title="Entity-Relationship Diagram" width="500">
</p>


**Figure 12** displays the logistic regression models' performance. ROC curve of both logistic regression models 1 and 2 with the weight class balanced. In orange is the first logistic regression model, containing all variables. In blue is the second logistic regression model with the removed variables. Both models had balanced class weights, as altering class weights affected the AUC. Comparing the models reveals that excluding select variables had a significant impact. Model 1 had an AUC of 0.71, while model 2’s AUC is 1.0.

**Possible reasons for improved AUC**:
- Removed variables that were noisy/irrelevant.
- High correlation existed between removed and retained variables.
- The rebalance of the dataset.
- Module robustness was increased after removing variables that introduced sensitivity.

A combination of these factors has resulted in an improved AUC, ROC, and metrics.


A ROC curve positioned closer to the upper-left corner signifies a higher True Positive Rate (TPR) and a lower False Positive Rate (FPR), indicating stronger discriminatory power. While this model exhibits a relatively higher TPR and a relatively lower FPR, there's still room for enhancement in its performance.  
The AUC, serving as a summary measure of the ROC curve's performance, quantifies the model's ability to distinguish between classes. A value of 0.5 suggests random guessing, while 1.0 represents perfect classification. Model 2 has a perfect classification. The first model is moderate to good discriminatory power with an AUC score of 0.71. The improved model (Model 2) makes accurate predictions with a TPR of 1 and a False Positive Rate (FPR) of 0.  
Since 1.0 is a perfect AUC score, no further changes are required to be made for the model.

# 5. Conclusion

This programming exercise aimed to build an accurate model for predicting clients' decisions on opening long-term deposit accounts. Data exploration raised questions about variable relevance and redundancy. After careful consideration, relevant variables were selected. To validate this choice, two regression models were created and compared. The results indicated that the excluded variables had little to no impact on the model's robustness and accuracy. This was affirmed through the classification report and ROC/AUC analysis.

Collectively, these assessments suggest two key findings:
1. The removed variables that were irrelevant improved the model's performance greatly, creating a robust prediction model.
2. The discarded variables had no effect on the clients' decisions to open long-term deposit accounts.

The prior analysis aided in the identification of these variables, highlighting the importance of removing variables that can potentially affect accuracy.

# 6. References

- Acumen.sg. (2022). 60 Percent of Customers Say ‘No’ Four Times Before Saying ‘Yes’ -. [online] Available at: [https://acumen.sg/60-percent-of-customers-say-no-four-times-before-saying-yes/](https://acumen.sg/60-percent-of-customers-say-no-four-times-before-saying-yes/) [Accessed 1 Oct. 2023].
- Hastie, T., Tibshirani, R., & Friedman, J. (2009). The Elements of Statistical Learning. Springer.
- Forth, P., Reichert, T., de Laubier, R. and Chakraborty, S. (2020). Flipping the Odds of Digital Transformation Success. BCG. [online] 29 Oct. Available at: [https://www.bcg.com/publications/2020/increasing-odds-of-success-in-digital-transformation](https://www.bcg.com/publications/2020/increasing-odds-of-success-in-digital-transformation).
- Hair, J.F., Black, W.C. and Babin, B.J. (2019). Multivariate Data Analysis. Andover, Hampshire, United Kingdom: Cengage Learning Emea. Copyright.
- Harrell, F. (2016). REGRESSION MODELING STRATEGIES: with applications to linear models, logistic and ordinal regression, and survival analysis. Springer.
- Husejinovic, Admel and Efendic Ph.D., Velid, Investigation of Factors Effecting Clients’ Decision on Engagement of Bank Deposits (December 31, 2020). Available at SSRN: [https://ssrn.com/abstract=3963034](https://ssrn.com/abstract=3963034) or [http://dx.doi.org/10.2139/ssrn.3963034](http://dx.doi.org/10.2139/ssrn.3963034)
- Kuhn, M., Johnson, K. and Springer Science+Business Media (2016). Applied predictive modeling. New York: Springer.
- Mitchell, M. (2019). Selecting the Correct Predictive Modeling Technique. [online] Medium. Available at: [https://towardsdatascience.com/selecting-the-correct-predictive-modeling-technique-ba459c370d59](https://towardsdatascience.com/selecting-the-correct-predictive-modeling-technique-ba459c370d59).
- Müller, A.C. and Guido, S. (2017). Introduction to machine learning with Python: a guide for data scientists. Beijing: O’Reilly.
- Ratner, B. (2009). The correlation coefficient: Its values range between +1/−1, or do they? Journal of Targeting, Measurement and Analysis for Marketing, [online] 17(2), pp.139–142. doi:[https://doi.org/10.1057/jt.2009.5](https://doi.org/10.1057/jt.2009.5).
- Sanat (2019). Data Visualization for Machine Learning and Data Science: [online] Medium. Available at: [https://towardsdatascience.com/data-visualization-for-machine-learning-and-data-science-a45178970be7](https://towardsdatascience.com/data-visualization-for-machine-learning-and-data-science-a45178970be7).

