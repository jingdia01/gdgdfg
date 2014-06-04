//
//  LoginViewController.m
//  gdgdfg
//
//  Created by JINGDIAOXIAN01 on 14-5-29.
//  Copyright (c) 2014年 JINGDIAOXIAN01. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize name;
@synthesize passWord;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *Name = [defaults objectForKey:@"Name"];
    
    NSString *PassWrod = [defaults objectForKey:@"PassWrod"];
    self.loginName.text = Name;
    self.loginPassWord.text = PassWrod;
    if (self.loginName.text != nil && self.loginPassWord.text != nil) {
       [self Login:self];
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Login:(id)sender {
    elementFound = false;
    self.matchingElement = @"isExistLoginResult";
    static NSString *wsURL = @"http://172.17.20.28/jingdiao_changan/UserManage/EmployeeManage/MaintainUserService.asmx";
    /*NSString *soapMessage = [NSString stringWithFormat:
                             @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                             "<soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                             "<soap12:Body>\n"
                             "<isExistLogin xmlns=\"http://tempuri.org/\">"
                             "<strLoginName>%@</strLoginName>"
                             "<strPassWord>%@</strPassWord>"
                             "</isExistLogin>"
                             "</soap12:Body>\n"
                             "</soap12:Envelope>",self.loginName.text,self.loginPassWord.text];*/
    NSString *soapMessage = [NSString stringWithFormat:
                             @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                             "<soap12:Envelope "
                             "xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" "
                             "xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" "
                             "xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\">"
                             "<soap12:Body>"
                             "<isExistLogin xmlns=\"http://tempuri.org/\">"
                             "<strLoginName>%@</strLoginName>"
                             "<strPassWord>%@</strPassWord>"
                             "</isExistLogin>"
                             "</soap12:Body>"
                             "</soap12:Envelope>", self.loginName.text,self.loginPassWord.text];
    NSLog(@"调用的webservice的字符串是：%@",soapMessage);
    NSString *length = [NSString stringWithFormat:@"%d",[soapMessage length]];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",wsURL]];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    //以下对请求信息添加属性前四句是必有的，
    [urlRequest addValue: @"application/soap+xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    //[urlRequest addValue:@"http://tempuri.org/isExistLogin" forHTTPHeaderField:@"SOAPAction"];
    NSLog(@"SOAPAction is %@ ",@"http://tempuri.org/isExistLogin");
    [urlRequest addValue: length forHTTPHeaderField:@"Content-Length"];
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    //请求
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
    if (theConnection) {
        self.webData = [NSMutableData data];
    }
}
// 刚开始接受响应时调用
-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *) response{
    [self.webData setLength: 0];
}

// 每接收到一部分数据就追加到webData中
-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *) data {
    [self.webData appendData:data];
}

//如果调用有错误，则出现此信息
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"ERROR with theConenction");
    self.webData = nil;
    UIAlertView * alert =
    [[UIAlertView alloc]
     initWithTitle:@"提示"
     message:[error description]
     delegate:self
     cancelButtonTitle:nil
     otherButtonTitles:@"OK", nil];
    [alert show];
}

/*//调用成功，获得soap信息
-(void) connection:(NSURLConnection *) connection didReceiveData:(NSData *)responseData
{
    NSString * returnSoapXML = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSLog(@"返回的soap信息是：%@",returnSoapXML);
    //开始解析xml
    self.xmlParser = [[NSXMLParser alloc] initWithData: responseData];
    [self.xmlParser setDelegate:self];
    [self.xmlParser setShouldResolveExternalEntities: YES];
    [self.xmlParser parse];
    if(loginResult){
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"登录成功" message:returnSoapXML delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alert show];
    }
    
}*/

// 完成接收数据时调用
-(void) connectionDidFinishLoading:(NSURLConnection *) connection {
    NSString *theXML = [[NSString alloc] initWithBytes:[self.webData mutableBytes]
                                                length:[self.webData length]
                                              encoding:NSUTF8StringEncoding];
    
    // 打印出得到的XML
    NSLog(@"得到的xml是%@", theXML);
    // 使用NSXMLParser解析出我们想要的结果
    self.xmlParser = [[NSXMLParser alloc] initWithData: self.webData];
    [self.xmlParser setDelegate: self];
    [self.xmlParser setShouldResolveExternalEntities: YES];
    [self.xmlParser parse];
}

// 开始解析一个元素名
-(void) parser:(NSXMLParser *) parser didStartElement:(NSString *) elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *) qName attributes:(NSDictionary *) attributeDict {
    if ([elementName isEqualToString:self.matchingElement]) {
        if (!self.soapResults) {
            self.soapResults = [[NSMutableString alloc] init];
        }
        elementFound = YES;
    }
}

// 追加找到的元素值，一个元素值可能要分几次追加
-(void)parser:(NSXMLParser *) parser foundCharacters:(NSString *)string {
    if (elementFound) {
        [self.soapResults appendString: string];
    }
}

// 结束解析这个元素名
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:self.matchingElement]) {
        if ([self.soapResults  isEqual: @"success"]) {
            NSString *name = self.loginName.text;
            NSString *psword = self.loginPassWord.text;
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:name forKey:@"Name"];
            [defaults setObject:psword forKey:@"PassWrod"];
            [defaults synchronize];
            [self performSegueWithIdentifier:@"login" sender:self];
            
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"登录提示"
                                                        message:[NSString stringWithFormat:@"%@", self.soapResults]
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
            [alert show];
        }
        elementFound = FALSE;
        // 强制放弃解析
        [self.xmlParser abortParsing];
        
    }
}

// 解析整个文件结束后
- (void)parserDidEndDocument:(NSXMLParser *)parser {
    if (self.soapResults) {
        self.soapResults = nil;
    }
}

// 出错时，例如强制结束解析
- (void) parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    if (self.soapResults) {
        self.soapResults = nil;
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == self.loginName || textField == self.loginPassWord) {
         [textField resignFirstResponder];
    }
    return YES;
}
@end
