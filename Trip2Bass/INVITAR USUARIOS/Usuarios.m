//
//  Usuarios.m
//  Trip2Bass
//
//  Created by Alumno on 11/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import "Usuarios.h"

@implementation Usuarios
-(id)initWithNombre:(NSString *)nombre usuario:(NSString *)usuario{
    self = [super init];
    if(self){
        self.nombreUsuario = usuario;
        self.nombreCompletoUsuario = nombre;
        
        return self;
    }
    
    return nil;
}


@end
