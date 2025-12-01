# Home-Sales-Statistical-Modeling-Prediction
Statistical modeling using R

# Hunters Green Home Sales: Statistical Modeling & Prediction

## Project Overview
This project applies advanced statistical modeling techniques to analyze residential real estate data from "Hunters Green," a gated community in Tampa, Florida. Using R, the analysis builds multiple regression models to predict two key metrics: **Home Sale Price** and **Agent Days on Market (ADOM)**.

## Objectives
* **Predict Sale Price:** Identify which property attributes (square footage, pool, roof type, etc.) most strongly influence the final selling price.
* **Predict Time on Market:** Determine factors that affect how long a home stays listed before being sold.
* **Feature Engineering:** Transform raw real estate data into usable statistical predictors.

## Data Source
The dataset consists of actual home sales in the Hunters Green community from **2015 to 2020**.
* **Target Variables:** `pricesold` (Sale Price), `adom` (Agent Days on Market).
* **Key Predictors:** Square footage (`sqft`), Year Built (`yrblt`), Pool availability (Private/Community), Roof type (Tile/Shingle), and Garage size.

## Methodology
The analysis was conducted in **R** and followed these steps:

1.  **Data Cleaning & Preprocessing:**
    * Handled missing values and removed irrelevant columns.
    * Combined `bathsfull` and `bathshalf` into a single `total_baths` variable.
    * Extracted `Year` from pending dates to analyze temporal trends.
    * Created binary dummy variables for categorical features like `Pool` (Private/Community) and `Roof` (Tile vs. Shingle).

2.  **Exploratory Data Analysis (EDA):**
    * Identified high multicollinearity between `listprice`, `sqft`, and `lotsqft`.
    * Excluded `listprice` from the predictive model to prevent data leakage and variance inflation.
    * Applied Log transformation to `adom` to normalize its distribution.

3.  **Model Building (OLS Regression):**
    * Built three distinct models for each target variable (Price and ADOM).
    * **Price Models:** Tested predictors ranging from simple time-based trends to complex feature sets (beds, baths, garages, amenities).
    * **ADOM Models:** Analyzed how pricing strategies and home features impact market duration.

## Key Findings
* **Square Footage is King:** `sqft` remained the strongest predictor of sales price.
* **Year – for every 1 year increase in pending date year, sale price increases by 12,020$.
* **Amenities Matter:** Homes with **Tile Roofs** and **Private Pools** showed statistically significant price premiums.
* **Multicollinearity:** `Baths` and `Sqft` were highly correlated (0.85), requiring careful selection to maintain model stability.

## Files in this Repository
* `Assignment 1.R`: The complete R script used for data cleaning, transformation, and regression analysis.
* `Assignment 1 - Siddharth Patel.docx`: The final report detailing model specifications, coefficients, and interpretations.
* `HuntersGreenHomeSales-2.xlsx - Data.csv`: The raw dataset used for analysis.

## Tools Used
* **R / RStudio** (lm, stargazer, dplyr)
* **Microsoft Excel** (Data storage)

## Author
* **Siddharth Patel**
* University of South Florida
