//
//  Triangle.m
//  Solution_2
//
//  Created by Николай Чупреев on 12.01.2024.
//

#import "Triangle.h"

@implementation Triangle

// В подклассе Triangle: Figure переопределяем метод calculateArea
- (double)calculateArea {
    double s = [self calculatePerimeter] / 2;
    double area = sqrt(s * (s - self.side1) * (s - self.side2) * (s - self.side3));
        return area;
}

// В подклассе Triangle: Figure переопределяем метод calculatePerimeter
- (double)calculatePerimeter {
    double perimeter = self.side1 + self.side2 + self.side3;
        return perimeter;
}

// В подклассе Triangle: Figure переопределяем метод displayInfoAboutFigure
- (void)displayInfoAboutFigure {
    NSLog(@"Это треугольник. Площадь: %.2f, периметр: %.2f", self.calculateArea, self.calculatePerimeter);
}

@end
