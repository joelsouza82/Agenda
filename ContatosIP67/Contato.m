//
//  Contato.m
//  ContatosIP67
//
//  Created by ios5994 on 28/05/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "Contato.h"

@implementation Contato

- (NSString*)description{
    return [NSString stringWithFormat:@"nome: %@, telefone: %@, email: %@, endereço: %@, site: %@", self.nome, self.telefone, self.email, self.endereco, self.site];
    
}
@dynamic nome, telefone,email,endereco,site,latitude,longitude,foto;

-(CLLocationCoordinate2D)coordinate{
    return CLLocationCoordinate2DMake([self.latitude doubleValue], [self.longitude doubleValue]);

}

@end
