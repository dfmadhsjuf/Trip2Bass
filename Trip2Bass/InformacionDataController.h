//
//  InformacionDataController.h
//  Trip2Bass
//
//  Created by alumno on 7/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Informacion.h"

@interface InformacionDataController : NSObject

-(NSUInteger) countOfList;
-(Informacion*) objectInListAtIndex:(NSUInteger)theIndex;
-(void) addEvento:(Informacion*) evento;

@end
