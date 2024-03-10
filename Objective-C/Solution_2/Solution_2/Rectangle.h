//
//  Rectangle.h
//  Solution_2
//
//  Created by Николай Чупреев on 12.01.2024.
//

#import "Figure.h"

NS_ASSUME_NONNULL_BEGIN

@interface Rectangle : Figure

// Изначально устанавливается ключевое имя @property, которое дает компилятору знать, что будет объявлено свойство. Затем устанавливаются атрибуты (в скобках). После этого указывается тип свойства и его имя.
// Создаем свойство - ширина
@property(nonatomic, assign) CGFloat width;

// Создаем свойство - высота
@property(nonatomic, assign) CGFloat height;


// Метод вычисления площади - calculateArea (можно здесь не указывать)
- (CGFloat)calculateArea;

// Метод вычисления периметра - calculatePerimeter (можно здесь не указывать)
- (CGFloat)calculatePerimeter;

@end

NS_ASSUME_NONNULL_END
