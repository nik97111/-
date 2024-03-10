//
//  Doctor.h
//  Solution_3
//
//  Created by Николай Чупреев on 16.01.2024.
//

#import <Foundation/Foundation.h>

// Импортируем протокол DoctorDelegate
#import "DoctorDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface Doctor : NSObject


// Объявляем свойство делегат (delegate), ссылка должна быть слабой (weak, так как передаем делегирование сразу всем пациентам, а не одному), указываем атрибут nullable (позволяет присвоить значение nil (пустое значение при отсутствии пациентов в данный момент)), id - обозначает любой класс, удовлетворяющий протоколу DoctorDelegate (в данном случае Patient, он подписан под DoctorDelegate)
@property (nonatomic, weak, nullable) id<DoctorDelegate> delegate;

// Объявляем метод выдать пилюлю пациенту (givePillToPatient)
- (void) givePillToPatient;


@end

NS_ASSUME_NONNULL_END
