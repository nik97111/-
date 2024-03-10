//
//  Circle.h
//  Solution_2
//
//  Created by Николай Чупреев on 12.01.2024.
//

#import "Figure.h"

NS_ASSUME_NONNULL_BEGIN

@interface Circle : Figure

// Создаем свойство - радиус
@property (nonatomic, assign) CGFloat radius;

// Создаем инициализатор, который принимает WithRadius
- (instancetype)initWithRadius:(CGFloat)radius;


// Метод вычисления площади - calculateArea (можно здесь не указывать)
- (CGFloat)calculateArea;

// Метод вычисления периметра - calculatePerimeter (можно здесь не указывать)
- (CGFloat)calculatePerimeter;

@end

NS_ASSUME_NONNULL_END
