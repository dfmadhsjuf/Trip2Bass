//
//  EventosDataController.m
//  Trip2Bass
//
//  Created by alumno on 2/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import "EventosDataController.h"
#import "Eventos.h"

@interface EventosDataController()
-(void) initializeDefaultDataList;
@end

@implementation EventosDataController

-(void) initializeDefaultDataList{
    //Inicializamos nuestra lista de eventos.
    _masterEventosList =  [[NSMutableArray alloc] init];
    
    //Cargamos los eventos iniciales.
    Eventos* evento = [[Eventos alloc]initWithName:@"Fiesta1" conTipo:@"Fiesta" conArea:@"ALC" yFecha:@"09/03/2018"];
    [self addEvento:evento];
    evento = [[Eventos alloc]initWithName:@"Quedada1" conTipo:@"Quedada" conArea:@"VLC" yFecha:@"15/06/2018"];
    [self addEvento:evento];
    evento = [[Eventos alloc] initWithName:@"Fiesta2" conTipo:@"Fiesta" conArea:@"BCN" yFecha:@"15/03/2018"];
    [self addEvento:evento];
    evento = [[Eventos alloc]initWithName:@"Quedada2" conTipo:@"Quedada" conArea:@"VLC" yFecha:@"15/06/2018"];
    [self addEvento:evento];
    evento = [[Eventos alloc] initWithName:@"Fiesta3" conTipo:@"Fiesta" conArea:@"BCN" yFecha:@"15/03/2018"];
    [self addEvento:evento];
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

- (id)init {
    
    if (self = [super init]) {
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

