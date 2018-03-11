//
//  InvitarUsuariosDataController.m
//  Trip2Bass
//
//  Created by Alumno on 11/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import "InvitarUsuariosDataController.h"
#import "Usuarios.h"
#import "DBManager.h"

@interface InvitarUsuariosDataController()
-(void) initializeDefaultDataList;
@end


@implementation InvitarUsuariosDataController

-(void) initializeDefaultDataList{
    //Inicializamos la lista de los eventos.
    _masterInvitacionList =  [[NSMutableArray alloc] init];
    Usuarios* user =  [[Usuarios alloc]initWithNombre:@"Pepe" usuario:@"Pepe89"];
    [self addUsuario:user];
    Usuarios* user1 = [[Usuarios alloc]initWithNombre:@"Jonathan" usuario:@"Proview1996"];
    [self.masterInvitacionList addObject:user1];
    Usuarios* user2 = [[Usuarios alloc]initWithNombre:@"Noelia" usuario:@"Noetsai"];
    [self.masterInvitacionList addObject:user2];
    
    //Inicialiamos la BD.
    //DBManager* db = [[DBManager alloc] initWithDatabaseFilename:@"Trip2Bass.sqlite"];
    //Cargamos los usuarios que hay la bd.
    //self.masterInvitacionList = [db getEventosUsuario];
    
}

- (void)setMasterMemeList:(NSMutableArray *)newList {
    if (_masterInvitacionList != newList) {
        _masterInvitacionList = [newList mutableCopy];
    }
}

- (id)init {
    
    if (self = [super init]) {
        [self initializeDefaultDataList];
        return self;
    }
    
    return nil;
}

-(NSUInteger) countOfList{
    return [self.masterInvitacionList count];
}

-(Usuarios*) objectInListAtIndex:(NSUInteger)theIndex{
    return [self.masterInvitacionList objectAtIndex:theIndex];
}

-(void) addUsuario:(Usuarios *)usuarios{
    [self.masterInvitacionList addObject: usuarios];
}

@end
