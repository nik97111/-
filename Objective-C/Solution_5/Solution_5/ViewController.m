//
//  ViewController.m
//  Solution_5
//
//  Created by Николай Чупреев on 25.01.2024.
//

#import "ViewController.h"

// Импортируем "Loader.h"
#import "Loader.h"
//Импортируем класс второго экрана
#import "SecondViewController.h"

//@interface ViewController ()
//@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Задаем цвет экрану - белый
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 7
    // Создаем объект loader и присвоим ему значение
    self.loader = [Loader new];
    // 10
    // Пробуем использовать get-метод (вызываем метод performLoadingGetRequest)
    [self performLoadingGetRequest];
    
    
    // Задаем расположение и размер TextView. x - 15, y - 60, ширина - 350, высота - 30
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 100, 350, 30)];
    // Отображаемый текст в TextView
    self.textView.text =  @"Отображение GET-запроса";
    // Выравниваем текст в TextView по центру
    self.textView.textAlignment = NSTextAlignmentCenter;
    // Размер шрифта
    self.textView.font = [UIFont systemFontOfSize:18.0];
    // Добавление textView на экран
    [self.view addSubview:self.textView];
    
    
    // Задаем расположение и размер textViewGET. x - 15, y - 100, ширина - 350, высота - 600
    self.textViewGET = [[UITextView alloc] initWithFrame:CGRectMake(20, 150, 350, 600)];
    // Задаем цвет экрана - белый (по умолчанию)
    self.textViewGET.backgroundColor = [UIColor systemBackgroundColor];
    // Выравниваем текст в TextView по центру
    self.textViewGET.textAlignment = NSTextAlignmentCenter;
    // Размер шрифта
    self.textViewGET.font = [UIFont systemFontOfSize:18.0];
    
    // Устанавливаем свойства для текстового поля
    // Задаем цвет рамки - черный
    self.textViewGET.layer.borderColor = [UIColor blackColor].CGColor;
    // Задаем щирину рамки - 1
    self.textViewGET.layer.borderWidth = 1.0;
    // Добавление textView на экран
    [self.view addSubview:self.textViewGET];
    
    
    // Создание кнопки
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Перейти на второй экран" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(100, 750, 200, 50)];
    [button addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}


- (void)buttonTapped {
    // Проверяем вызова метода
    NSLog(@"Метод buttonTapped вызван!");
    
    // Проверяем navigationController
    if (self.navigationController) {
        NSLog(@"navigationController не равно nil.");
    } else {
        NSLog(@"navigationController равно nil!");
    }
    
    
    // Создание и отображение второго экрана
    SecondViewController *secondViewController = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondViewController animated:true];
}

// 8
// Создаем метод, отвечающий за загрузку (готовит загрузчик для get-запроса). Ничего не возвращает
- (void)performLoadingGetRequest {
    // Первым действием у объекта loader вызываем метод performGetRequestForUrl: первым параметром передаем url в виде строки @"https://postman-echo.com/get", аргументы в виде словаря @{@"key1": @"val1", @"key2": @"val2"} и замыкание, которое будет крутиться при выполнении запроса
    [self.loader performGetRequestForUrl:@"https://postman-echo.com/get" arguments:@{
        @"key1": @"val1",
        @"key2": @"val2"
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
            
            // Выводим отображение get-запрос в TextView элементе
            self.textViewGET.text = [NSString stringWithFormat:@"%@", dict];
        });
    }];
}

// Закомментировал здесь этот код, потому что использую его в @implementation SecondViewController

