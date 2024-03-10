//
//  SecondViewController.h
//  Solution_6
//
//  Created by Николай Чупреев on 29.01.2024.
//


// Задание
// 3. Создать второй экран, с таким же набором элементов как на первом экране, но сохранить информацию о роботе в файл с названием таким же как имя робота и считать содержимое файла, отобразить в TextView (или в консоль при технических сложностях).

#import <UIKit/UIKit.h>
#import "Robot.h"


// 3.1. Cоздаем на первом экране TextView, TextField и Button


@interface SecondViewController : UIViewController

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

@end
