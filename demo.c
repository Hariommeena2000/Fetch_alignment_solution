#include <stdio.h>

int main() {
    char operator;
    double num1, num2, result;

    // Input operator and numbers
    printf("Enter operator (+, -, *, /): ");
    scanf("%c", &operator);

    printf("Enter two numbers: ");
    scanf("%lf %lf", &num1, &num2);

    // Perform calculation based on operator
    if(operator == '+') {
        result = num1 + num2;
    } else if(operator == '-') {
        result = num1 - num2;
    } else if(operator == '*') {
        result = num1 * num2;
    } else if(operator == '/') {
        if (num2 == 0) {
            printf("Error! Division by zero is not allowed.\n");
            return 1; // Exit program with error status
        }
        result = num1 / num2;
    } else {
        printf("Error! Invalid operator.\n");
        return 1; // Exit program with error status
    }

    // Output result
    printf("Result: %lf\n", result);

    return 0;
}
