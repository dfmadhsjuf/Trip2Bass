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

//@property (nonatomic, strong) NSMutableArray *arrColumnNames;

-(id)initWithDatabaseFilename:(NSString*)dbFilename;
-(void)copyDatabaseIntoDocumentsDirectory;
-(NSMutableArray*)getEventosUsuario;
-(void) insertaEvento:(Eventos*) evento;

//-(NSArray *)loadDataFromDB:(NSString *)query;
//-(void)executeQuery:(NSString *)query;

@end
