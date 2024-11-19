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
