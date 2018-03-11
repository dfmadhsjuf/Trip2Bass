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
@end

@implementation ComentariosDataController
-(void) initializeDefaultDataList{
    //Inicializamos la lista de los eventos.
    _masterComentariosList =  [[NSMutableArray alloc] init];
    Comentario* comentario =  [[Comentario alloc]initWithUsuario:@"proview1996" tipo:@"controles" contenido:@"Hay control en la rotonda"];
    [self addComentario:comentario];
    Comentario* comentario2 = [[Comentario alloc]initWithUsuario:@"proview1996" tipo:@"ayuda" contenido:@"Puedo aportar equipo"];
    [self addComentario:comentario2];
    //Inicialiamos la BD.
    //DBManager* db = [[DBManager alloc] initWithDatabaseFilename:@"Trip2Bass.sqlite"];
    //Cargamos los usuarios que hay la bd.
    //self.masterInvitacionList = [db getEventosUsuario];
    
}

- (void)setMasterMemeList:(NSMutableArray *)newList {
    if (_masterComentariosList != newList) {
        _masterComentariosList= [newList mutableCopy];
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
    return [self.masterComentariosList count];
}

-(Comentario*) objectInListAtIndex:(NSUInteger)theIndex{
    return [self.masterComentariosList objectAtIndex:theIndex];
}

-(void) addComentario:(Comentario *)comentario{
    [self.masterComentariosList addObject: comentario];
}
@end
