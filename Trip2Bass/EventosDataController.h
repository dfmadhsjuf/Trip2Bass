//
//  EventosDataController.h
//  Trip2Bass
//
//  Created by alumno on 2/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Eventos;

@interface EventosDataController : NSObject

@property (nonatomic, copy) NSMutableArray* masterEventosList;


-(NSUInteger) countOfList;
-(Eventos*) objectInListAtIndex:(NSUInteger)theIndex;
-(void) addEvento:(Eventos*) evento;

@end
