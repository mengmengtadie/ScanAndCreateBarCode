//
//  ViewController.m
//  ScanAndCreateBarCode
//
//  Created by 梅龙飞 on 16/7/21.
//  Copyright © 2016年 梅龙飞. All rights reserved.
//

#import "ViewController.h"
#import "ZCZBarViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@property (weak, nonatomic) IBOutlet UIImageView *BarCodeImgV;

@property (weak, nonatomic) IBOutlet UITextView *contentTextV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//扫描二维码
- (IBAction)ScanBarCode:(id)sender {
    ZCZBarViewController *vc = [[ZCZBarViewController alloc] initWithIsQRCode:NO Block:^(NSString *result, BOOL isFinish) {
        if (isFinish) {
            NSLog(@"扫描的结果为:%@",result);
            self.resultLabel.text = result;
        }
    }];
    
    [self presentViewController:vc animated:YES completion:nil];
    
}
//生成二维码
- (IBAction)CreateBarCode:(id)sender {
    [ZCZBarViewController createImageWithImageView:self.BarCodeImgV String:self.contentTextV.text Scale:4];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
