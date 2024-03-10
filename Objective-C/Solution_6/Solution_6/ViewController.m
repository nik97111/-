//
//  ViewController.m
//  Solution_6
//
//  Created by Николай Чупреев on 28.01.2024.
//

// 2. Cоздать на первом экране три TextField - два для записи координат, один для имени, и Button - кнопка для подтверждения ввода.
// Необходимо сохранить в userDefaults объект робота из информации введенной пользователем в TextFiled и считать из него, вывести в TextView (или в консоль при технических сложностях).


#import "ViewController.h"
//Импортируем "SecondViewController.h"
#import "SecondViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Задаем цвет экрану - белый
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 2.2. Cоздаем TextView, TextField и Button
    // 2.2.1 Cоздаем TextView (enterCoordinate_X) и TextField (enteredCoordinate_X)
    // Задаем координаты и размер TextView - enterCoordinate_X (Введите координату Х). x - 15, y - 100, ширина - 360, высота - 30
    self.enterCoordinate_X = [[UITextView alloc] initWithFrame:CGRectMake(15, 100, 360, 30)];
    // Отображаемый текст в TextView
    self.enterCoordinate_X.text =  @"Введите координату Х";
    // Выравниваем текст в TextView по центру
    self.enterCoordinate_X.textAlignment = NSTextAlignmentCenter;
    // Размер шрифта
    self.enterCoordinate_X.font = [UIFont systemFontOfSize:18.0];
    // Добавление TextView на экран
    [self.view addSubview:self.enterCoordinate_X];
    
    // Задаем координаты и размер TextField - enteredCoordinate_X (Введенная координата Х)
    self.enteredCoordinate_X = [[UITextField alloc] initWithFrame:CGRectMake(15, 140, 360, 30)];
//    // Отображаемый текст в TextField
//    self.enteredCoordinate_X.text =  @"Nik";
    // Выравниваем текст в TextField по центру
    self.enteredCoordinate_X.textAlignment = NSTextAlignmentCenter;
    // Размер шрифта
    self.enteredCoordinate_X.font = [UIFont systemFontOfSize:18.0];
    // Устанавливаем свойства для текстового поля
    // Задаем стиль рамки для текстового поля - линия
    self.enteredCoordinate_X.borderStyle = UITextBorderStyleLine;
    // Задаем цвет рамки - черный
    self.enteredCoordinate_X.layer.borderColor = [UIColor blackColor].CGColor;
    // Задаем щирину рамки - 1
    self.enteredCoordinate_X.layer.borderWidth = 1.0;
    // Добавление TextField на экран
    [self.view addSubview:self.enteredCoordinate_X];
    
    
    // 2.2.2 Cоздаем TextView (enterCoordinate_Y) и TextField (enteredCoordinate_Y)
    // Задаем координаты и размер TextView - enterCoordinate_Y (Введите координату Y)
    self.enterCoordinate_Y = [[UITextView alloc] initWithFrame:CGRectMake(15, 200, 360, 30)];
    // Отображаемый текст в TextView
    self.enterCoordinate_Y.text =  @"Введите координату Y";
    // Выравниваем текст в TextView по центру
    self.enterCoordinate_Y.textAlignment = NSTextAlignmentCenter;
    // Размер шрифта
    self.enterCoordinate_Y.font = [UIFont systemFontOfSize:18.0];
    // Добавление TextView на экран
    [self.view addSubview:self.enterCoordinate_Y];
    
    // Задаем координаты и размер TextField - enteredCoordinate_Y (Введенная координата Y)
    self.enteredCoordinate_Y = [[UITextField alloc] initWithFrame:CGRectMake(15, 240, 360, 30)];
