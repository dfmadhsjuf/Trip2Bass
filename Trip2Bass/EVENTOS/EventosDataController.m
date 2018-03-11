//
//  EventosDataController.m
//  Trip2Bass
//
//  Created by alumno on 2/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import "EventosDataController.h"
#import "Eventos.h"
#import "DBManager.h"

@interface EventosDataController()
-(void) initializeDefaultDataList;
@end

@implementation EventosDataController

-(void) initializeDefaultDataList{
    
    //Inicializamos la lista de los eventos.
    _masterEventosList =  [[NSMutableArray alloc] init];
    //Inicialiamos la BD.
    DBManager* db = [[DBManager alloc] initWithDatabaseFilename:@"Trip2Bass.sqlite"];
    //Cargamos los eventos en la lista de eventos.
    self.masterEventosList = [db getEventosUsuario:self.nicknameUsuario];
    
    //Segun el tipo de evento le asociamos una foto u otra
    for (int i = 0; i < [self.masterEventosList count]; i++) {
        Eventos* ev = [self objectInListAtIndex:i];
        if ([ev.tipo isEqualToString:@"Fiesta"]) {
            [ev setFoto:@"fondo_evento1"];
        }else{
            [ev setFoto:@"fondo_evento2"];
        }
    }
}

- (void)setMasterMemeList:(NSMutableArray *)newList {
    if (_masterEventosList != newList) {
        _masterEventosList = [newList mutableCopy];
    }
}

- (id)initWhitNickname:(NSString*)nicknameUsuario {
    
    if (self = [super init]) {
        self.nicknameUsuario = nicknameUsuario;
        [self initializeDefaultDataList];
        return self;
    }
    
    return nil;
}

-(NSUInteger) countOfList{
    return [self.masterEventosList count];
}

-(Eventos*) objectInListAtIndex:(NSUInteger)theIndex{
    return [self.masterEventosList objectAtIndex:theIndex];
}

-(void) addEvento:(Eventos*) evento{
    [self.masterEventosList addObject: evento];
}

@end

