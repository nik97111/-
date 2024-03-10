//
//  DoctorDelegate.h
//  Solution_3
//
//  Created by Николай Чупреев on 16.01.2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DoctorDelegate <NSObject>

// Объявляем метод выпить пилюлю пациенту (takePillToPatient)
- (void) takePillToPatient;

@end

NS_ASSUME_NONNULL_END
