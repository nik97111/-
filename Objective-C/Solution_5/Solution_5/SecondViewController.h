//
//  SecondViewController.h
//  Solution_5
//
//  Created by Николай Чупреев on 25.01.2024.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Loader.h"


@interface SecondViewController : UIViewController

// Создаем свойство loader. Атрибуты (nonatomic - если неизвестно, по каким причинам данное свойство не должно быть доступно двум и более потокам в единицу времени, для чего его нужно сделать безопасным, указываем nonatomic - метод, не создающий дополнительных проверок со стороны компилятора, strong - сильная ссылка)
@property (nonatomic, strong)Loader *loader;

// Создаем свойство enteredName (Введите имя)
@property (nonatomic, strong) UITextView *enterYourName;
// Создаем свойство enteredName (Введенное имя)
@property (nonatomic, strong) UITextField *enteredName;

// Создаем свойство enteredName (Введите фамилию)
@property (nonatomic, strong) UITextView *enterYourSurname;
// Создаем свойство enteredName (Введенная фамилия)
@property (nonatomic, strong) UITextField *enteredSurname;

// Создаем свойство Button POST-запроса
@property (nonatomic, strong) UIButton *postRequest;

// Создаем свойство displayingPOSTRequestResponse (Отображение ответа POST-запроса)
@property (nonatomic, strong) UITextView *displayingPOSTRequestResponse;
// Создаем свойство postRequestResponse (Поле отображение ответа POST-запроса)
@property (nonatomic, strong) UITextView *postRequestResponse;


@end