//// 9
//// Создаем метод, отвечающий за загрузку (готовит загрузчик для post-запроса). Ничего не возвращает
//- (void)performLoadingPostRequest {
//    // Первым действием у объекта loader вызываем метод performGetRequestForUrl: первым параметром передаем url в виде строки @"https://postman-echo.com/get", аргументы в виде словаря @{@"key1": @"val1", @"key2": @"val2"} и замыкание, которое будет крутиться при выполнении запроса
//    [self.loader performPostRequestForUrl:@"https://postman-echo.com/post" arguments:@{
//        @"key1": @"val1",
//        @"key2": @"val2"
//        // Добавляем названия аргументам: dict и error (чтобы можно было ссылаться на эти параметры)
//    } completion:^(NSDictionary *dict, NSError *error) {
//        // Устанавливаем блок, который будет асинхронно крутиться (асинхронно потому, что все задачи на отображение, обработку должны выполняться асинхронно(не дожидается завершения предыдущей задачи)). Для этого вызываем метод dispatch_async, принимающий два параметра. В первом указывается, в какой очереди будет крутиться задача (пусть будет крутиться на основной очереди, чтобы не создавать другую): чтобы определить, где находится основная очередь, есть вспомогательный метод dispatch_get_main_queue() (позволяет узнать id нашей очереди). Второй параметр - блок, внутри которого будет выполняться отображение информации
//        dispatch_async(dispatch_get_main_queue(), ^{
//            // Проверяем, если есть ошибка, то выводим в консоль информацию об ошибке
//            if (error) {
//                NSLog(@"%@", error);
//                // Чтобы программа не пошла дальше, указываем return (чтобы в данном случае выйти из функции досрочно)
//                return;
//            }
//            // Если ошибки нет, выходим из условия и выводим информацию о словаре (выводим  словарь)
//            NSLog(@"%@", dict);
//        });
//    }];
//}


@end
































// Метод создания TextView. Можно создать отдельный метод для создания кнопки или создать во - (void)viewDidLoad {

// Отдельный метод
//- (void)loadView {
//    [super loadView];
//
//    // Задаем расположение и размер TextView. x - 20, y - 150, ширина - 350, высота - 600
//        self.textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 150, 350, 600)];
//    // Задаем цвет экрана - белый (по умолчанию)
//        self.textView.backgroundColor = [UIColor systemBackgroundColor];
//    // Выравниваем текст в TextView по центру
//        self.textView.textAlignment = NSTextAlignmentCenter;
//    // Размер шрифта
//        self.textView.font = [UIFont systemFontOfSize:18.0];
//    // Добавление textView на экран
//        [self.view addSubview:self.textView];
//}


//    // Задаем расположение TextView
//    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(100, 300, 200, 200)];
//
//    // Отображаемый текст в TextView
//    [textView setText: @"Отображение get-запроса"];
//
//    // Задаем цвет экрана - белый (по умолчанию)
//    [textView setBackgroundColor:[UIColor systemBackgroundColor]];

// Задаем цвет экрана - голубой
//    //[textView setBackgroundColor:[UIColor blueColor]];

//    // Выравниваем текст в TextView по центру
//    [textView setTextAlignment:NSTextAlignmentCenter];
//    // Размер шрифта
//    [textView setFont: [UIFont systemFontOfSize:18.0]];
//    // Добавление textView на экран
//    [self.view addSubview:textView];



// Инициализация textView
//UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(120, 200, 200, 200)];
//   // UITextView *textView = [[UITextView alloc] initWithFrame:self.view.bounds];
//textView.text = @"Привет, мир! Это мой экран с многострочным текстом.";
//textView.font = [UIFont systemFontOfSize:18.0]; // Настройка шрифта
//[self.view addSubview:textView]; // Добавление textView на экран


//    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
//      [label setText:@"Hello World"];
//      [label setBackgroundColor:[UIColor systemBackgroundColor]];
//      [label setTextAlignment:NSTextAlignmentCenter];
//      self.view = label;


// Выводим отображение ответа на get-запрос в консоль
//- (void)performLoadingGetRequest {
//    [self.loader performGetRequestForUrl:@"https://postman-echo.com/get" arguments:@{
//        @"key1": @"val1",
//        @"key2": @"val2"
//
//    } completion:^(NSDictionary *dict, NSError *error) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            if (error) {
//                NSLog(@"%@", error);
//                return;
//            }
//            NSLog(@"%@", dict);
//        });
//    }];
//}
