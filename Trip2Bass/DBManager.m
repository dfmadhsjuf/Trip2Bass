//
//  DBManager.m
//  Trip2Bass
//
//  Created by Jonathan Torres on 10/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import "DBManager.h"
#import "Eventos.h"
#import "Informacion.h"

@interface DBManager()

@end

@implementation DBManager

-(id)initWithDatabaseFilename:(NSString*)dbFilename{
    self = [super init];
    if (self){
        // Asigna a documentsDirectory la ruta a del directorio de documentos.
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        self.documentsDirectory = [paths objectAtIndex:0];
        
        // Guarda el nombre de la BBDD
        self.databaseFilename = dbFilename;
        
        // Copia la base de datos en el directorio de documentos si es necesario
        [self copyDatabaseIntoDocumentsDirectory];
    }
    return self;
}

-(void)copyDatabaseIntoDocumentsDirectory{
    // Check if the database file exists in the documents directory.
    NSString *destinationPath = [self.documentsDirectory stringByAppendingPathComponent:self.databaseFilename];
    if (![[NSFileManager defaultManager] fileExistsAtPath:destinationPath]) {
        // The database file does not exist in the documents directory, so copy it from the main bundle now.
        NSString *sourcePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:self.databaseFilename];
        NSError *error;
        [[NSFileManager defaultManager] copyItemAtPath:sourcePath toPath:destinationPath error:&error];
        
        // Check if any error occurred during copying and display it.
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
        }
    }
}

//Metodo que valida el usuario y la contraseña introducidos en el login.
-(BOOL) validarUsuario:(NSString*)usuario conPassword:(NSString*)password{
    
    //Creamos el objeto sqlite.
    sqlite3* db;
    
    //Creamos la ruta hasta la BD.
    NSString* databasePath = [self.documentsDirectory stringByAppendingPathComponent:self.databaseFilename];
    
    //Abrimos la conexion con la BD.
    if(sqlite3_open([databasePath UTF8String], &db) != SQLITE_OK){
        //Si no se puede abrir muestra el mensaje de error.
        NSLog(@"No se puede abrir la BD: %s", sqlite3_errmsg(db));
    }else{
        //Si se ha podido abrir la conexion empezamos.
        //Creamos la consulta SQL.
        NSString* sentenciaSQL = [NSString stringWithFormat:@"SELECT * FROM USUARIOS WHERE nickname = \"%@\" AND password = \"%@\";", usuario, password];
        //Creamos el statement.
        sqlite3_stmt* statement;
        
        //Realizamos la consulta.
        if(sqlite3_prepare_v2(db, [sentenciaSQL UTF8String], -1, &statement, NULL) != SQLITE_OK){
            NSLog(@"Problema al preparar el statement de validarUsuario: %s", sqlite3_errmsg(db));
        }else{
            //Comprobamos si existe algun usuario con ese usuario y contraseña.
            if(sqlite3_step(statement) == SQLITE_ROW){
                
                //Quitamos el statement de memoria.
                sqlite3_finalize(statement);
                
                //Cerramos la conexion con la BD.
                sqlite3_close(db);
                
                return true;
            }
        }
        
        //Quitamos el statement de memoria.
        sqlite3_finalize(statement);
    }
    
    //Cerramos la conexion con la BD.
    sqlite3_close(db);
    
    return false;
}

//Metodo que recoge los eventos del usuario.
-(NSMutableArray*)getEventosUsuario:(NSString*) nickname{
    
    //Nos creamos el array de Eventos.
    NSMutableArray* listaEventos = [[NSMutableArray alloc] init];
    
    //Creamos el objeto sqlite.
    sqlite3* db;
    
    //Creamos la ruta hasta la BD.
    NSString* databasePath = [self.documentsDirectory stringByAppendingPathComponent:self.databaseFilename];
    
    //Abrimos la conexion con la BD.
    if(sqlite3_open([databasePath UTF8String], &db) != SQLITE_OK){
        //Si no se puede abrir muestra el mensaje de error.
        NSLog(@"No se puede abrir la BD: %s", sqlite3_errmsg(db));
    }else{
        //Si se ha podido abrir la conexion empezamos.
        //Creamos la consulta SQL.
        NSString* sentenciaSQL = [NSString stringWithFormat:@"SELECT E.titulo, E.area, E.fecha_inicio, E.fecha_fin, E.tipo, O.nombre, E.descripcion, E.musica, E.parking_tamaño, E.parking_accesibilidad, E.parking_terreno, E.ubicacion, E.indicaciones FROM EVENTOS E, ORGANIZADORES O, INVITACIONES I, Usuarios U WHERE E.cod_organizador = O.cod_organizador AND E.cod_evento = I.cod_evento AND I.cod_usuario = U.cod_usuario AND U.nickname = \"%@\";", nickname];
        
        //Creamos el statement.
        sqlite3_stmt* statement;
        
        //Realizamos la consulta.
        if(sqlite3_prepare_v2(db, [sentenciaSQL UTF8String], -1, &statement, NULL) != SQLITE_OK){
            NSLog(@"Problema al preparar el statement de mostrarEventos: %s", sqlite3_errmsg(db));
        }else{
            //Si la consulta se ha ejecuta bien pues sacamos los datos y los cargamos en la lista de eventos.
            while (sqlite3_step(statement) == SQLITE_ROW) {
                Eventos* evento = [[Eventos alloc] init];
                evento.titulo = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 0)];
                evento.area = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 1)];
                evento.fechaInicio = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 2)];
                evento.fechaFin = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 3)];
                evento.tipo = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 4)];
                evento.organizador = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 5)];
                evento.descripcion = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 6)];
                evento.musica = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 7)];
                evento.parkingTamano = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 8)];
                evento.parkingAccesibilidad = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 9)];
                evento.parkingTerreno = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 10)];
                evento.ubicacion = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 11)];
                evento.indicaciones = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 12)];
                
                //Añadimos el evento a la lista.
                [listaEventos addObject:evento];
            }
        }
        
        //Quitamos el statement de memoria.
        sqlite3_finalize(statement);
    }
    
    //Cerramos la conexion con la BD.
    sqlite3_close(db);
    
    //Devolvemos la lista de eventos.
    return listaEventos;
}

