//
//  ViewController.m
//  Base64编码解码
//
//  Created by 赵鹏 on 2018/12/7.
//  Copyright © 2018 赵鹏. All rights reserved.
//

/**
 Base64编码是使用64个字符来对任意数据进行编码的一种编码方式。是一种将二进制数据转成文本数据的方案。对于非二进制数据，是先将其转换成二进制形式，然后每连续6比特计算其十进制值，根据该值在索引表中找到对应的字符，最终得到一个文本字符串；
 Base64编码不能用于数据的加密或数据校验。Base64是一种数据编码方式，目的是让数据符合传输协议的要求。标准Base64编码解码无需额外信息即可完全可逆，即使你自己自定义字符集设计一种类Base64的编码方式用于数据加密，在多数场景下也较容易被破解；
 对一个二进制数据进行Base64编码后，得到的文件会变大，会比原来的文件多三分之一；
 在实际的传输过程中，一般需要加密的数据都是二进制数据，在利用对称加密模式或非对称加密模式加密这些二进制数据后，会把他们再进行Base64编码，然后把这些编码过后的字符串数据发送给对方，对方在收到这些字符串数据后再进行Base64解码，然后再进行解密即可。
 */
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSString *originalStr = @"Hello!";  //原始的字符串
    
    NSString *endcodeStr = [self base64Endcode:originalStr];  //Base64编码后的字符串
    NSLog(@"Base64编码后的字符串：%@", endcodeStr);
    
    NSString *decodeStr = [self base64Decode:endcodeStr];  //Base64解码后的字符串
    NSLog(@"Base64解码后的字符串：%@", decodeStr);
}

#pragma mark ————— Base64编码 —————
- (NSString *)base64Endcode:(NSString *)str
{
    NSData *date = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    return [date base64EncodedStringWithOptions:0];
}

#pragma mark ————— Base64解码 —————
- (NSString *)base64Decode:(NSString *)str
{
    NSData *data = [[NSData alloc] initWithBase64EncodedString:str options:0];
    
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end
