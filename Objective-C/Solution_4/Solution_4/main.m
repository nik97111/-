//
//  main.m
//  Solution_4
//
//  Created by Николай Чупреев on 20.01.2024.
//


// Реализовать класс робота (Robot). В классе должны быть свойства координат x, y (по умолчанию 0, 0) и метод run. Метод run принимает единственный параметр - блок, в зависимости от сообщения, возвращаемого из блока (up, down, left, right) робот движется в соответствующем направлении (изменяются его текущие координаты x, y). Гарантируется, что блок возвращает только строки вида (up, down, left, right). Продемонстрировать движение робота по прямоугольной системе координат.


#import <Foundation/Foundation.h>

// Импортируем класс Robot.h
#import "Robot.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        // Создаем экземпляр класса Robot
        Robot *robot = [Robot new];
        
        // Вызываем метод run
        [robot run:^NSString *{
            return @"up";
        }];
// Для примера NSLog(@"Координаты робота при значении up - (x: %i, y: %i)", robot.x, robot.y);
        
        [robot run:^NSString *{
            return @"down";
        }];

        [robot run:^NSString *{
            return @"left";
        }];

        [robot run:^NSString *{
            return @"right";
        }];
        
        
        // Короткая форма записи
        [robot run:^{ return @"up"; }];

        [robot run:^{ return @"down"; }];
    }
    
    return 0;
}
