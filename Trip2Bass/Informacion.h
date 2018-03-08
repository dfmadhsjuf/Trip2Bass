//
//  Informacion.h
//  Trip2Bass
//
//  Created by alumno on 7/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Informacion : NSObject

//PROPIEDADES DE INFORMACION
@property NSString* tituloInfo;
@property NSString* contenidoInfo;
@property NSString* autor;
@property NSString* fechaPublicacion;

//CONSTRUCTOR
-(id)initWithTitulo:(NSString*)tituloInfo conContenido:(NSString*)contenido conFecha:(NSString*)fechaPublicacion yConAutor:(NSString*)autor;

@end
