//
//  SecondViewController.m
//  Solution_5
//
//  Created by Николай Чупреев on 25.01.2024.
//

#import "SecondViewController.h"

@implementation SecondViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Задаем цвет экрану - белый
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Создаем объект loader и присвоим ему значение
    self.loader = [Loader new];
    
    
    
    // Задаем координаты и размер TextView - enterYourName (Введите имя). x - 15, y - 100, ширина - 360, высота - 30
    self.enterYourName = [[UITextView alloc] initWithFrame:CGRectMake(15, 100, 360, 30)];
    // Отображаемый текст в TextView
    self.enterYourName.text =  @"Введите имя";
    // Выравниваем текст в TextView по центру
    self.enterYourName.textAlignment = NSTextAlignmentCenter;
    // Размер шрифта
    self.enterYourName.font = [UIFont systemFontOfSize:18.0];
    // Добавление textView на экран
    [self.view addSubview:self.enterYourName];
    
    // Задаем координаты и размер TextField - enteredName (Введенное имя)
    self.enteredName = [[UITextField alloc] initWithFrame:CGRectMake(15, 140, 360, 30)];
    // Отображаемый текст в TextView
    self.enteredName.text =  @"Nik";
    // Выравниваем текст в TextView по центру
    self.enteredName.textAlignment = NSTextAlignmentCenter;
    // Размер шрифта
    self.enteredName.font = [UIFont systemFontOfSize:18.0];
    // Устанавливаем свойства для текстового поля
    // Задаем стиль рамки для текстового поля - линия
    self.enteredName.borderStyle = UITextBorderStyleLine;
    // Задаем цвет рамки - черный
    self.enteredName.layer.borderColor = [UIColor blackColor].CGColor;
    // Задаем щирину рамки - 1
    self.enteredName.layer.borderWidth = 1.0;
    // Добавление textView на экран
    [self.view addSubview:self.enteredName];
    
    
    // Задаем координаты и размер TextView - enterYourSurname (Введите фамилию)
    self.enterYourSurname = [[UITextView alloc] initWithFrame:CGRectMake(15, 200, 360, 30)];
    // Отображаемый текст в TextView
    self.enterYourSurname.text =  @"Введите фамилию";
    // Выравниваем текст в TextView по центру
    self.enterYourSurname.textAlignment = NSTextAlignmentCenter;
    // Размер шрифта
    self.enterYourSurname.font = [UIFont systemFontOfSize:18.0];
    // Добавление textView на экран
    [self.view addSubview:self.enterYourSurname];
    
    // Задаем координаты и размер TextField - enteredSurname (Введенная фамилия)
    self.enteredSurname = [[UITextField alloc] initWithFrame:CGRectMake(15, 240, 360, 30)];
    // Отображаемый текст в TextView
    self.enteredSurname.text =  @"Nik";
    // Выравниваем текст в TextView по центру
    self.enteredSurname.textAlignment = NSTextAlignmentCenter;
    // Размер шрифта
    self.enteredSurname.font = [UIFont systemFontOfSize:18.0];
    // Устанавливаем свойства для текстового поля
    // Задаем стиль рамки для текстового поля - линия
    self.enteredSurname.borderStyle = UITextBorderStyleLine;
    // Задаем цвет рамки - черный
    self.enteredSurname.layer.borderColor = [UIColor blackColor].CGColor;
    // Задаем щирину рамки - 1
    self.enteredSurname.layer.borderWidth = 1.0;
    // Добавление textView на экран
    [self.view addSubview:self.enteredSurname];
    
    
    // Создание кнопки Button POST-запроса
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    // Отображаемый текст в Button
    [button setTitle:@"POST-запрос" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(15, 300, 360, 30)];
    // Для выполнения POST-запроса присваиваем кнопке метод - performLoadingPostRequest
    [button addTarget:self action:@selector(performLoadingPostRequest) forControlEvents:UIControlEventTouchUpInside];
    // Добавление Button на экран
    [self.view addSubview:button];
    
    
    // Задаем координаты и размер TextView - displayingPOSTRequestResponse (Отображение ответа POST-запроса)
    self.displayingPOSTRequestResponse = [[UITextView alloc] initWithFrame:CGRectMake(15, 400, 360, 30)];
    // Отображаемый текст в TextView
    self.displayingPOSTRequestResponse.text =  @"Отображение ответа POST-запроса";
    // Выравниваем текст в TextView по центру
    self.displayingPOSTRequestResponse.textAlignment = NSTextAlignmentCenter;
    // Размер шрифта
    self.displayingPOSTRequestResponse.font = [UIFont systemFontOfSize:18.0];
    // Добавление textView на экран
    [self.view addSubview:self.displayingPOSTRequestResponse];
    
    // Задаем координаты и размер TextField - postRequestResponse (Поле отображение ответа POST-запроса)
    self.postRequestResponse = [[UITextView alloc] initWithFrame:CGRectMake(15, 440, 360, 350)];
    // Выравниваем текст в TextView по центру
    //    self.postRequestResponse.textAlignment = NSTextAlignmentCenter;
    // Размер шрифта
    self.postRequestResponse.font = [UIFont systemFontOfSize:18.0];
    // Устанавливаем свойства для текстового поля
    // Текстовое поле не имеет границы
