double calculateRefValueSum(List<double>? refValueFromItemInList) {
  // Sum the refvalue fields of the bagitem list
  if (refValueFromItemInList == null || refValueFromItemInList.isEmpty) {
    return 0.0;
  }

  double sum = 0.0;
  for (double value in refValueFromItemInList) {
    sum += value;
  }

  return sum;
}