//
//  Eventos.h
//  Trip2Bass
//
//  Created by alumno on 21/2/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Eventos : NSObject

//PROPIEDADES DE UN EVENTO
@property NSString* nombre;
@property NSString* tipo;
@property NSString* area;
@property NSString* fecha; //SERA NSSTRING SOLO PARA PRUEBAS (NSDATE)

-(id)initWithName:(NSString*)nombre conTipo:(NSString*)tipo conArea:(NSString*)area yFecha:(NSString*)fecha;

@end
