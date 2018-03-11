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
-(id) initWhitTitulo:(NSString*)titulo conArea:(NSString*)area conFechaInicio:(NSString*)fechaInicio conFechaFin:(NSString*)fechaFin conTipo:(NSString*)tipo conDescripcion:(NSString*)descripcion conMusica:(NSString*)musica conParkingTamano:(NSString*)parkingTamano conParkingAccesibilidad:(NSString*)parkingAccesibilidad conParkingTerreno:(NSString*)parkingTerreno conUbicacion:(NSString*)ubicacion conIndicaciones:(NSString*)indicaciones yFoto:(NSString*)foto{
    self = [super init];
    if(self){
        self.titulo = titulo;
        self.area = area;
        self.fechaInicio = fechaInicio;
        self.fechaFin = fechaFin;
        self.tipo = tipo;
        self.descripcion = descripcion;
        self.musica = musica;
        self.parkingTamano = parkingTamano;
        self.parkingAccesibilidad = parkingAccesibilidad;
        self.parkingTerreno = parkingTerreno;
        self.ubicacion = ubicacion;
        self.indicaciones = indicaciones;
        self.foto = foto;
        
        return self;
    }
    
    return nil;
}

@end
