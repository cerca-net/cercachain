
  // create a function to calculate de average total_ref_value of a user's orders
  if (totalrefvalue == null || user == null) {
    return null;
  }

  double total = 0;
  int count = 0;

  for (double value in totalrefvalue) {
    total += value;
    count++;
  }

  if (count == 0) {
    return null;
  }

  return total / count;