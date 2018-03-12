//
//  ComentariosDataController.h
//  Trip2Bass
//
//  Created by Alumno on 11/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Comentario;

@interface ComentariosDataController : NSObject

@property (nonatomic, copy) NSMutableArray* masterComentariosList;


-(NSUInteger) countOfList;
-(Comentario*) objectInListAtIndex:(NSUInteger)theIndex;
-(void) addComentario:(Comentario*) comentario;

- (id)initWhitCodEvento:(NSNumber*)codigoEvento;

@end
