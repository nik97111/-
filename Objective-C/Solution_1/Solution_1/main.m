//
//  main.m
//  Solution_1
//
//  Created by Николай Чупреев on 25.12.2023.
//


// 1. Решить квадратные уравнения:
// x^2 – 8x + 12 = 0, 12x^2 – 4x + 2 = 0, x^2 – 100x - 2 = 0 (заменять константы в коде).
// 2. Создать программу, которая находит большее число среди 3-х чисел.


#import <Foundation/Foundation.h>
#include <math.h>

// Объявляем функцию для вычисления действительных корней
void solveQuadraticEquation(double a, double b, double c) {
    // Вычисляем дискриминант
    double discriminant = (b * b) - (4 * a * c);
    NSLog(@"discriminant = %f", discriminant);
    // Если discriminant > 0, будет два корня - x1 и x2
    if (discriminant > 0) {
        double x1 = (-b + sqrt(discriminant)) / (2 * a);
        double x2 = (-b - sqrt(discriminant)) / (2 * a);
        NSLog(@"У этого уравнения два корня: x1 = %f, x2 = %f", x1, x2);
    } else if (discriminant == 0) {
        // Если discriminant = 0, будет один корень - x
        double x = -b / (2 * a);
        NSLog(@"У этого уравнения один корень: x = %f", x);
    } else {
        // Если discriminant < 0, то нет действительных корней
        NSLog(@"У этого уравнения нет действительных корней");
    }
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 1. Решить квадратные уравнения:
        // x^2 – 8x + 12 = 0, 12x^2 – 4x + 2 = 0, x^2 – 100x - 2 = 0 (заменять константы в коде).
        // Для вычисления квадратного корня (sqrt()) дискриминанта используем функцию math. h
        
        // Для примера:
        // a*x^2 + b*x + c = 1*x^2 – 8*x + 12 = 0
        // double a = 1.0;  // x^2
        // double b = -8.0; // -8x
        // double c = 12.0; // 12
        
        //x^2 – 8x + 12 = 0
        solveQuadraticEquation(1.0, -8.0, 12.0);
        
        // 12x^2 – 4x + 2 = 0
        solveQuadraticEquation(12.0, -4.0, 2.0);
        
        // x^2 – 100x - 2 = 0
        solveQuadraticEquation(1.0, -100.0, -2.0);
        
        
        
        
        // 2. Создать программу, которая находит большее число среди 3-х чисел.
        // Числа даны
        int num1 = 7;
        int num2 = 10;
        int num3 = 12;
        
        if (num1 > num2 && num1 > num3) {
            NSLog(@"%d", num1);
            NSLog(@"Большее число: num1, равное %d", num1);
        } else if (num2 > num1 && num2 > num3) {
            NSLog(@"Большее число: num2, равное %d", num2);
        } else {
            NSLog(@"Большее число: num3, равное %d", num3);
        }
        
        
        // Вводим числа
        int num4, num5, num6;
        scanf("%d", &num4);
        scanf("%d", &num5);
        scanf("%d", &num6);
        
        if (num4 > num5 && num4 > num6) {
            NSLog(@"%d", num4);
            NSLog(@"Большее число: num4 = %d", num4);
        } else if (num5 > num4 && num5 > num6) {
            NSLog(@"Большее число: num5 = %d", num5);
        } else {
            NSLog(@"Большее число: num3 = %d", num6);
        }
        
        return 0;
    }
}
