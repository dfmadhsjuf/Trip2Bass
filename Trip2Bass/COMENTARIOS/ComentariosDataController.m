//
//  ComentariosDataController.m
//  Trip2Bass
//
//  Created by Alumno on 11/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import "ComentariosDataController.h"
#import "DBManager.h"
#import "Comentario.h"

@interface ComentariosDataController()
-(void) initializeDefaultDataList;

@property NSNumber* codEvento;
@end

@implementation ComentariosDataController
-(void) initializeDefaultDataList{
    
    //Inicializamos la lista de los eventos.
    _masterComentariosList =  [[NSMutableArray alloc] init];
    //Inicialiamos la BD.
    DBManager* db = [[DBManager alloc] initWithDatabaseFilename:@"Trip2Bass.sqlite"];
    //Cargamos los comentarios del evento.
    self.masterComentariosList = [db getComentariosEvento:self.codEvento];
    
}

- (void)setMasterMemeList:(NSMutableArray *)newList {
    if (_masterComentariosList != newList) {
        _masterComentariosList= [newList mutableCopy];
    }
}

- (id)initWhitCodEvento:(NSNumber*)codigoEvento {
    
    if (self = [super init]) {
        self.codEvento = codigoEvento;
        [self initializeDefaultDataList];
        return self;
    }
    
    return nil;
}

-(NSUInteger) countOfList{
    return [self.masterComentariosList count];
}

-(Comentario*) objectInListAtIndex:(NSUInteger)theIndex{
    return [self.masterComentariosList objectAtIndex:theIndex];
}

-(void) addComentario:(Comentario *)comentario{
    [self.masterComentariosList addObject: comentario];
}
@end
