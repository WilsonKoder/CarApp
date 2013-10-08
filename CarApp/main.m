//
//  main.m
//  CarApp
//
//  Created by Lui Lui on 9/17/13.
//  Copyright (c) 2013 Lui Lui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject
{
    NSString *color;
    int location;
}
-(void) moveCarFwd: (int) feet;
-(void) moveCarBkwd: (int) feet;
-(void) setLocation: (int) where;
-(int) getLocation;
@end


@implementation Car
-(void) moveCarFwd:(int) feet
{
    location = location + feet;
}

-(void) moveCarBkwd:(int) feet
{
    location = location - feet;
}

-(void) setLocation:(int)where
{
    location = where;
}

-(int) getLocation
{
    return location;
}

@end


int main(int argc, const char * argv[])
{

    
    @autoreleasepool {
        
        Car *Car1;
        Car *Car2;
        int tmp;
        char strIn[512];
        //NSMutableString *str;
        //NSArray *command;
        //NSString *car;
        //NSString *direction;
        //int amount;
        
        
        NSLog(@"Please give the first car's location:");
        scanf("%d", &tmp);
        [Car1 setLocation:tmp];
        NSLog(@"Please give the second car's location:");
        scanf("%d", &tmp);
        [Car2 setLocation:tmp];
        NSLog(@"lol");
        
        do {
            NSLog(@"How you want to move the Car: e.g. (Car1|Car2) (F|B) <int>");
            scanf("%[^\n]", strIn);
            NSMutableString *str = [NSString stringWithUTF8String:strIn];
            //NSLog(@"\n%@",str);
            // ask the user please give the initial position for car 1
            // ask the user please give the initial position for car 2
            
            NSArray *command = [str componentsSeparatedByString:@" "];
            //NSAssert(command.count == 3, @"Please follow the format: (Car1|Car2) (F|B) <int>");
            if (command.count != 3) {
                NSLog(@"Please follow the format: (Car1|Car2) (F|B) <int>");
                continue;
            }
            NSString *car = [command objectAtIndex:0];   //command[0]  ; command = [car2, F, 40]
            NSString *direction = [command objectAtIndex:1];
            //int amount = [[command objectAtIndex:2] intValue];
            int amount = [[command lastObject] intValue];

            
            if ([[car lowercaseString] isEqualToString:@"car1"]) {
                if ([[direction lowercaseString] isEqualToString:@"f"]) {
                    [Car1 moveCarFwd:amount];
                } else if ([[direction lowercaseString] isEqualToString:@"b"]){
                    [Car1 moveCarBkwd:amount];
                } else {
                    NSLog(@"Unrecongnized direction %@", direction);
                    continue;
                }
            } else if ([[car lowercaseString] isEqualToString:@"Car2"]) {
                if ([[direction lowercaseString] isEqualToString:@"f"]) {
                    [Car2 moveCarFwd:amount];
                } else if ([[direction lowercaseString] isEqualToString:@"b"]){
                    [Car2 moveCarBkwd:amount];
                } else {
                    NSLog(@"Unrecongnized direction %@", direction);
                    continue;
                }

            } else {
                //[NSException raise:@"Only take Car1 or Car2" format:@"Car input: %@", car];
                NSLog(@"Unrecongnized Car input %@", car);
                NSLog(@"No action taken.");
                continue;
            }
        } while (1);
/*
        newCar = [Car alloc];
        newCar = [newCar init];
        [newCar setLocation: 0];
        [newCar moveCarFwd: 5];
        [newCar moveCarBkwd: 8];
        NSLog(@"Location of the Car: %i", [newCar getLocation]);
 */
    }
    NSLog(@"Here is Lui");
    return 0;
}

