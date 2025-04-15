double? calculateAverageOrderValue(List<double>? totalRefValue, String? user) {
  // Check if the input data is valid
  if (totalRefValue == null || user == null) {
    return null;
  }

  double total = 0;
  int count = 0;

  // Iterate through the values to calculate the total and count
  for (double value in totalRefValue) {
    total += value;
    count++;
  }

  // If no values are present, return null
  if (count == 0) {
    return null;
  }

  // Return the average
  return total / count;
}