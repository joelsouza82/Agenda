
//
//  ViewController.m
//  ContatosIP67
//
//  Created by ios5994 on 28/05/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "FormularioContatoViewController.h"

@interface FormularioContatoViewController ()

@end

@implementation FormularioContatoViewController

#pragma mark - Setup ViewController

-(id) initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    
    if(self){
        _contatoDao = [ContatoDao contatoDaoInstance];
        self.navigationItem.title = @"Cadastro";
        UIBarButtonItem *adiciona = [[UIBarButtonItem alloc] initWithTitle:@"Adiciona" style:UIBarButtonItemStylePlain target:self action:@selector(criarContato)];
        self.navigationItem.rightBarButtonItem = adiciona;
    }
    
    return self;
}

-(IBAction)calculaCoordenadas:(UIButton*)sender{
    [self.loding startAnimating];
    CLGeocoder* geocoder = [CLGeocoder new];
    [geocoder geocodeAddressString:self.endereco.text completionHandler:^(NSArray* resultados, NSError* error) {
        if (error==nil && [resultados count] > 0) {
            CLPlacemark *resultado= resultados[0];
            CLLocationCoordinate2D coordenada= resultado.location.coordinate;
            self.latitude.text =[NSString stringWithFormat:@"%f", coordenada.latitude];
            self.longitude.text =[NSString stringWithFormat:@"%f", coordenada.longitude];
            
        }
        else{
            NSLog(@"Erro: %@ Resultados: %@",error,resultados);
        }
        [self.loding stopAnimating];
        sender.hidden=NO;
    }];

}

-(void) viewDidLoad {
    [super viewDidLoad];
    if([self contato]) {
        UIBarButtonItem *confirmar = [[UIBarButtonItem alloc]
                                      initWithTitle:@"Confirmar"
                                      style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(atualizaContato)];
        
        self.navigationItem.rightBarButtonItem = confirmar;
        [self preencheDadosDoContato];
    }
    if (self.contato.foto) {
        [self.botaoFoto setBackgroundImage:self.contato.foto forState:(UIControlStateNormal)];
        [self.botaoFoto setTitle:nil forState:(UIControlStateNormal)];
        
    }
    
    
}

#pragma mark - Methods Form Contact

- (void)pegaDadosDoFormulario {

    if(!self.contato){
        self.contato = [self.contatoDao novoContato];
    }
    if ([self.botaoFoto backgroundImageForState:UIControlStateNormal]) {
        self.contato.foto=[self.botaoFoto backgroundImageForState:UIControlStateNormal];
    }
    self.contato.nome = self.nome.text;
    self.contato.endereco = self.endereco.text;
    self.contato.site = self.site.text;
    self.contato.telefone = self.telefone.text;
    self.contato.email = self.email.text;
    self.contato.latitude = [NSNumber numberWithFloat:[self.latitude.text floatValue]];
    self.contato.longitude = [NSNumber numberWithFloat:[self.longitude.text floatValue]];
    
}

- (void) criarContato {
    [self pegaDadosDoFormulario];
    [self.contatoDao adicionaContato:self.contato];
    
    if(self.delegate) {
        [self.delegate contatoAdicionado:self.contato];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) preencheDadosDoContato {
    self.nome.text = self.contato.nome;
    self.telefone.text = self.contato.telefone;
    self.endereco.text = self.contato.endereco;
    self.email.text = self.contato.email;
    self.site.text = self.contato.site;
}

-(void) atualizaContato {
    [self pegaDadosDoFormulario];
    
    if(self.delegate) {
        [self.delegate contatoAtualizado:self.contato];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)magePickerController:(UIImagePickerController*) picker
    didFinishPickingMediaWithInfo:(NSDictionary*)info{

}

-(IBAction)selecionaFoto:(id)sender{

    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
    
    }else
    {
        UIImagePickerController *picker = [UIImagePickerController new];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.allowsEditing = YES;
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:nil];
        
    
    }

}

-(void) imagePickerController:(UIImagePickerController*)picker
didFinishPickingMediaWithInfo:(NSDictionary*)info{

    UIImage *imagemSelecionada = [info valueForKey:UIImagePickerControllerEditedImage];
    [self.botaoFoto setBackgroundImage:imagemSelecionada forState:UIControlStateNormal];
    [self.botaoFoto setTitle:nil forState:UIControlStateNormal];
    [picker dismissViewControllerAnimated:YES completion:nil];

}






@end