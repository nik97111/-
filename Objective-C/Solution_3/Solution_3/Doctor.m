//
//  Doctor.m
//  Solution_3
//
//  Created by Николай Чупреев on 16.01.2024.
//

#import "Doctor.h"

@implementation Doctor

// Метод выдать пилюлю пациенту (givePillToPatient)
- (void) givePillToPatient {
    NSLog(@"Доктор выдал пилюлю");
    // У делегата (пациента) вызывается метод takePillToPatient
    [self.delegate takePillToPatient];
}

@end