//    // Отображаемый текст в TextField
//    self.enteredCoordinate_Y.text =  @"Nik";
    // Выравниваем текст в TextField по центру
    self.enteredCoordinate_Y.textAlignment = NSTextAlignmentCenter;
    // Размер шрифта
    self.enteredCoordinate_Y.font = [UIFont systemFontOfSize:18.0];
    // Устанавливаем свойства для текстового поля
    // Задаем стиль рамки для текстового поля - линия
    self.enteredCoordinate_Y.borderStyle = UITextBorderStyleLine;
    // Задаем цвет рамки - черный
    self.enteredCoordinate_Y.layer.borderColor = [UIColor blackColor].CGColor;
    // Задаем щирину рамки - 1
    self.enteredCoordinate_Y.layer.borderWidth = 1.0;
    // Добавление TextField на экран
    [self.view addSubview:self.enteredCoordinate_Y];
    
    
    // 2.2.3 Cоздаем TextView (enterNameRobot) и TextField (enteredNameRobot)
    // Задаем координаты и размер TextView - enterNameRobot (Введите название робота)
    self.enterNameRobot = [[UITextView alloc] initWithFrame:CGRectMake(15, 300, 360, 30)];
    // Отображаемый текст в TextView
    self.enterNameRobot.text =  @"Введите название робота";
    // Выравниваем текст в TextView по центру
    self.enterNameRobot.textAlignment = NSTextAlignmentCenter;
    // Размер шрифта
    self.enterNameRobot.font = [UIFont systemFontOfSize:18.0];
    // Добавление TextView на экран
    [self.view addSubview:self.enterNameRobot];
    
    // Задаем координаты и размер TextField - enteredNameRobot (Введенное название робота)
    self.enteredNameRobot = [[UITextField alloc] initWithFrame:CGRectMake(15, 340, 360, 30)];
