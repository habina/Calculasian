//
//  DSViewController.h
//  A Cappella
//
//  Created by Dasheng Chen on 8/21/14.
//  Copyright (c) 2014 CDS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSViewController : UIViewController <UITextFieldDelegate>
@property(nonatomic,retain) UIImageView *bgView;
@property(nonatomic,retain) UITapGestureRecognizer *tap;
@property(nonatomic,retain) UIImageView *layerView;
@property(nonatomic) BOOL layerOpen;


@end
