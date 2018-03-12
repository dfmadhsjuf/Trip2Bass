//
//  DBManager.h
//  Trip2Bass
//
//  Created by Jonathan Torres on 10/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@class Eventos;


@interface DBManager : NSObject
//Una propiedad para almacenar el directorio de los documentos.
@property (nonatomic, strong) NSString* documentsDirectory;
//Una propiedad para almacenar el nombre de la base de datos.
@property (nonatomic, strong) NSString* databaseFilename;
//Una propiedad para almacenar ek numero de la ultima columna afectada en un insert, update, etc..
@property (nonatomic) int affectedRows;
//Una propiedad para almacenar el ID de la ultima fila que se ha insertado.
@property (nonatomic) long long lastInsertedRowID;

-(id)initWithDatabaseFilename:(NSString*)dbFilename;
-(void)copyDatabaseIntoDocumentsDirectory;
-(NSMutableArray*)getEventosUsuario:(NSString*) nickname;
-(void) insertaEvento:(Eventos*) evento;
-(NSMutableArray*) getInfo;
-(BOOL) validarUsuario:(NSString*)usuario conPassword:(NSString*)password;
-(NSArray*) getInfoUsuario:(NSString*)nickname;
-(NSArray*) getInfoCoche:(NSNumber*)codUsuario;
-(int) insertaUsuario:(NSArray*) usuario;
-(BOOL) insertaCoche:(NSArray*) datosCoche;
-(NSMutableArray*) getComentariosEvento:(NSNumber*) codEvento;
-(BOOL) compruebaOrganizadorConNickname:(NSString*)nickname;
-(NSMutableArray*) getUsuarios;
-(NSArray*) getInfoOrganizadoresConNickname:(NSString*) nickname;

@end
