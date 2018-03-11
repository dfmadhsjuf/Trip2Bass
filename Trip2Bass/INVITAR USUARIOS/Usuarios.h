//
//  Usuarios.h
//  Trip2Bass
//
//  Created by Alumno on 11/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Usuarios : NSObject

@property NSString* nombreUsuario;
@property NSString* nombreCompletoUsuario;
@property NSString* fotoUsuario;

-(id)initWithNombre:(NSString*)nombre usuario:(NSString*)usuario;

@end
