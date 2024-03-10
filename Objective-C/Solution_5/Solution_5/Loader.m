//
//  Loader.m
//  Solution_5
//
//  Created by Николай Чупреев on 25.01.2024.
//

#import "Loader.h"

@implementation Loader


// 4
// Объявляем свойство (так как оно вычисляемое, то объявляем как функцию). Возвращает (NSURLSession *), наименование объекта - session
- (NSURLSession *)session {
    // Первым делом проверем, не была ли сессия (свойство) создана ранее. При первом обращении она будет создана, при повторных - будет дублировать саму себя
    if (!_session) {
        // Объявляем базовую конфигурацию для сессии, которая хранится в типе NSURLSessionConfiguration. Создаем переменную configuration и присваиваем ей объект класса NSURLSessionConfiguration, у него есть метод defaultSessionConfiguration (который и создает базовую конфигурацию)
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        // Добавляем в базовую конфигурацию свои настройки. У переменной configuration есть свойство HTTPAdditionalHeaders - заголовки HTTP-запросов, которые можно подложить. Загололвки принимаются в виде словаря @{, далее указываем ключ-значение. Первфй параметр: ключ - @"Content-Type" (тип контента, который ожидается при выполнении запроса), тип - @"Application/JSON" (ожидаем, что будем принимать JSON-файл). Второй параметр: ключ - @"User-Agent" (показываем, с какого устройства (или через какой браузер) произошел вызов), тип - @"iPhone15ProMax Simulator"
        configuration.HTTPAdditionalHeaders = @{
            @"Content-Type": @"Application/JSON",  // свойство словаря
            @"User-Agent": @"iPhone15ProMax Simulator"  // свойство словаря
        };
        // Чтобы применить настройки, обращаемся к ivar _session и присваиваем следующие значения: у класса NSURLSession вызываем метод sessionWithConfiguration и передаем сформированную нами выше конфигурацию
        _session = [NSURLSession sessionWithConfiguration:configuration];
    }
    // Возвращаем ivar _session (для первого запуска сессии выполняется весь код, включая return _session; при повторном - только return _session;
    return _session;
}

