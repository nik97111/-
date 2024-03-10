//
//  Patient.m
//  Solution_3
//
//  Created by Николай Чупреев on 16.01.2024.
//

#import "Patient.h"

@implementation Patient


// Метод выпить пилюлю пациенту (takePillToPatient, задан в протоколе DoctorDelegate, на который подписан пациент в Patient.h))
- (void)takePillToPatient {
    NSLog(@"Пациент выпил пилюлю");
}

@end
