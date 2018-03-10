//
//  DBManager.m
//  Trip2Bass
//
//  Created by Jonathan Torres on 10/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import "DBManager.h"
#import "Eventos.h"

@interface DBManager()
//@property (nonatomic, retain) NSMutableArray* arrResults;
//
//-(void)runQuery:(const char*)query isQueryExecutable:(BOOL)queryExecutable;

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

//Metodo que recoge los eventos del usuario.
-(NSMutableArray*)getEventosUsuario{
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
        const char* sentenciaSQL = "SELECT titulo, area, fecha_inicio, fecha_fin, tipo, descripcion, musica, parking_tamaño, parking_accesibilidad, parking_terreno, ubicacion, indicaciones FROM eventos";
        //Creamos el statement.
        sqlite3_stmt* statement;
        
        //Realizamos la consulta.
        if(sqlite3_prepare_v2(db, sentenciaSQL, -1, &statement, NULL) != SQLITE_OK){
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
                evento.descripcion = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 5)];
                evento.musica = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 6)];
                evento.parkingTamaño = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 7)];
                evento.parkingAccesibilidad = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 8)];
                evento.parkingTerreno = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 9)];
                evento.ubicacion = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 10)];
                evento.indicaciones = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 11)];
                
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
              evento.parkingTamaño,
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

//-(void)runQuery:(const char *)query isQueryExecutable:(BOOL)queryExecutable{
//    // Create a sqlite object.
//    sqlite3 *sqlite3Database;
//    
//    // Set the database file path.
//    NSString *databasePath = [self.documentsDirectory stringByAppendingPathComponent:self.databaseFilename];
//    
//    // Initialize the results array.
//    if (self.arrResults != nil) {
//        [self.arrResults removeAllObjects];
//        self.arrResults = nil;
//    }
//    self.arrResults = [[NSMutableArray alloc] init];
//    
//    // Initialize the column names array.
//    if (self.arrColumnNames != nil) {
//        [self.arrColumnNames removeAllObjects];
//        self.arrColumnNames = nil;
//    }
//    self.arrColumnNames = [[NSMutableArray alloc] init];
//    
//    
//    // Open the database.
//    BOOL openDatabaseResult = sqlite3_open([databasePath UTF8String], &sqlite3Database);
//    if(openDatabaseResult == SQLITE_OK) {
//        // Declare a sqlite3_stmt object in which will be stored the query after having been compiled into a SQLite statement.
//        sqlite3_stmt *compiledStatement;
//        
//        // Load all data from database to memory.
//        BOOL prepareStatementResult = sqlite3_prepare_v2(sqlite3Database, query, -1, &compiledStatement, NULL);
//        if(prepareStatementResult == SQLITE_OK) {
//            // Check if the query is non-executable.
//            if (!queryExecutable){
//                // In this case data must be loaded from the database.
//                
//                // Declare an array to keep the data for each fetched row.
//                NSMutableArray *arrDataRow;
//                
//                // Loop through the results and add them to the results array row by row.
//                while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
//                    // Initialize the mutable array that will contain the data of a fetched row.
//                    arrDataRow = [[NSMutableArray alloc] init];
//                    
//                    // Get the total number of columns.
//                    int totalColumns = sqlite3_column_count(compiledStatement);
//                    
//                    // Go through all columns and fetch each column data.
//                    for (int i=0; i<totalColumns; i++){
//                        // Convert the column data to text (characters).
//                        char *dbDataAsChars = (char *)sqlite3_column_text(compiledStatement, i);
//                        
//                        // If there are contents in the currenct column (field) then add them to the current row array.
//                        if (dbDataAsChars != NULL) {
//                            // Convert the characters to string.
//                            [arrDataRow addObject:[NSString  stringWithUTF8String:dbDataAsChars]];
//                        }
//                        
//                        // Keep the current column name.
//                        if (self.arrColumnNames.count != totalColumns) {
//                            dbDataAsChars = (char *)sqlite3_column_name(compiledStatement, i);
//                            [self.arrColumnNames addObject:[NSString stringWithUTF8String:dbDataAsChars]];
//                        }
//                    }
//                    
//                    // Store each fetched data row in the results array, but first check if there is actually data.
//                    if (arrDataRow.count > 0) {
//                        [self.arrResults addObject:arrDataRow];
//                    }
//                }
//            }
//            else {
//                // This is the case of an executable query (insert, update, ...).
//                
//                // Execute the query.
//                int executeQueryResults = sqlite3_step(compiledStatement);
//                if (executeQueryResults == SQLITE_DONE) {
//                    // Keep the affected rows.
//                    self.affectedRows = sqlite3_changes(sqlite3Database);
//                    
//                    // Keep the last inserted row ID.
//                    self.lastInsertedRowID = sqlite3_last_insert_rowid(sqlite3Database);
//                }
//                else {
//                    // If could not execute the query show the error message on the debugger.
//                    NSLog(@"DB Error: %s", sqlite3_errmsg(sqlite3Database));
//                }
//            }
//        }
//        else {
//            // In the database cannot be opened then show the error message on the debugger.
//            NSLog(@"%s", sqlite3_errmsg(sqlite3Database));
//        }
//        
//        // Release the compiled statement from memory.
//        sqlite3_finalize(compiledStatement);
//        
//    }
//    
//    // Close the database.
//    sqlite3_close(sqlite3Database);
//}
//
//-(NSArray *)loadDataFromDB:(NSString *)query{
//    // Run the query and indicate that is not executable.
//    // The query string is converted to a char* object.
//    [self runQuery:[query UTF8String] isQueryExecutable:NO];
//    
//    // Returned the loaded results.
//    return (NSArray *)self.arrResults;
//}
//
//-(void)executeQuery:(NSString *)query{
//    // Run the query and indicate that is executable.
//    [self runQuery:[query UTF8String] isQueryExecutable:YES];
//}


@end
