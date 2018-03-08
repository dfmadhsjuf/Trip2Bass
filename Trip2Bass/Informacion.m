//
//  Informacion.m
//  Trip2Bass
//
//  Created by alumno on 7/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import "Informacion.h"

@implementation Informacion

//constructor de informacion
-(id)initWithTitulo:(NSString *)tituloInfo conContenido:(NSString *)contenido conFecha:(NSString *)fechaPublicacion yConAutor:(NSString *)autor{
    self = [super init];
    if (self) {
        self.tituloInfo = tituloInfo;
        self.contenidoInfo = contenido;
        self.autor = autor;
        self.fechaPublicacion = fechaPublicacion;
        
        return self;
    }
    return nil;
    
}

@end