//    self.postRequestResponse.borderStyle = UITextViewBorderStyleNone;
    // Задаем стиль рамки для текстового поля - линия
    self.enteredSurname.borderStyle = UITextBorderStyleLine;
    // Задаем цвет рамки - черный
    self.postRequestResponse.layer.borderColor = [UIColor blackColor].CGColor;
    // Задаем щирину рамки - 1
    self.postRequestResponse.layer.borderWidth = 1.0;
    // Добавление textView на экран
    [self.view addSubview:self.postRequestResponse];
}


// Метод для обработки POST-запроса
// Создаем метод, отвечающий за загрузку (готовит загрузчик для post-запроса). Ничего не возвращает
- (void)performLoadingPostRequest {
    // Создаем объект name, присваиваем ему извлеченный текст из поля ввода имени (сохраняем его в переменной name)
    NSString *name = self.enteredName.text;
    // Создаем объект surname, присваиваем ему извлеченный текст из поля ввода имени (сохраняем его в переменной surname)
    NSString *surname = self.enteredSurname.text;
    // Первым действием у объекта loader вызываем метод performGetRequestForUrl: первым параметром передаем url в виде строки @"https://postman-echo.com/get", аргументы в виде словаря @{@"name": name, @"surname": surname} и замыкание, которое будет крутиться при выполнении запроса
    [self.loader performPostRequestForUrl:@"https://postman-echo.com/post" arguments:@{
        @"name": name,
        @"surname": surname
        // Добавляем названия аргументам: dict и error (чтобы можно было ссылаться на эти параметры)
    } completion:^(NSDictionary *dict, NSError *error) {
        // Устанавливаем блок, который будет асинхронно крутиться (асинхронно потому, что все задачи на отображение, обработку должны выполняться асинхронно(не дожидается завершения предыдущей задачи)). Для этого вызываем метод dispatch_async, принимающий два параметра. В первом указывается, в какой очереди будет крутиться задача (пусть будет крутиться на основной очереди, чтобы не создавать другую): чтобы определить, где находится основная очередь, есть вспомогательный метод dispatch_get_main_queue() (позволяет узнать id нашей очереди). Второй параметр - блок, внутри которого будет выполняться отображение информации
        dispatch_async(dispatch_get_main_queue(), ^{
            // Проверяем, если есть ошибка, то выводим в консоль информацию об ошибке
            if (error) {
                NSLog(@"%@", error);
                // Чтобы программа не пошла дальше, указываем return (чтобы в данном случае выйти из функции досрочно)
                return;
            }
            // Если ошибки нет, выходим из условия и выводим информацию о словаре (выводим  словарь)
            NSLog(@"%@", dict);
            
            // Выводим отображение ответа post-запроса в TextView элементе
            self.postRequestResponse.text = [NSString stringWithFormat:@"%@", dict];
        });
    }];
}

@end























//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 200, 50)];
//    label.text = @"Второй экран";
//    label.textAlignment = NSTextAlignmentCenter;
//    [self.view addSubview:label];