// 3
// Метод, формирующий get-запрос (для получения информации с сервера). Сначала офоормляем URL-компоненты, чтобы в дальнейшем можно было сделать объект формата URL и для этого нужна вспомогательная конструкция, она описыввется классом NSURLComponents
- (void)performGetRequestForUrl:(NSString *)stringUrl arguments:(NSDictionary *)arguments completion:(void (^)(NSDictionary *, NSError *))completion {
    // Создаем объект urlComponents типа NSURLComponents и чтобы создать компоненты по строке, которая будет содержать наш URL, воспользуемся классом NSURLComponents, вызываем у него метод componentsWithString и передаем (параметр) строку - stringUrl, в которой находится URL
    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:stringUrl];
    // После того, как объявили компоненты, нужно определить, есть ли дополнительные аргументы, с которыми этот запрос запускался. Так как словарь это ссылочная структура и не имеет данные (то есть указывает на конкретный объект (указывает на nil (отсутствие значения)). Поэтому проверяем, передано ли значение, отличное от nil
    if (arguments) {
        // Если аргументы есть, превращаем их в мутабельный массив, элементами которого будут queryItems (элементы запроса). Создаем вспомогательный мутабельный массив (можно изменить количество элементов) типа NSMutableArray, далее с помощью треугольных скобок задаем тип элементов - <NSURLQueryItem *> (также имеет ссылочную структуру и ставится звездочка), которые будут содержаться в этом масииве и тут же создаем экземпляр класса = [NSMutableArray new]
        NSMutableArray<NSURLQueryItem *>*queryItems = [NSMutableArray new];
        // В словаре, который содержится в переменной arguments, проходим по все ключам и пересобираем структуру словаря в виде элементов queryItems (каждый элемент queryItems содержит ключ: значение) и сохраняем в массив. Ключи в виде строк - NSString *key, оператор in (key берем в ключах аргументов), указываем аргументы arguments и свойство allKeys, содержащее все ключи нашего словаря.
        for (NSString *key in arguments.allKeys) {
            // В мутабельный мвссив queryItems добавляем addObject объект типа NSURLQueryItem. Чтобы на месте создать эти объекты мы стучимся к классу NSURLQueryItem (этакая структура), у него есть метод queryItemWithName: первым передается ключ (по сути название поля, которое будет передаваться в аргументах) - key, второй параметр - это значение (value) (обращаемся к словарю по ключу и получаем значение) arguments[key]
            [queryItems addObject: [NSURLQueryItem queryItemWithName:key value:arguments[key]]];
        }
        // Так как URL-сомпоненты содержат этот массив дополнительных элементов запроса, то нужно связать элементы выше с queryItems
        // Обращаемся к urlComponents и его свойству queryItems (содержащее массив) и обращаясь к массиву queryItems передаем копию, использую метод copy
        urlComponents.queryItems = [queryItems copy];
    }
    // Независимо от того, выполнилось условие или нет, нужно вытащить URL из URL-компоненты. Чтобы сохранить URL есть тип данных NSURL. Создаем переменную url с типом NSUR и обращаемся к объекту URL-компонентыи егосвойству URL. Таким обрвзом из URL-компоненты вытащили URL
    NSURL *url = urlComponents.URL;
    
    // После того, как знаем URL, сформировали URL-компоненты, можем написать задачу, которая будет крутиться в рамках нашей сессии. Задача отпределяется классом NSURLSessionDataTask. Прежде чем создаем объект dataTask, создадим свойство определения сессии (в начале страницы) - // 4
    // Далее обращаемся к свойству session через self и у сессии есть метод dataTaskWithURL: первым передаем url (который вытащили ранее), вторым - замыкание completionHandler (которое будет отрабатываться)
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        // Проверяем, есть ли ошибки. Если есть, то дальнейшую обработку вести не можем: должны запустить замыкание - completion с первым параметром nil (так как ожидаем словарь, но его нет и вместо него передаем пустое значение), вторым error (ошибка, которая передается внутри замыкания)
        if (error) {
            completion(nil, error);
            // Чтобы программа не пошла дальше, указываем return (чтобы в данном случае выйти из функции досрочно)
            return;
        }
        // Объявляем переменную parsingError с типом NSError *, которая будет хранить ошибки в результате парсинга (например, данные после загрузки получились некондиционные, то есть не можем распарсить JSON)
        NSError *parsingError;
        // Создаем словарь dictionary типа (NSDictionary *) с помощью метода parsJSONData: присваиваем результат действия функции self parsJSONData (вызываем self у себя), первым параметром передаем сырые данные (данные передались замыканием data из 55 строки), второй параметр - адрес в памяти, куда будет записана ошибка в случае возникновения ошибки при парсинге - &parsingError (& - адрес, название переменной - parsingError). Если ошибка возникнет, она по адресу &parsingError] будет записана в нее
        NSDictionary *dictionary = [self parsJSONData:data error:&parsingError];
        // Проверяем, записалась ли какая-то ошибка в parsingError или нет
        if (parsingError) {
            // Если есть, то дальнейшую обработку вести не можем: должны запустить замыкание - completion с первым параметром nil (так как ожидаем словарь, но нечего возвращать, то вместо него передаем пустое значение), вторым - parsingError
            completion(nil, parsingError);
            // Чтобы программа не пошла дальше, указываем return (чтобы в данном случае выйти из функции досрочно)
            return;
        }
        // Если после проверок ошибок нет, выполняем замыкание completion, передав в качестве первого параметра dictionary (который распарсили), а второго - вместо ошибки передать nil
        completion(dictionary, nil);
    }];  // Весь код выше код сформировывал задачу, которая будет крутиться на выполнение
    
    // Ставим задачу на запуск: у переменной dataTask вызываем метод resume
    [dataTask resume];
}


