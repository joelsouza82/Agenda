//
//  GerenciadorDeAcoes.m
//  ContatosIP67
//
//  Created by ios5994 on 11/06/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "GerenciadorDeAcoes.h"
#import <MessageUI/MessageUI.h>

@implementation GerenciadorDeAcoes

-(void)mailComposeController:(MFMailComposeViewController *)controller
         didFinishWithResult:(MFMailComposeResult)result
                       error:(NSError *)error{

}

-(void)acoesDoController:(UIViewController*) controller{
    self.controller = controller;
    UIActionSheet* opcoes = [[UIActionSheet alloc]
                             initWithTitle: self.contato.nome
                             delegate:self cancelButtonTitle:@"Cancelar"
                             destructiveButtonTitle:nil
                             otherButtonTitles:@"Ligar",@"Enviar Email",@"Visualizar site",@"Abrir Mapa", nil];
    [opcoes showInView:controller.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            [self ligar];
            break;
        case 1:
            [self enviarEmail];
            break;
        case 2:
            [self abrirSite];
            break;
        case 3:
            [self mostrarMapa];
        default:
            break;
    }
}

-(void)abrirAplicativoComURL:(NSString*)url{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];

}

-(void) mostrarMapa{
    NSString *url=[[NSString stringWithFormat:@"http://maps.google.com/maps?q=%@",self.contato.endereco]
                   stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

}

-(void)abrirSite{
    
    NSString *url= self.contato.site;
    if (![url hasPrefix:@"http://"]) {
        url = [NSString stringWithFormat:@"http://%@", url];
    }
    [self abrirAplicativoComURL:url];
}

-(void)ligar{
    UIDevice* device = [UIDevice currentDevice];
    if([device.model isEqualToString:@"iPhone"]){
        NSString* numero = [NSString stringWithFormat:@"tel:%@", self.contato.telefone];
        [self abrirAplicativoComURL:numero];
    }
    else{
        [[[UIAlertView alloc] initWithTitle:@"Imposssivel fazer ligação"
                                     message:@"Seu dispositivo não é iPhone"
                                     delegate:nil
                                     cancelButtonTitle:@"Ok"
                           otherButtonTitles:nil] show];
         }
        
    }
-(void)enviarEmail{
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController* enviadorEmail= [MFMailComposeViewController new];
        enviadorEmail.mailComposeDelegate = self;
        [enviadorEmail setToRecipients:@[self.contato.email]];
        [enviadorEmail setSubject:@"Caelum"];
        
        [self.controller presentViewController:enviadorEmail
                                        animated:YES
                                        completion:nil];
        
    }else{
        
        UIAlertView* alert = [[UIAlertView alloc]       initWithTitle:@"Oops!"
                              message:@"Não é possível enviar email"
                              delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
            [alert show];
    }
    
}





@end
