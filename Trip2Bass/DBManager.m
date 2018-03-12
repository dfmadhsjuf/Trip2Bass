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
#import "Comentario.h"
#import "Usuarios.h"

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
        NSString* sentenciaSQL = [NSString stringWithFormat:@"SELECT E.cod_evento, E.titulo, E.area, E.fecha_inicio, E.fecha_fin, E.tipo, O.nombre, E.descripcion, E.musica, E.parking_tamaño, E.parking_accesibilidad, E.parking_terreno, E.ubicacion, E.indicaciones FROM EVENTOS E, ORGANIZADORES O, INVITACIONES I, Usuarios U WHERE E.cod_organizador = O.cod_organizador AND E.cod_evento = I.cod_evento AND I.cod_usuario = U.cod_usuario AND U.nickname = \"%@\";", nickname];
        
        //Creamos el statement.
        sqlite3_stmt* statement;
        
        //Realizamos la consulta.
        if(sqlite3_prepare_v2(db, [sentenciaSQL UTF8String], -1, &statement, NULL) != SQLITE_OK){
            NSLog(@"Problema al preparar el statement de mostrarEventos: %s", sqlite3_errmsg(db));
        }else{
            //Si la consulta se ha ejecuta bien pues sacamos los datos y los cargamos en la lista de eventos.
            while (sqlite3_step(statement) == SQLITE_ROW) {
                Eventos* evento = [[Eventos alloc] init];
                evento.codEvento = [NSNumber numberWithInt:sqlite3_column_int(statement, 0)];
                evento.titulo = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 1)];
                evento.area = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 2)];
                evento.fechaInicio = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 3)];
                evento.fechaFin = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 4)];
                evento.tipo = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 5)];
                evento.organizador = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 6)];
                evento.descripcion = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 7)];
                evento.musica = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 8)];
                evento.parkingTamano = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 9)];
                evento.parkingAccesibilidad = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 10)];
                evento.parkingTerreno = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 11)];
                evento.ubicacion = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 12)];
                evento.indicaciones = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 13)];
                
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

//Metodo que muestra la info del usuario.
-(NSArray*) getInfoUsuario:(NSString*)nickname{
    
    //Nos creamos un Array para almacenar la info del usuario.
    NSArray* infoUsuario;

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
        NSString* sentenciaSQL = [NSString stringWithFormat:@"SELECT * FROM USUARIOS WHERE nickname = \"%@\";", nickname];
        //Creamos el statement.
        sqlite3_stmt* statement;

        //Realizamos la consulta.
        if(sqlite3_prepare_v2(db, [sentenciaSQL UTF8String], -1, &statement, NULL) != SQLITE_OK){
            NSLog(@"Problema al preparar el statement de mostrarEventos: %s", sqlite3_errmsg(db));
        }else{
            //Si la consulta se ha ejecuta bien pues sacamos los datos y los cargamos en el Array de la info del usuario.
            //Nos movemos hasta la primera fila del statement.
            if(sqlite3_step(statement) == SQLITE_ROW){
                NSNumber* codUsuario = [NSNumber numberWithInteger: sqlite3_column_int(statement, 0)];
                NSString* nombre = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 1)];
                NSString* apellidos = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 2)];
                NSString* nickname = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 3)];
                NSString* password = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 4)];
                NSString* email = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 5)];
                NSString* provincia = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 6)];
                NSString* fechaNacimiento = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 7)];
                
                //Metemos los datos del usuario en el Array.
                infoUsuario = [[NSArray alloc] initWithObjects: codUsuario,nombre, apellidos, nickname, password, email, provincia, fechaNacimiento, nil];
            }
            
        }

        //Quitamos el statement de memoria.
        sqlite3_finalize(statement);
    }

    //Cerramos la conexion con la BD.
    sqlite3_close(db);

    //Devolvemos la info del usuario.
    return infoUsuario;
}

