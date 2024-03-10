//
//  Circle.m
//  Solution_2
//
//  Created by Николай Чупреев on 12.01.2024.
//

#import "Circle.h"

@implementation Circle

// Создаем инициализатор, который принимает WithRadius
- (instancetype)initWithRadius:(CGFloat)radius {
    self = [super init];
    if (self) {
        self.radius = radius;
    }
    return self;
}

// В подклассе Circle: Figure переопределяем метод calculateArea
- (CGFloat)calculateArea {
    return M_PI * pow(self.radius, 2);
}

// В подклассе Circle: Figure переопределяем метод calculatePerimeter
- (CGFloat)calculatePerimeter {
    return 2 * M_PI * self.radius;
}

// В подклассе Circle: Figure переопределяем метод displayInfoAboutFigure
- (void)displayInfoAboutFigure {
    NSLog(@"Это круг. Площадь: %f, периметр: %f", self.calculateArea, self.calculatePerimeter);    
}

@end
