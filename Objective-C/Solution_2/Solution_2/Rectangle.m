//
//  Rectangle.m
//  Solution_2
//
//  Created by Николай Чупреев on 12.01.2024.
//

#import "Rectangle.h"

@implementation Rectangle

// В подклассе Rectangle: Figure переопределяем метод calculateArea
- (CGFloat)calculateArea {
    return self.width * self.height;
}

// В подклассе Rectangle: Figure переопределяем метод calculatePerimeter
- (CGFloat)calculatePerimeter {
    return 2 * (self.width + self.height);
}

// В подклассе Rectangle: Figure переопределяем метод displayInfoAboutFigure
- (void)displayInfoAboutFigure {
    NSLog(@"Это прямоугольник. Площадь: %.2f, периметр: %.2f", self.calculateArea, self.calculatePerimeter);
}

@end
