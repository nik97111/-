//
//  SecondViewController.m
//  Solution_6
//
//  Created by Николай Чупреев on 29.01.2024.
//

// Задание
// 3. Создать второй экран, с таким же набором элементов как на первом экране, но сохранить информацию о роботе в файл с названием таким же как имя робота и считать содержимое файла, отобразить в TextView (или в консоль при технических сложностях).

#import "SecondViewController.h"

@implementation SecondViewController

- (void)viewDidLoad { [super viewDidLoad];
    
    // Задаем цвет экрану - белый
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    // 3.2. Cоздаем TextView, TextField и Button
    // 3.2.1 Cоздаем TextView (enterCoordinate_X) и TextField (enteredCoordinate_X)
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
    
    // 3.2.2 Cоздаем TextView (enterCoordinate_Y) и TextField (enteredCoordinate_Y)
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
    
    // 3.2.3 Cоздаем TextView (enterNameRobot) и TextField (enteredNameRobot)
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
    // Выравниваем текст в TextField по центру
    self.enteredNameRobot.textAlignment = NSTextAlignmentCenter;
    // Размер шрифта
    self.enteredNameRobot.font = [UIFont systemFontOfSize:18.0];
    // Устанавливаем свойства для текстового поля
    // Задаем стиль рамки для текстового поля - линия
    self.enteredNameRobot.borderStyle = UITextBorderStyleLine;
    // Задаем цвет рамки - черный
    self.enteredNameRobot.layer.borderColor = [UIColor blackColor].CGColor;
    // Задаем щирину рамки - 1
    self.enteredNameRobot.layer.borderWidth = 1.0;
    // Добавление TextField на экран
    [self.view addSubview:self.enteredNameRobot];
    
    
    // 3.2.4 Cоздаем Button (confirmEntry)
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
    
    
    // 3.2.5 Cоздаем TextView (enterNameRobot и response)
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
    self.response = [[UITextView alloc] initWithFrame:CGRectMake(20, 500, 350, 100)];
    // Выравниваем текст в TextView по центру
    self.response.textAlignment = NSTextAlignmentCenter;
    // Размер шрифта
    self.response.font = [UIFont systemFontOfSize:18.0];
    // Устанавливаем свойства для текстового поля
    // Задаем цвет рамки - черный
    self.response.layer.borderColor = [UIColor blackColor].CGColor;
    // Задаем щирину рамки - 1
    self.response.layer.borderWidth = 1.0;
    // Добавление TextView на экран
    [self.view addSubview:self.response];
    
}

// 3.3
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



// 3.4
// Метод submitButtonPressed вызывается при нажатии на кнопку отправки данных (// 3.2.4 (confirmEntry) Подтвердить ввод)). Он использует метод isValidTextField для проверки каждого текстового поля. Если все текстовые поля содержат данные, то переменным x, y и name соответствующим образом присваиваются значения из текстовых полей для выполнения дальнейшие действий с этими данными
 // Вызываем метод isValidTextField для каждого TextField, передавая соответствующий TextField в качестве аргумента
- (IBAction)submitButtonPressed:(UIButton *)sender {
    if ([self isValidTextField:self.enteredCoordinate_X] &&
        [self isValidTextField:self.enteredCoordinate_Y] &&
        [self isValidTextField:self.enteredNameRobot]) {
        // Все textField содержат данные
        // Создаем переменную x типа float и присваиваем ей значение, (символы, введенные в TextField)
        float x = [self.enteredCoordinate_X.text floatValue];
        // Создаем переменную y типа float и присваиваем ей значение, (символы, введенные в TextField)
        float y = [self.enteredCoordinate_Y.text floatValue];
        // Создаем переменную name типа (NSString * ) присваиваем ей значение (символы, введенные в TextField)
        NSString *name = self.enteredNameRobot.text;
        // Создаем объект robot типа Robot с помощью инициализатора initWithX:y:name:, передавая значения переменных x, y и name
        Robot *robot = [[Robot alloc] initWithX:x y:y name:name];
        // Создаем объект filePath типа ( NSString ) и путь к файлу с расширением в директории документов. Класс NSSearchPathForDirectoriesInDomains(константа NSDocumentDirectory - директория, в которой хотим работать, в частности, в папке документы, NSUserDomainMask: inDomain - возможность работать под различными правами, например, под пользователем и поэтому указываем NSUserDomainMas, YES) возвращает путь к директории документов на устройстве. Этот код возвращает массив, нам же из всего массива данных нужен первый, поэтому после квадратой скобки пишем .firstObject (вытаскиваем первый объект), stringByAppendingPathComponent добавляет компонент к пути, [NSString stringWithFormat:@"%@.robot", robot.name] создает строку, состоящую из имени робота и расширения .robot. Эта строка будет добавлена как компонент пути к документам. Таким образом сделали путь к папке с документами
        NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.robot", robot.name]];
        // Сохраняем созданный объект filePath в robotData
        // Его нельзя сохранить полностью, поэтому сохраняем в бинарном (двоичном) виде. Чтобы преобразовать объект в двоичный вид используем класс NSKeyedArchiver (отвечает за архивацию (сжимает объекты до бинарного вида)). У него есть метод archivedDataWithRootObject (это первый параметр), второй параметр - requiringSecureCoding (указывается, нужна ли дополнительная кодировка), третий - наличие ошибок. В первом параметре указываем, что хотим сохранить - наш объект: robot, во втором - NO, в error: nil.
        // Так как метод archivedDataWithRootObject возвращает данные в сыром виде, поэтому сохраняем их в robotData (создаем объект robotData типа NSData * (ссылочный тип)
        NSData *robotData = [NSKeyedArchiver archivedDataWithRootObject:robot requiringSecureCoding:NO error:nil];
        // Записываем файл с именем "filePath" и содержимым "robotData". Обращаемся к robotData и вызываем функцию writeToFile - возвращает значение типа BOOL, которое указывает, удалось ли успешно выполнить операцию записи файла. Если значение success равно YES, значит файл был успешно записан; если значение success равно NO, значит возникли проблемы при записи файла
        BOOL success = [robotData writeToFile:filePath atomically:YES];
        // Проверяем на наличие ошибок при записи файла
        // Если запись файла прошла успешно
        if (success) {
            // Если запись файла прошла успешно, выводим сообщение в консоль
            NSLog(@"Информация о роботе успешно сохранена в файл");
        } else {
            // Если при записи файла произошла ошибка,выводим ее в консоль
            NSLog(@"Ошибка при сохранении инфйормации о роботе в файл");
        }
        // Формируем строку, которая будет отображаться в ответ на запрос (используем метод stringWithFormat: класса NSString для создания строки с заданным форматированием).
        //Присваиваем свойству text объекта response результат строкового значения
        self.response.text = [NSString stringWithFormat:@"Данные, считанные из файла\n Робот: %@\nКоординаты: (%.2d, %.2d)", robot.name, robot.x, robot.y];
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

