//
//  Patient.h
//  Solution_3
//
//  Created by Николай Чупреев on 16.01.2024.
//

#import <Foundation/Foundation.h>

// Импортируем протокол DoctorDelegate
#import "DoctorDelegate.h"

NS_ASSUME_NONNULL_BEGIN

// Пациент подписан под DoctorDelegate
@interface Patient : NSObject<DoctorDelegate>

@end

NS_ASSUME_NONNULL_END
