//
//  Triangle.h
//  Solution_2
//
//  Created by Николай Чупреев on 12.01.2024.
//

#import "Figure.h"

NS_ASSUME_NONNULL_BEGIN

@interface Triangle : Figure


// Создаем свойство - сторона 1
@property (nonatomic, assign) CGFloat side1;

// Создаем свойство - сторона 2
@property (nonatomic, assign) CGFloat side2;

// Создаем свойство - сторона 3
@property (nonatomic, assign) CGFloat side3;



// Метод вычисления площади - calculateArea (можно здесь не указывать)
- (CGFloat)calculateArea;

// Метод вычисления периметра - calculatePerimeter (можно здесь не указывать)
- (CGFloat)calculatePerimeter;


@end

NS_ASSUME_NONNULL_END
