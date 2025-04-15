
  // sum the refvalue fields of the bagitem list
  if (refvaluefromiteminlist == null || refvaluefromiteminlist.isEmpty) {
    return 0.0;
  }

  double sum = 0.0;
  for (double value in refvaluefromiteminlist) {
    sum += value;
  }

  return sum;