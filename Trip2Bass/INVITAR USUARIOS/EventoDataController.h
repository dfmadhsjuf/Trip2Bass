//
//  EventoDataController.h
//  Trip2Bass
//
//  Created by Alumno on 11/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

@class Invitacion;
#import <Foundation/Foundation.h>

@interface EventoDataController : NSObject

@property (nonatomic, copy) NSMutableArray* masterEventosList;


-(NSUInteger) countOfList;
-(Invitacion*) objectInListAtIndex:(NSUInteger)theIndex;
-(void)addInvitacion:(Invitacion*) invitacion;


@end