//Metodo que muestra la info del coche del usuario.
-(NSArray*) getInfoCoche:(NSNumber*)codUsuario{
    //Nos creamos un Array para almacenar la info del coche.
    NSArray* infoCoche;
    
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
        NSString* sentenciaSQL = [NSString stringWithFormat:@"SELECT * FROM COCHES WHERE cod_usuario = \"%@\";", codUsuario];
        //Creamos el statement.
        sqlite3_stmt* statement;
        
        //Realizamos la consulta.
        if(sqlite3_prepare_v2(db, [sentenciaSQL UTF8String], -1, &statement, NULL) != SQLITE_OK){
            NSLog(@"Problema al preparar el statement de mostrarEventos: %s", sqlite3_errmsg(db));
        }else{
            //Si la consulta se ha ejecuta bien pues sacamos los datos y los cargamos en el Array de la info del usuario.
            //Nos movemos hasta la primera fila del statement.
            if(sqlite3_step(statement) == SQLITE_ROW){
                
                NSString* marca = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 2)];
                NSString* modelo = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 3)];
                NSString* plazas = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 4)];
                NSString* color = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 5)];
                
                //Metemos los datos del usuario en el Array.
                infoCoche = [[NSArray alloc] initWithObjects: marca, modelo, plazas, color, nil];
            }
            
        }
        
        //Quitamos el statement de memoria.
        sqlite3_finalize(statement);
    }
    
    //Cerramos la conexion con la BD.
    sqlite3_close(db);
    
    //Devolvemos la info del coche.
    return infoCoche;
}

//Metodo que inserta un usuario en la BD.
-(int) insertaUsuario:(NSArray*) usuario{
    
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
        NSString* sentenciaSQL = [NSString stringWithFormat:@"INSERT INTO USUARIOS (\"nombre\", \"apellidos\", \"nickname\", \"password\", \"email\", \"provincia\", \"fecha_nacimiento\") VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\");",
                                  [usuario objectAtIndex:0],
                                  [usuario objectAtIndex:1],
                                  [usuario objectAtIndex:2],
                                  [usuario objectAtIndex:3],
                                  [usuario objectAtIndex:4],
                                  [usuario objectAtIndex:5],
                                  [usuario objectAtIndex:6]];
        
        //Creamos el statement.
        sqlite3_stmt* statement;
        
        //Realizamos la consulta.
        if(sqlite3_prepare_v2(db, [sentenciaSQL UTF8String], -1, &statement, NULL) != SQLITE_OK){
            NSLog(@"Problema al preparar el statement de insertar usuario: %s", sqlite3_errmsg(db));
        }else{
            //Comprobamos si se ha ejecutado bien la inserccion del usuario.
            if(sqlite3_step(statement) != SQLITE_DONE){
                NSLog(@"DB Error: %s", sqlite3_errmsg(db));
                //Quitamos el statement de memoria.
                sqlite3_finalize(statement);
                //Cerramos la conexion con la BD.
                sqlite3_close(db);
                //Devolvemos -1 si falla la insercion del usuario.
                return -1;
            } else{
                //Si se ha ejecutado bien guardamos la fila afectada y el ID del ultimo usuario insertado.
                self.affectedRows = sqlite3_changes(db);
                self.lastInsertedRowID = sqlite3_last_insert_rowid(db);
            }
        }
        
        //Quitamos el statement de memoria.
        sqlite3_finalize(statement);
    }
    //Cerramos la conexion con la BD.
    sqlite3_close(db);
    
    return (int)self.lastInsertedRowID;
}

//Metodo que inserta un coche asociado a un usuario en la BD.
-(BOOL) insertaCoche:(NSArray*) datosCoche{
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
        NSString* sentenciaSQL = [NSString stringWithFormat:@"INSERT INTO COCHES (\"cod_usuario\", \"marca\", \"modelo\", \"plazas\", \"color\") VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\");",
                                  [datosCoche objectAtIndex:0],
                                  [datosCoche objectAtIndex:1],
                                  [datosCoche objectAtIndex:2],
                                  [datosCoche objectAtIndex:3],
                                  [datosCoche objectAtIndex:4]];
        
        //Creamos el statement.
        sqlite3_stmt* statement;
        
        //Realizamos la consulta.
        if(sqlite3_prepare_v2(db, [sentenciaSQL UTF8String], -1, &statement, NULL) != SQLITE_OK){
            NSLog(@"Problema al preparar el statement de insertar coche: %s", sqlite3_errmsg(db));
        }else{
            //Comprobamos si se ha ejecutado bien la inserccion del coche.
            if(sqlite3_step(statement) != SQLITE_DONE){
                NSLog(@"DB Error: %s", sqlite3_errmsg(db));
                //Quitamos el statement de memoria.
                sqlite3_finalize(statement);
                //Cerramos la conexion con la BD.
                sqlite3_close(db);
                //Devolvemos false.
                return false;
            } else{
                //Si se ha ejecutado bien guardamos la fila afectada y el ID del ultimo usuario insertado.
                self.affectedRows = sqlite3_changes(db);
                self.lastInsertedRowID = sqlite3_last_insert_rowid(db);
                //Quitamos el statement de memoria.
                sqlite3_finalize(statement);
                //Cerramos la conexion con la BD.
                sqlite3_close(db);
                //Devolvemos true.
                return true;
            }
        }

    }
    
    return false;
}

