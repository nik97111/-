//
//  main.m
//  Solution_3
//
//  Created by Николай Чупреев on 16.01.2024.
//

// Написать классы Doctor (Доктор) и Patient (Пациент). Доктор делегирует пациенту выпить пилюлю. Пациент по указанию доктора ее выпивает. Требуется реализовать взаимодействие доктора и пациента через делегат.


#import <Foundation/Foundation.h>

// Импортируем классы
#import "Doctor.h"
#import "Patient.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Создаем объект - доктор
        Doctor *doctor = [Doctor new];
        
        // Создаем объект - пациент
        Patient *patient = [Patient new];
        
        // Доктор указывает, кто подписан под его делегат - пациент
        doctor.delegate = patient;
        
        // Доктор дает команду выдать пилюлю (вызывается метод prepareHomework)
        [doctor givePillToPatient];
    }
    return 0;
}
