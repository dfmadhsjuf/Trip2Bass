//
//  Comentario.m
//  Trip2Bass
//
//  Created by Alumno on 11/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import "Comentario.h"

@implementation Comentario
-(id)initWithUsuario:(NSString*)usuario tipo:(NSString*)tipo contenido:(NSString*)contenido{
    self = [super init];
    if(self){
        self.usuario = usuario;
        self.tipo = tipo;
        self.contenido = contenido;
        
        return self;
    }
    
    return nil;
}
@end