//    // Отображаемый текст в TextField
//    self.enteredNameRobot.text =  @"iRobot";
    // Выравниваем текст в TextField по центру
    self.enteredNameRobot.textAlignment = NSTextAlignmentCenter;
    // Размер шрифта
    self.enteredNameRobot.font = [UIFont systemFontOfSize:18.0];
    // Устанавливаем свойства для текстового поля
    // Задаем стиль рамки для текстового поля - линия
    self.enteredNameRobot.borderStyle = UITextBorderStyleLine;
    // Задаем цвет рамки - черный
    self.enteredNameRobot.layer.borderColor = [UIColor blackColor].CGColor;
    // Задаем ширину рамки - 1
    self.enteredNameRobot.layer.borderWidth = 1.0;
    // Добавление TextField на экран
    [self.view addSubview:self.enteredNameRobot];
    
    
    // 2.2.4 Cоздаем Button (confirmEntry)
    // Создание кнопки Button confirmEntry (Подтвердить ввод)
    self.confirmEntry = [UIButton buttonWithType:UIButtonTypeSystem];
    // Задаем координаты и размер кнопки
    [self.confirmEntry setFrame:CGRectMake(15, 400, 360, 30)];
    // Отображаемый текст в кнопке
    [self.confirmEntry setTitle:@"Подтвердить ввод" forState:UIControlStateNormal];
    // Для выполнения действия присваиваем кнопке метод - submitButtonPressed
    [self.confirmEntry addTarget:self action:@selector(submitButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    // Добавление кнопки на экран
    [self.view addSubview:self.confirmEntry];
    
    
    // 2.2.5 Cоздаем TextView (enterNameRobot и response)
    // Задаем координаты и размер TextView - displayingResponse (Отображение ответа)
    self.displayingResponse = [[UITextView alloc] initWithFrame:CGRectMake(15, 440, 360, 30)];
    // Отображаемый текст в TextView
    self.displayingResponse.text =  @"Отображение ответа";
    // Выравниваем текст в TextView по центру
    self.displayingResponse.textAlignment = NSTextAlignmentCenter;
    // Размер шрифта
    self.displayingResponse.font = [UIFont systemFontOfSize:18.0];
    // Добавление TextView на экран
    [self.view addSubview:self.displayingResponse];
    
    // Задаем координаты и размер TextView - response (Поле отображение ответа)
    self.response = [[UITextView alloc] initWithFrame:CGRectMake(15, 500, 360, 150)];
    // Выравниваем текст в TextView по центру
    //    self.postRequestResponse.textAlignment = NSTextAlignmentCenter;
    // Размер шрифта
    self.response.font = [UIFont systemFontOfSize:18.0];
    // Устанавливаем свойства для текстового поля
    // Задаем цвет рамки - черный
    self.response.layer.borderColor = [UIColor blackColor].CGColor;
    // Задаем щирину рамки - 1
    self.response.layer.borderWidth = 1.0;
    // Добавление TextView на экран
    [self.view addSubview:self.response];

    
    // 2.2.6 Cоздаем Button (goToSecondScreen)
    // Создание кнопки перехода на второй экран (Перейти на второй экран)
    self.goToSecondScreen = [UIButton buttonWithType:UIButtonTypeSystem];
    // Задаем координаты и размер кнопки - goToSecondScreen
    [self.goToSecondScreen setFrame:CGRectMake(100, 750, 200, 50)];
    // Отображаемый текст в кнопке
    [self.goToSecondScreen setTitle:@"Перейти на второй экран" forState:UIControlStateNormal];  
    // Для выполнения действия присваиваем кнопке метод - buttonTapped
    [self.goToSecondScreen addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
    // Добавление кнопки на экран
    [self.view addSubview:self.goToSecondScreen];
    
    
    // 2.6
    // Создаем объект (переменную) robotData класса NSData (с настройками, основываясь на стандартных настройках standardUserDefaultsи) и сохраняем в него данные с ключом @"Робот" (полученные из объекта userDefaults в // 2.5)
    NSData *robotData = [[NSUserDefaults standardUserDefaults] objectForKey:@"Робот"];
    // Проверяем на наличие данных в robotData
    if (robotData) {
        // Создаем объект ошибки (NSError) равный nil
        NSError *error = nil;
        // Распаковываем (десериализуем) объект robotData из бинарного формата и сохраняем результат в переменную robot. Вызываем метод unarchivedObjectOfClass и распаковываем в класс Robot, fromData - откуда (из robotData). Если в процессе десериализации происходят ошибки, то информация об ошибках сохраняется в переменную error
        Robot *robot = [NSKeyedUnarchiver unarchivedObjectOfClass:[Robot class] fromData:robotData error:&error];
        // Проверяем на наличие ошибок (не во все поля введены данные). Если есть ошибка, то:
        if (error) {
//            NSLog(@"Не удалось разархивировать robot : %@", error);
            // Формируем строку, которая будет отображаться в ответ на запрос. Присваиваем свойству text объекта response результат строкового значения
            self.response.text = @"Для получения данных о роботе необходимо заполнить все три поля выше ";
        } else {
            // Если ошибок нет, то формируем строку, которая будет отображаться в ответ на запрос. Присваиваем свойству text объекта response результат строкового значения
            self.response.text = [NSString stringWithFormat:@"Робот: %@\n Координаты: (%.2d, %.2d)", robot.name, robot.x, robot.y];
        }
    } else {
        // Если в robotData нет данных, выводится сообщение
        self.response.text = @"Данные о роботе отсутствуют";
    }
}


// 2.3 (кнопки перехода на второй экран 2.2.6)
// Метод перехода на второй экран
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


// 2.4
// 1. Проверяем, содержат ли текстовые поля данные или нет
// 2. В методе isValidTextField определяем, какую проверку нужно провести: числовую для координат и обычную на наличие текста для имени робота (включая проверку на отсутствие введенного пробела в качестве первого символа). В случае ошибочного ввода, выводится предупреждение с помощью UIAlertController и возвращаем NO, чтобы предотвратить выполнение дальнейших действий.
- (BOOL)isValidTextField:(UITextField *)textField {
    // Создаем переменную text типа (NSString *) и присваиваем ей значение (символы, которые вводим в TextField)
    NSString *text = textField.text;
    // Создаем набор всех символов, кроме чисел
    NSCharacterSet *nonNumbersSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    // Проверяем, есть ли в строке символы, не являющиеся числами
    BOOL containsNonNumbers = [text rangeOfCharacterFromSet:nonNumbersSet].location != NSNotFound;

    if (textField == self.enteredCoordinate_X || textField == self.enteredCoordinate_Y) {
        // Проверяем наличие символов в TextField и делаем числовую проверку
        if (text.length > 0 && !containsNonNumbers) {
            // Если в текстовом поле содержатся только цифры, возвращаем YES
            return YES;
        } else {
            // Создаем объект UIAlertController, который используется для отображения всплывающего окна с сообщением об ошибке. Первый параметр: заголовке окна (alertControllerWithTitle) - "Ошибка", второй: message - "Пожалуйста, заполните все поля", третий: стиль окна (UIAlertControllerStyleAlert), который обозначает, что окно будет отображено как оповещение с кнопкой "ОК"
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Ошибка" message:@"Пожалуйста, введите числовое значение в поле ввода координат" preferredStyle:UIAlertControllerStyleAlert];
            // Создает экземпляр okAction класса UIAlertAction: первый параметр: заголовок (actionWithTitle) "OK", второй: стиль - UIAlertActionStyleDefault, третий: блок-обработчик со значением nil (создается кнопка действия "OK" без определенного обработчика, которая будет показываться как одна из опций в UIAlertController)
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            // К объекту alertController добавляем действие ок (okAction). Действие "ок" будет отображено как одна из кнопок в UIAlertController и пользователь может нажать на нее для выполнения определенного действия
            [alertController addAction:okAction];
            // Открываем представление UIAlertController, который позволяет отобразить пользователю предупреждающее сообщение или запрос на подтверждение действия. При выполнении кода, представление будет открыто с анимацией и выполнится какое-либо действие после завершения анимации (предоставлено значение completion: nil)
            [self presentViewController:alertController animated:YES completion:nil];
            // Если введены некорректные символы или поле пустое, показываем сообщение и возвращаем NO
            return NO;
        }
    } else if (textField == self.enteredNameRobot) {
        // Проверяем наличие текста (без проведения числовой проверки) и на отсутствие введенного пробела в качестве первого символа
        if (text.length > 0 && !([text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length == 0)) {
            // Если в текстовом поле содержатся символы, возвращаем YES
            return YES;
        } else {
            // Создаем объект UIAlertController, который используется для отображения всплывающего окна с сообщением об ошибке. Первый параметр: заголовке окна (alertControllerWithTitle) - "Ошибка", второй: message - "Пожалуйста, заполните все поля", третий: стиль окна (UIAlertControllerStyleAlert), который обозначает, что окно будет отображено как оповещение с кнопкой "ОК"
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Ошибка" message:@"Пожалуйста, введите название робота" preferredStyle:UIAlertControllerStyleAlert];
            // Создает экземпляр okAction класса UIAlertAction: первый параметр: заголовок (actionWithTitle) "OK", второй: стиль - UIAlertActionStyleDefault, третий: блок-обработчик со значением nil (создается кнопка действия "OK" без определенного обработчика, которая будет показываться как одна из опций в UIAlertController)
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            // К объекту alertController добавляем действие ок (okAction). Действие "ок" будет отображено как одна из кнопок в UIAlertController и пользователь может нажать на нее для выполнения определенного действия
            [alertController addAction:okAction];
            // Открываем представление UIAlertController, который позволяет отобразить пользователю предупреждающее сообщение или запрос на подтверждение действия. При выполнении кода, представление будет открыто с анимацией и выполнится какое-либо действие после завершения анимации (предоставлено значение completion: nil)
            [self presentViewController:alertController animated:YES completion:nil];
            // Если поле пустое, показываем сообщение и возвращаем NO
            return NO;
        }
    }
    // В остальных случаях возвращаем NO
    return NO;
}


// 2.5
// Метод submitButtonPressed вызывается при нажатии на кнопку отправки данных (// 2.2.4 (confirmEntry) Подтвердить ввод)). Он использует метод isValidTextField для проверки каждого текстового поля. Если все текстовые поля содержат данные, то переменным x, y и name соответствующим образом присваиваются значения из текстовых полей для выполнения дальнейшие действий с этими данными
 // Вызываем метод isValidTextField для каждого TextField, передавая соответствующий TextField в качестве аргумента
- (IBAction)submitButtonPressed:(UIButton *)sender {
    if ([self isValidTextField:self.enteredCoordinate_X] && 
        [self isValidTextField:self.enteredCoordinate_Y] &&
        [self isValidTextField:self.enteredNameRobot]) {
        // Все TextField содержат данные
        // Создаем переменную x типа float и присваиваем ей значение, (символы, введенные в TextField)
        float x = [self.enteredCoordinate_X.text floatValue];
        // Создаем переменную y типа float и присваиваем ей значение, (символы, введенные в TextField)
        float y = [self.enteredCoordinate_Y.text floatValue];
        // Создаем переменную name типа (NSString * ) присваиваем ей значение (символы, введенные в TextField)
        NSString *name = self.enteredNameRobot.text;
        // Создаем объект robot типа Robot с помощью инициализатора initWithX:y:name:, передавая значения переменных x, y и name
        Robot *robot = [[Robot alloc] initWithX:x y:y name:name];
        // Создаем объект ошибки (NSError)
        NSError *error;
        // Преобразуем объект robot в формат NSData, используя NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error. NSKeyedArchiver позволяет сериализовать (упаковывать) объекты в NSData и сохранять их в файл или передавать по сети. Архиватор сохраняет объекты в бинарном формате, который можно восстановить (десериализовать) обратно в объекты с помощью NSKeyedUnarchiver. Аргумент requiringSecureCoding устанавливает, должны ли объекты быть сериализованы с использованием безопасного кодирования, включая проверку на целостность и передачу данных, указываем NO. Результат операции (преобразованный объект в формат NSData) сохраняется в переменную robotData. Если в процессе сериализации происходят ошибки, то информация об ошибках сохраняется в переменную error
          NSData *robotData = [NSKeyedArchiver archivedDataWithRootObject:robot requiringSecureCoding:NO error:&error];
          // Проверяем на наличие ошибок
          if (error) {
              // Выводим ошибку в консоль
              NSLog(@"Ошибка при архивации объекта: %@", error);
          } else {
              // 2 Заполняем userDefaults значениями
              // Создаем объект (переменную) userDefaults класса NSUserDefaults с настройками, основываясь на стандартных настройках standardUserDefaults
//              [[NSUserDefaults standardUserDefaults] setObject:robotData forKey:@"Робот"];
              NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
              // Заполняем userDefaults. Первым параметром объекта передаем то, что хотим записать: значение - robotData, вторым параметром: ключ - @"Робот"
              [userDefaults setObject:robotData forKey:@"Робот"];
              // Формируем строку, которая будет отображаться в ответ на запрос (используем метод stringWithFormat: класса NSString для создания строки с заданным форматированием).
              //Присваиваем свойству text объекта response результат строкового значения
              self.response.text = [NSString stringWithFormat:@"Робот: %@\n Координаты: (%.2d, %.2d)", robot.name, robot.x, robot.y];
          }
    } else {
        // Если не все TextField содержат данные:
        // Создаем объект UIAlertController, который используется для отображения всплывающего окна с сообщением об ошибке. Первый параметр: заголовке окна (alertControllerWithTitle) - "Ошибка", второй: message - "Пожалуйста, заполните все поля", третий: стиль окна (UIAlertControllerStyleAlert), который обозначает, что окно будет отображено как оповещение с кнопкой "ОК"
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Ошибка" message:@"Пожалуйста, заполните все поля" preferredStyle:UIAlertControllerStyleAlert];
        // Создает экземпляр okAction класса UIAlertAction: первый параметр: заголовок (actionWithTitle) "OK", второй: стиль - UIAlertActionStyleDefault, третий: блок-обработчик со значением nil (создается кнопка действия "OK" без определенного обработчика, которая будет показываться как одна из опций в UIAlertController)
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        // К объекту alertController добавляем действие ок (okAction). Действие "ок" будет отображено как одна из кнопок в UIAlertController и пользователь может нажать на нее для выполнения определенного действия
        [alertController addAction:okAction];
        // Открываем представление UIAlertController, который позволяет отобразить пользователю предупреждающее сообщение или запрос на подтверждение действия. При выполнении кода, представление будет открыто с анимацией и выполнится какое-либо действие после завершения анимации (предоставлено значение completion: nil)
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

@end
















//    // Создание кнопки перехода на второй экран
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
//    // Задаем координаты и размер TextField - enteredNameRobot (Введенное название робота)
//    [button setFrame:CGRectMake(100, 750, 200, 50)];
//    // Отображаемый текст в Button
//    [button setTitle:@"Перейти на второй экран" forState:UIControlStateNormal];  // Для выполнения действия присваиваем кнопке метод - buttonTapped
//    [button addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
//    // Добавление Button на экран
//    [self.view addSubview:button];


// Без проверки на ввод текста в поля с координатами
//- (BOOL)isValidTextField:(UITextField *)textField {
//    // Создаем переменную text типа (NSString *) и присваиваем ей значение (символы, которые вводим в TextField)
//    NSString *text = textField.text;
//    // Проверяем наличие символов в TextField
//    if (text.length > 0 && ![text isEqualToString:@"NaN"]) {
//        // Если текстовое поле содержит данные, метод возвращает значение YES
//        return YES;
//    } else {
//        // Если текстовое поле не содержит данные, метод возвращает значение NO или содержит NaN
//        return NO;
//    }
//}
