//
//  JKScanningQRViewController.h
//  JKQRCode
//
//  Created by 王冲 on 2018/12/29.
//  Copyright © 2018年 JK科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKQRCode.h"
NS_ASSUME_NONNULL_BEGIN

@interface JKScanningQRViewController : UIViewController

@property (nonatomic, strong) JKQRCode *qrCodeManager;
    
@property (nonatomic, copy) void(^scanningSuccess)(NSString *QRCodeStr);

/** 是否是 push */
@property (nonatomic, assign, getter=isPush) BOOL push;

/**
 1:代表在扫面后自定义操作
 */
@property (nonatomic, strong) NSString *comeType;

@end

NS_ASSUME_NONNULL_END
