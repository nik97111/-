//
//  ViewController.h
//  Solution_5
//
//  Created by Николай Чупреев on 25.01.2024.
//

#import <UIKit/UIKit.h>
#import "Loader.h"

@interface ViewController : UIViewController

// 6
// Создаем свойство loader. Атрибуты (nonatomic - если неизвестно, по каким причинам данное свойство не должно быть доступно двум и более потокам в единицу времени, для чего его нужно сделать безопасным, указываем nonatomic - метод, не создающий дополнительных проверок со стороны компилятора, strong - сильная ссылка)
@property (nonatomic, strong)Loader *loader;

// Создаем свойство textView
@property (nonatomic, strong) UITextView *textView;

// Создаем свойство textViewGET
@property (nonatomic, strong) UITextView *textViewGET;

// Создаем свойство label
@property (nonatomic, strong) UILabel *label;


@end

