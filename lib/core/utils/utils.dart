int adjustTo32BitInt(int value) {
  // Define the range limits for a 32-bit signed integer
  const int max32BitInt = 2147483647;
  const int min32BitInt = -2147483648;

  // Adjust the value to fit within the 32-bit integer range
  int adjustedValue = value % (max32BitInt + 1);

  // Handle the case where adjustedValue needs to be within the signed range
  if (adjustedValue > max32BitInt) {
    adjustedValue -= (max32BitInt + 1);
  } else if (adjustedValue < min32BitInt) {
    adjustedValue += (max32BitInt + 1);
  }

  return adjustedValue;
}
