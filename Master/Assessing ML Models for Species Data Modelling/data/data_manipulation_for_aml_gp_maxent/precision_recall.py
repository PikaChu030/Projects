import pandas as pd

# Load the avg.csv file
df = pd.read_csv("/Users/rorymilsom/Desktop/output_csv/7576_avg.csv")


# Define thresholds
thresholds = [0.0, 0.4, 0.6, 0.8]

# Initialize lists to store results
results = []

for threshold in thresholds:
    # Apply the threshold to classify predictions
    df['predicted'] = (df['value'] >= threshold).astype(int)
    
    # Calculate confusion matrix components
    true_positive = (df['predicted'] == 1).sum()
    false_positive = (df['predicted'] == 1).sum()
    false_negative = (df['predicted'] == 0).sum()
    
    # Calculate precision and recall
    precision = true_positive / (true_positive + false_positive) if (true_positive + false_positive) > 0 else 0
    recall = true_positive / (true_positive + false_negative) if (true_positive + false_negative) > 0 else 0
    
    # Store results
    results.append({'Threshold': threshold, 'Precision': precision, 'Recall': recall})

# Convert results to a DataFrame and display
results_df = pd.DataFrame(results)
print(results_df)
results_df.to_csv('/Users/rorymilsom/Desktop/precision_recall_results/7576_avg.csv')