//Metodo que inserta un evento en la BD.
-(void) insertaEvento:(Eventos*) evento{
    
    //Creamos el objeto sqlite.
    sqlite3* db;
    
    //Creamos la ruta hasta la BD.
    NSString* databasePath = [self.documentsDirectory stringByAppendingPathComponent:self.databaseFilename];
    
    //Abrimos la conexion con la BD.
    if(sqlite3_open([databasePath UTF8String], &db) != SQLITE_OK){
        //Si no se puede abrir muestra el mensaje de error.
        NSLog(@"No se puede abrir la BD: %s", sqlite3_errmsg(db));
    }else{
        //Si se ha podido abrir la conexion empezamos.
        //Creamos la consulta SQL.
        NSString* sentenciaSQL = [NSString stringWithFormat:@"INSERT INTO EVENTOS (\"titulo\", \"area\", \"fecha_inicio\", \"fecha_fin\", \"tipo\", \"cod_organizador\", \"descripcion\", \"musica\", \"parking_tamaño\", \"parking_accesibilidad\", \"parking_terreno\", \"ubicacion\", \"indicaciones\") VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%d\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\")",
              evento.titulo,
              evento.area,
              evento.fechaInicio,
              evento.fechaFin,
              evento.tipo,
              1,
              evento.descripcion,
              evento.musica,
              evento.parkingTamano,
              evento.parkingAccesibilidad,
              evento.parkingTerreno,
              evento.ubicacion,
              evento.indicaciones];
        
        //Creamos el statement.
        sqlite3_stmt* statement;
        
        //Realizamos la consulta.
        if(sqlite3_prepare_v2(db, [sentenciaSQL UTF8String], -1, &statement, NULL) != SQLITE_OK){
            NSLog(@"Problema al preparar el statement de crearEvento: %s", sqlite3_errmsg(db));
        }else{
            //Comprobamos si se ha ejecutado bien la inserccion del evento.
            if(sqlite3_step(statement) != SQLITE_DONE){
                NSLog(@"DB Error: %s", sqlite3_errmsg(db));
            } else{
                //Si se ha ejecutado bien guardamos la fila afectada y el ID del ultimo evento insertado.
                self.affectedRows = sqlite3_changes(db);
                self.lastInsertedRowID = sqlite3_last_insert_rowid(db);
            }
        }
        //Quitamos el statement de memoria.
        sqlite3_finalize(statement);
    }
    //Cerramos la conexion con la BD.
    sqlite3_close(db);
}

//Metodo que devuelve la todas las filas de la tabla info.
-(NSMutableArray*) getInfo{
    //Nos creamos el array de Info.
    NSMutableArray* listaInfo = [[NSMutableArray alloc] init];
    
    //Creamos el objeto sqlite.
    sqlite3* db;
    
    //Creamos la ruta hasta la BD.
    NSString* databasePath = [self.documentsDirectory stringByAppendingPathComponent:self.databaseFilename];
    
    //Abrimos la conexion con la BD.
    if(sqlite3_open([databasePath UTF8String], &db) != SQLITE_OK){
        //Si no se puede abrir muestra el mensaje de error.
        NSLog(@"No se puede abrir la BD: %s", sqlite3_errmsg(db));
    }else{
        //Si se ha podido abrir la conexion empezamos.
        //Creamos la consulta SQL.
        const char* sentenciaSQL = "SELECT * FROM INFO";
        //Creamos el statement.
        sqlite3_stmt* statement;
        
        //Realizamos la consulta.
        if(sqlite3_prepare_v2(db, sentenciaSQL, -1, &statement, NULL) != SQLITE_OK){
            NSLog(@"Problema al preparar el statement de mostrarEventos: %s", sqlite3_errmsg(db));
        }else{
            //Si la consulta se ha ejecuta bien pues sacamos los datos y los cargamos en la lista de info.
            while (sqlite3_step(statement) == SQLITE_ROW) {
                Informacion* info = [[Informacion alloc] init];
                info.tituloInfo = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 1)];
                info.autor = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 2)];
                info.fechaPublicacion = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 3)];
                info.contenidoInfo = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 4)];
                
                //Añadimos la info a la lista.
                [listaInfo addObject:info];
            }
        }
        
        //Quitamos el statement de memoria.
        sqlite3_finalize(statement);
    }
    
    //Cerramos la conexion con la BD.
    sqlite3_close(db);
    
    //Devolvemos la lista de info.
    return listaInfo;
    
}

@end
