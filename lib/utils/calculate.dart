double calculate(double num1, String operation, double num2) {
    double answer = 0;

    switch (operation) {
      case '+':
        answer = num1 + num2;
        break;
      case '-':
        answer = num1 - num2;
        break;
      case '*':
        answer = num1 * num2;
        break;
      case '/':
        if (num2 == 0) {
          answer = 0;
        }
        answer = num1 / num2;
        break;
    }
    return double.parse(answer.toStringAsFixed(4));
}
