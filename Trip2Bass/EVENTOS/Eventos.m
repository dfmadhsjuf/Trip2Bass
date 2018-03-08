//
//  Eventos.m
//  Trip2Bass
//
//  Created by alumno on 21/2/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import "Eventos.h"

@implementation Eventos

//CONSTRUCTOR DE EVENTOS
-(id)initWithName:(NSString*)nombre conTipo:(NSString*)tipo conArea:(NSString*)area yFecha:(NSString*)fecha{
    self = [super init];
    if (self) {
        self.nombre = nombre;
        self.tipo = tipo;
        self.area = area;
        self.fecha = fecha;
        
        return self;
    }
    return nil;
}

@end
