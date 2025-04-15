double? sumArguments(double? generation, double? participation, double? transition) {
  // Sum the arguments
  if (generation == null || participation == null || transition == null) {
    return null;
  }

  return generation + participation + transition;
}