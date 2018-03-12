//
//  Comentario.h
//  Trip2Bass
//
//  Created by Alumno on 11/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comentario : NSObject

@property NSNumber* codigoEvento;
@property NSNumber* codigoUsuario;
@property NSString* usuario;
@property NSString* tipo;
@property NSString* contenido;

-(id)initWithUsuario:(NSString*)usuario tipo:(NSString*)tipo contenido:(NSString*)contenido;

@end
