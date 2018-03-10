//
//  DBManager.h
//  Trip2Bass
//
//  Created by Jonathan Torres on 10/3/18.
//  Copyright © 2018 Self. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>


@interface DBManager : NSObject

@property (nonatomic, strong) NSString* documentsDirectory;
@property (nonatomic, strong) NSString* databaseFilename;

//@property (nonatomic, strong) NSMutableArray *arrColumnNames;
//@property (nonatomic) int affectedRows;
//@property (nonatomic) long long lastInsertedRowID;

-(id)initWithDatabaseFilename:(NSString*)dbFilename;
-(void)copyDatabaseIntoDocumentsDirectory;
-(NSMutableArray*)getEventosUsuario;

//-(NSArray *)loadDataFromDB:(NSString *)query;
//-(void)executeQuery:(NSString *)query;

@end
