//
//  ViewController.h
//  Solution_6
//
//  Created by Николай Чупреев on 28.01.2024.
//


// 2. Cоздать на первом экране три TextField - два для записи координат, один для имени, и Button - кнопка для подтверждения ввода. 
// Необходимо сохранить в userDefaults объект робота из информации введенной пользователем в TextFiled и считать из него, вывести в TextView (или в консоль при технических сложностях).


#import <UIKit/UIKit.h>
#import "Robot.h"

@interface ViewController : UIViewController

// 2.1. Cоздаем на первом экране TextView, TextField и Button
// Создаем свойство enterCoordinate_X (Введите координату Х)
@property (nonatomic, strong) UITextView *enterCoordinate_X;
// Создаем свойство enteredCoordinate_X (Введенная координата Х)
@property (nonatomic, strong) UITextField *enteredCoordinate_X;

// Создаем свойство enterCoordinate_Y (Введите координату Y)
@property (nonatomic, strong) UITextView *enterCoordinate_Y;
// Создаем свойство enteredCoordinate_Y (Введенная координата Y)
@property (nonatomic, strong) UITextField *enteredCoordinate_Y;

// Создаем свойство enterNameRobot (Введите название робота)
@property (nonatomic, strong) UITextView *enterNameRobot;
// Создаем свойство enteredYourName (Введенное название робота)
@property (nonatomic, strong) UITextField *enteredNameRobot;

// Создаем свойство confirmEntry (Подтвердить ввод)
@property (nonatomic, strong) UIButton *confirmEntry;

// Создаем свойство displayingResponse (Отображение ответа)
@property (nonatomic, strong) UITextView *displayingResponse;
// Создаем свойство response (Поле отображение ответа)
@property (nonatomic, strong) UITextView *response;

// Создаем свойство goToSecondScreen (Кнопка перехода на второй экран)
@property (nonatomic, strong) UIButton *goToSecondScreen;

@end

