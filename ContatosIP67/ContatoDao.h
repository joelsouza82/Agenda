//
//  ContatoDao.h
//  ContatosIP67
//
//  Created by ios5994 on 28/05/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contato.h"

@interface ContatoDao : NSObject

@property (strong, readonly) NSMutableArray* contatos;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


+(id) contatoDaoInstance;

- (void) adicionaContato:(Contato*) contato;
- (Contato *) buscaContatoDaPosicao:(NSInteger)posicao;
- (void) showListContacts;
- (void) removeContatoDaPosicao:(NSInteger) posicao;
- (NSInteger) buscaPosicaoDoContato:(Contato *) contato;
-(Contato *)novoContato;

@end
