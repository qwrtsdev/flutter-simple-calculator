dynamic calculateSum(double number1, String operation, double number2) {
  dynamic result;

  switch (operation) {
    case '+':
      result = number1 + number2;
      break;
    case '-':
      result = number1 - number2;
      break;
    case '*':
      result = number1 * number2;
      break;
    case '/':
      if (number2 == 0) {
        result = false;
        break;
      }

      result = number1 / number2;
      break;
    default:
      result = false;
  }

  return result;
}