// 5
- (void)performPostRequestForUrl:(NSString *)stringUrl arguments:(NSDictionary *)arguments completion:(void (^)(NSDictionary *, NSError *))completion {
    // Создаем переменную url и присвоим значение класса NSURL, у него есть метод URLWithString и передаем туда строку stringUrl. Таким образом обернули строку stringUrl в объект типа url
    NSURL *url = [NSURL URLWithString:stringUrl];
    // Создаем запрос: используется класс NSMutableURLRequest, имя переменной request. Чтобы создать запрос по url, создаем экземпляр объекта request, аллоцирукм под него память (вызываем метод alloc) и для инициализации вызываем метод initWithURL и передаем объект url
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    // По умолчанию request работает на get-запросы, чтобы сделать post-запрос обращаемся к request и его свойству HTTPMethod (метод, по которому можно выполнять запросы) и присвоить строку @"POST"
    request.HTTPMethod = @"POST";
    // Проверяем, есть ли дополнительные аргументы (массив дополнительных аргументов)
    if (arguments) {
        // Если передали, то создаем переменную data типа NSData и производим подгрузку данных с помощью метода dataWithJSON. Присваиваем переменной результат, который вернет функция dataWithJSON. Первым параметром передается словарь аргументов - arguments, а вторым - вместо ошибки передадим nil
        NSData *data = [self dataWithJSON:arguments error:nil];
        // Чтобы связать запрос с нашими данными обращаемся к запросу request и его свойству - HTTPBody  и присваиваем ему наши данные - data (отправляем в теле запроса всю информацию, которая содержалась в словаре)
        request.HTTPBody = data;
    }
    
    // Создаем переменную dataTask с помощью класса NSURLSessionDataTask и вызываем у self.session (self свойство session) метод dataTaskWithRequest, принимающий два параметра: первым передаем request, вторым - замыкание completionHandler (которое будет отрабатываться)
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        // Проверяем, есть ли ошибки. Если есть, то дальнейшую обработку вести не можем: должны запустить замыкание - completion с первым параметром nil (так как ожидаем словарь, но его нет и вместо него передаем пустое значение), вторым error (ошибка, которая передается внутри замыкания)
        if (error) {
            completion(nil, error);
            // Чтобы программа не пошла дальше, указываем return (чтобы в данном случае выйти из функции досрочно)
            return;
        }
        // Объявляем переменную parsingError с типом NSError *, которая будет хранить ошибки в результате парсинга (например, данные после загрузки получились некондиционные, то есть не можем распарсить JSON)
        NSError *parsingError;
        // Создаем словарь dictionary типа (NSDictionary *) с помощью метода parsJSONData: присваиваем результат действия функции self parsJSONData (вызываем self у себя), первым параметром передаем сырые данные (данные передались замыканием data из 55 строки), второй параметр - адрес в памяти, куда будет записана ошибка в случае возникновения ошибки при парсинге - &parsingError (& - адрес, название переменной - parsingError). Если ошибка возникнет, она по адресу &parsingError] будет записана в нее
        NSDictionary *dictionary = [self parsJSONData:data error:&parsingError];
        // Проверяем, записалась ли какая-то ошибка в parsingError или нет
        if (parsingError) {
            // Если есть, то дальнейшую обработку вести не можем: должны запустить замыкание - completion с первым параметром nil (так как ожидаем словарь, но нечего возвращать, то вместо него передаем пустое значение), вторым - parsingError
            completion(nil, parsingError);
            // Чтобы программа не пошла дальше, указываем return (чтобы в данном случае выйти из функции досрочно)
            return;
        }
        // Если после проверок ошибок нет, выполняем замыкание completion, передав в качестве первого параметра dictionary (который распарсили), а второго - вместо ошибки передать nil
        completion(dictionary, nil);
    }];
    
    // Ставим задачу на запуск: у переменной dataTask вызываем метод resume
    [dataTask resume];
}

// 2
// Метод, превращающий сырые данные (JSON) в словарь
- (NSDictionary *)parsJSONData:(NSData *)data error:(NSError **)error {
    // Для сериализации используем класс - NSJSONSerialization, у него есть метод - JSONObjectWithData, первым параметром передаем сырые данные - в переменной data, вторым параметром - дополнительная опция options ( если их нет, указывается опция - kNilOptions), третьим параметром - error
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:error];
}


// 1
// Метод, превращающий существующий словарь в данные, которые смогут быть отправлены в бинарном виде
- (NSData *)dataWithJSON:(NSDictionary *)dict error:(NSError **)error {
    // Для сериализации используем класс - NSJSONSerialization, у него есть метод - dataWithJSONObject, первым параметром принимается словарь - dict, вторым параметром - дополнительная опция options ( если их нет, указывается опция - kNilOptions), третьим параметром - error
    return [NSJSONSerialization dataWithJSONObject:dict options:kNilOptions error:error];
}

@end
