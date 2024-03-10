//
//  Loader.h
//  Solution_5
//
//  Created by Николай Чупреев on 25.01.2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Loader : NSObject

// Создаем свойство session, отвечающее за хранение сессии приложения. Атрибуты (nonatomic - если неизвестно, по каким причинам данное свойство не должно быть доступно двум и более потокам в единицу времени, для чего его нужно сделать безопасным, указываем nonatomic - метод, не создающий дополнительных проверок со стороны компилятора, strong - сильная ссылка). Сессия хранится в типе данных NSURLSession (как и любой класс имеет ссылочную структуру, поэтому указываем звездочку), название свойства - session
@property (nonatomic, strong)NSURLSession *session;


// Метод performGetRequestForUrl, подготавливающий get-запрос по URL. Первым параметром принимает ссылку в формате строки, тип - (NSString *)(NSString ссылочный тип данных, поэтому указываем звездочку), название параметра - stringUrl. Далее передаем аргументы: указываем внешний параметр - arguments, потом тип аргумента - (NSDictionary *)(NSDictionary ссылочный тип данных, поэтому указываем звездочку), далее название внутреннего параметра - arguments (обычно совпадает с названием внешнего). Следующий параметр - замыкание completion (которое будет крутиться), ничего не возвращает, принимает словарь и ошибку, которая может возникнуть в ходе запроса. Тип возвращаемого значения - void, (^), типы параметров блока (первый - словарь NSDictionary * и код ошибки NSError *), название параметра - completion
- (void)performGetRequestForUrl: (NSString *)stringUrl
        arguments: (NSDictionary *)arguments
        completion: (void (^) (NSDictionary *, NSError *))completion;


// Метод performPostRequestForUrl, подготавливающий post-запрос по URL. По аналогии с методом выше
- (void)performPostRequestForUrl: (NSString *)stringUrl
        arguments: (NSDictionary *)arguments
        completion: (void (^) (NSDictionary *, NSError *))completion;


// Вспомогательная функция, производит конвертацию из словаря сырые данные (для превращения существующего словаря в JSON-файл). Возвращает словарь (NSDictionary *), название метода - parsJSONData, принимает два параметра: сырые данные - data (описывается типом (классом) NSData *) и ошибка - error (описывается классом NSError ** (две звездочки, потому что это указатель на указатель))
- (NSDictionary *)parsJSONData: (NSData *)data error: (NSError **)error;

// Вспомогательная функция, обратная первой, производит конвертацию сырых данных в словарь (для превращения JSON-файл в существующий словарь). Возвращает сырые данные (NSData *), название метода - dataWithJSON, принимает два параметра: словарь - dict (описывается типом (классом) NSDictionary *) и ошибка - error (описывается классом NSError ** (две звездочки, потому что это указатель на указатель))
- (NSData *)dataWithJSON: (NSDictionary *)dict error: (NSError **)error;


@end

NS_ASSUME_NONNULL_END