//UILabel *label = [[UILabel alloc] init];
//label.text = @"Второй экран";
//label.textAlignment = NSTextAlignmentCenter;
//label.translatesAutoresizingMaskIntoConstraints = NO;
//[self.view addSubview:label];
//// Располагаем метку по горизонтали
//[label.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
//// Размещаем метку на расстоянии 200 пунктов сверху
//[label.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:200].active = YES;
//// Устанавливаем ширину метки 200
//[label.widthAnchor constraintEqualToConstant:200].active = YES;
//// Устанавливаем ширину метки 200 и высоту 50
//[label.heightAnchor constraintEqualToConstant:50].active = YES;



//- (void)setupCostraints {
//    self.textField_1.translatesAutoresizingMaskIntoConstraints = NO;
//    [NSLayoutConstraint activateConstraints:@[
//        // Располагаем textField по центру горизонтали
//        [self.textField_1.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
//        // Располагаем textField по нижнему краю safe area
//        [self.textField_1.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor],
//        // Устанавливаем ширину метки 200
//        [self.textField_1.widthAnchor constraintEqualToConstant:200],
//        // Устанавливаем ширину метки 200 и высоту 50
//        [self.textField_1.heightAnchor constraintEqualToConstant:50],
//
//    ]];
//}





//    self.textField_1 = [[UITextField alloc] init];
//    self.textField_1.text = @"";
//    self.textField_1.translatesAutoresizingMaskIntoConstraints = NO;
//    self.textField_1.textAlignment = NSTextAlignmentCenter;
//    [self.view addSubview:self.textField_1];
    
    

    
//    [NSLayoutConstraint activateConstraints:@[
//        // Располагаем textField по центру горизонтали
//        [self.textField_1.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
//        // Располагаем textField по нижнему краю safe area
//        [self.textField_1.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant: 40],
//        // Устанавливаем ширину метки 200
//        [self.textField_1.widthAnchor constraintEqualToConstant:200],
//        // Устанавливаем ширину метки 200 и высоту 50
//        [self.textField_1.heightAnchor constraintEqualToConstant:50],
//    ]];
    


//    self.button = [[UIButton alloc] initWithFrame:CGRectMake(15, 240, 360, 30)];
//    // Отображаемый текст в textField_1
//    self.button.text =  @"";
//    // Выравниваем текст в textField_1 по центру
//    self.button.textAlignment = NSTextAlignmentCenter;
//    // Размер шрифта
//    self.button.font = [UIFont systemFontOfSize:18.0];
//    // Установка рамки для textField_1
//      self.button.borderStyle = UITextBorderStyleLine;
//      self.button.layer.borderColor = [UIColor blackColor].CGColor;
//      self.button.layer.borderWidth = 1.0;
//    // Добавление textField_1 на экран
//    [self.view addSubview:self.button];
    





// Для отправки POST-запроса после введения имени и фамилии можно добавить следующий код:
//- (void)buttonTapped1 {
//    // Проверяем вызова метода
//    NSLog(@"Метод buttonTapped1 вызван!");
//
//    NSString *name = self.enteredName.text;
//    NSString *surname = self.enteredSurname.text;

//    NSDictionary *arguments = @{
//        @"name": name,
//        @"surname": surname
//    };

//    [self.loader performPostRequestForUrl:@"https://postman-echo.com/post" arguments:arguments completion:^(NSDictionary *dict, NSError *error) {
//        if (error) {
//            NSLog(@"%@", error);
//            return;
//        }
//        NSLog(@"%@", dict);
//
//        NSString *responseString = [NSString stringWithFormat:@"%@", dict];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.postRequestResponse.text = responseString;
//        });
//    }];

//        [self.loader performPostRequestForUrl:@"https://postman-echo.com/post" arguments:@{
//            @"name": name,
//            @"surname": surname
//        } completion:^(NSDictionary *dict, NSError *error) {
//            dispatch_async(dispatch_get_main_queue(), ^{
//                if (error) {
//                    NSLog(@"%@", error);
//                    return;
//                }
//                NSLog(@"%@", dict);
//                // Выводим отображение ответа post-запроса в TextView элементе
//                self.postRequestResponse.text = [NSString stringWithFormat:@"%@", dict];
//            });
//        }];