//Metodo que devuelve los comentarios de cada uno de los eventos.
-(NSMutableArray*) getComentariosEvento:(NSNumber*) codEvento{
    
    //Nos creamos el array de Comentarios.
    NSMutableArray* listaComentarios = [[NSMutableArray alloc] init];

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
        NSString* sentenciaSQL = [NSString stringWithFormat:@"SELECT U.nickname, C.tipo, C.comentario FROM COMENTARIOS C, USUARIOS U WHERE C.cod_usuario = U.cod_usuario AND C.cod_evento = %@;", codEvento];
        //Creamos el statement.
        sqlite3_stmt* statement;

        //Realizamos la consulta.
        if(sqlite3_prepare_v2(db, [sentenciaSQL UTF8String], -1, &statement, NULL) != SQLITE_OK){
            NSLog(@"Problema al preparar el statement de mostrarEventos: %s", sqlite3_errmsg(db));
        }else{
            //Si la consulta se ha ejecuta bien pues sacamos los datos y los cargamos en la lista de comentarios.
            while (sqlite3_step(statement) == SQLITE_ROW) {
                Comentario* comentario = [[Comentario alloc] init];
                comentario.usuario = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 0)];
                comentario.tipo = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 1)];
                comentario.contenido = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 2)];
                
                //Añadimos el comentario a la lista.
                [listaComentarios addObject:comentario];
            }
        }

        //Quitamos el statement de memoria.
        sqlite3_finalize(statement);
    }

    //Cerramos la conexion con la BD.
    sqlite3_close(db);

    //Devolvemos la lista de info.
    return listaComentarios;
}

//Metodo que comprueba si el usuario logueado es miembro de algun grupo de organizadores.
-(BOOL) compruebaOrganizadorConNickname:(NSString*)nickname{
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
        NSString* sentenciaSQL = [NSString stringWithFormat:@"SELECT M.cod_organizador, M.cod_usuario FROM USUARIOS U, MIEMBROS M WHERE U.cod_usuario = M.cod_usuario AND U.nickname = \"%@\";", nickname];
        //Creamos el statement.
        sqlite3_stmt* statement;
        
        //Realizamos la consulta.
        if(sqlite3_prepare_v2(db, [sentenciaSQL UTF8String], -1, &statement, NULL) != SQLITE_OK){
            NSLog(@"Problema al preparar el statement de compruebaOrganizador: %s", sqlite3_errmsg(db));
        }else{
            //Comprobamos si el usuario es miembro de algun grupo de organizadores.
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

//Metodo que devuelve todos los usuarios de la BD.
-(NSMutableArray*) getUsuarios{
    //Nos creamos el array de Usuarios.
    NSMutableArray* listaUsuarios = [[NSMutableArray alloc] init];
    
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
        NSString* sentenciaSQL = [NSString stringWithFormat:@"SELECT nombre, apellidos, nickname FROM USUARIOS;"];
        //Creamos el statement.
        sqlite3_stmt* statement;
        
        //Realizamos la consulta.
        if(sqlite3_prepare_v2(db, [sentenciaSQL UTF8String], -1, &statement, NULL) != SQLITE_OK){
            NSLog(@"Problema al preparar el statement de mostrarEventos: %s", sqlite3_errmsg(db));
        }else{
            //Si la consulta se ha ejecuta bien pues sacamos los datos y los cargamos en la lista de comentarios.
            while (sqlite3_step(statement) == SQLITE_ROW) {
                Usuarios* usuario = [[Usuarios alloc] init];
                usuario.nombreCompletoUsuario = [NSString stringWithFormat:@"%@ %@", [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 0)], [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 1)]];
                usuario.nombreUsuario = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 2)];
                
                //Añadimos el comentario a la lista.
                [listaUsuarios addObject:usuario];
            }
        }
        
        //Quitamos el statement de memoria.
        sqlite3_finalize(statement);
    }
    
    //Cerramos la conexion con la BD.
    sqlite3_close(db);
    
    //Devolvemos la lista de info.
    return listaUsuarios;
}

@end
