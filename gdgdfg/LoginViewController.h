//
//  LoginViewController.h
//  gdgdfg
//
//  Created by JINGDIAOXIAN01 on 14-5-29.
//  Copyright (c) 2014年 JINGDIAOXIAN01. All rights reserved.
//

#import "ViewController.h"

@interface LoginViewController : ViewController<NSXMLParserDelegate,NSURLConnectionDelegate,UITextFieldDelegate>
{
    BOOL elementFound;
}
@property (weak, nonatomic) IBOutlet UITextField *loginName;
@property (weak, nonatomic) IBOutlet UITextField *loginPassWord;
- (IBAction)Login:(id)sender;
@property(copy,nonatomic)NSString *name;
@property(copy,nonatomic)NSString *passWord;
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property (strong, nonatomic) NSMutableData *webData;
@property (strong, nonatomic) NSString *matchingElement;
@end
