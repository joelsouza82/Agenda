//
//  Contato.h
//  ContatosIP67
//
//  Created by ios5994 on 28/05/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MapKit/MKAnnotation.h>
#import <CoreData/CoreData.h>
@interface Contato : NSManagedObject <MKAnnotation>

@property (strong) NSString *nome;
@property (strong) NSString *endereco;
@property (strong) NSString *email;
@property (strong) NSString *site;
@property (strong) NSString *telefone;
@property (strong) UIImage *foto;

@property (strong) NSNumber* latitude;
@property (strong) NSNumber* longitude;


@end
