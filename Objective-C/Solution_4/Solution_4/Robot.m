//
//  Robot.m
//  Solution_4
//
//  Created by Николай Чупреев on 20.01.2024.
//

#import "Robot.h"

@implementation Robot

 // Создаем кастомный инициализатор, который принимает два параметра: x, y со значениями 0, 0
- (instancetype)init {
    self = [super init];
    if (self) {
        _x = 0;
        _y = 0;
    }
    return self;
}

// Метод run
- (void)run:(NSString * (^)(void))block {
    
    // Создаем переменную direction для сохранения в нее направления движения робота
    NSString *direction = block();
    // Например, если direction = up, то y++;
    if ([direction isEqualToString: @"up"]) {
        self.y++;
    // Для примера NSLog(@"Координаты робота при значении up - (x: %i, y: %i)", self.x, self.y);
    } else if ([direction isEqualToString: @"down"]) {
        self.y--;
    } else if ([direction isEqualToString: @"left"]) {
        self.x--;
    } else if ([direction isEqualToString: @"right"]) {
        self.x++;
    }
    NSLog(@"Координаты робота при значении %@: - (x: %i, y: %i)", direction, self.x, self.y);
}

@end

