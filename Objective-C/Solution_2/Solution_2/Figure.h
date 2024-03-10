//
//  Figure.h
//  Solution_2
//
//  Created by Николай Чупреев on 12.01.2024.
//


// 1. Создаем абстрактный класс Figure с методами вычисления площади и периметра, а также методом, выводящим информацию о фигуре на экран.

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Figure : NSObject

// Создаем метод вычисления площади - calculateArea
- (CGFloat)calculateArea;

// Создаем метод вычисления периметра - calculatePerimeter
- (CGFloat)calculatePerimeter;

// Создаем метод, выводящий информацию о фигуре на экран - displayInfoAboutFigure
- (void)displayInfoAboutFigure;

@end

NS_ASSUME_NONNULL_END
