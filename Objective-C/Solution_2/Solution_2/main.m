//
//  main.m
//  Solution_2
//
//  Created by Николай Чупреев on 12.01.2024.

// 1. Создать абстрактный класс Figure с методами вычисления площади и периметра, а также методом, выводящим информацию о фигуре на экран.
// 2. Создать производные классы: Rectangle (прямоугольник), Circle (круг), Triangle (треугольник) со своими методами вычисления площади и периметра.
// 3.Создать массив n-фигур и вывести полную информацию о фигурах на экран.


#import <Foundation/Foundation.h>
#import "Rectangle.h"
#import "Circle.h"
#import "Triangle.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Создаем экземпляр класса Rectangle и присваиваем значения
        Rectangle *rectangle = [[Rectangle alloc] init]; rectangle.width = 5.0; rectangle.height = 13.0;
//        CGFloat calculateArea = [rectangle calculateArea];
//        CGFloat calculatePerimeter = [rectangle calculatePerimeter];
        // Выводим в консоль
//        NSLog(@"Площадь треугольника: %.2f", calculateArea);
//        NSLog(@"Периметр треугольника: %.2f", calculatePerimeter);
        
        
        // Создаем экземпляр класса Circle и присваиваем значение
        Circle *circle = [[Circle alloc] initWithRadius: 4];
//        NSLog(@"Площадь круга: %f", [circle calculateArea]);
//        NSLog(@"Периметр круга: %f", [circle calculatePerimeter]);
//        
        
        // Создаем экземпляр класса Circle и присваиваем значения
        Triangle *triangle = [[Triangle alloc] init]; triangle.side1 = 5.0; triangle.side2 = 8.0; triangle.side3 = 9.0;
//        NSLog(@"Площадь треугольника: %.2f", [triangle calculateArea]);
//        NSLog(@"Периметр треугольника: %.2f", [triangle calculatePerimeter]);
        
        
        // Создаем массив фигур
        NSMutableArray *figuresArray = [[NSMutableArray alloc] init];
        [figuresArray addObject:rectangle];
        [figuresArray addObject:circle];
        [figuresArray addObject:triangle];
        
        // Выводим информацию о фигурах на экран
        for (Figure *figure in figuresArray) {
            [figure displayInfoAboutFigure];
        }
        
    }
    return 0;
}
