//
//  InvitarUsuariosDataController.h
//  Trip2Bass
//
//  Created by Alumno on 11/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

@class Usuarios;

#import <Foundation/Foundation.h>

@interface InvitarUsuariosDataController : NSObject

@property (nonatomic, copy) NSMutableArray* masterInvitacionList;


-(NSUInteger) countOfList;
-(Usuarios*) objectInListAtIndex:(NSUInteger)theIndex;
-(void) addUsuario:(Usuarios*) usuarios;

@end
