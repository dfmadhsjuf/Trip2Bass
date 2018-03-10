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
@property NSString* titulo;
@property NSString* area;
@property NSString* fechaInicio; //SERA NSSTRING SOLO PARA PRUEBAS (NSDATE)
@property NSString* fechaFin; //SERA NSSTRING SOLO PARA PRUEBAS (NSDATE)
@property NSString* tipo;
@property NSString* descripcion;
@property NSString* musica;
@property NSString* parkingTamaño;
@property NSString* parkingAccesibilidad;
@property NSString* parkingTerreno;
@property NSString* ubicacion;
@property NSString* indicaciones;
@property NSString* foto;

-(id) initWhitTitulo:(NSString*)titulo conArea:(NSString*)area conFechaInicio:(NSString*)fechaInicio conFechaFin:(NSString*)fechaFin conTipo:(NSString*)tipo conDescripcion:(NSString*)descripcion conMusica:(NSString*)musica conParkingTamaño:(NSString*)parkingTamaño conParkingAccesibilidad:(NSString*)parkingAccesibilidad conParkingTerreno:(NSString*)parkingTerreno conUbicacion:(NSString*)ubicacion conIndicaciones:(NSString*)indicaciones yFoto:(NSString*)foto;

@end
