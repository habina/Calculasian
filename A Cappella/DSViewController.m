//
//  DSViewController.m
//  A Cappella
//
//  Created by Dasheng Chen on 8/21/14.
//  Copyright (c) 2014 CDS. All rights reserved.
//

#import "DSViewController.h"
#import <XCDYouTubeKit/XCDYouTubeKit.h>
#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>
#import "btSimpleSideMenu.h"

@interface DSViewController () <BTSimpleSideMenuDelegate>
@property(nonatomic)BTSimpleSideMenu *sideMenu;
@end


@implementation DSViewController
@synthesize sideMenu, bgView;
UITapGestureRecognizer *tap;
UIImageView *layerView;

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
	// Do any additional setup after loading the view, typically from a nib.
//    self.videoIdentifierTextField.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"VideoIdentifier"];
//    self.videoIdentifierTextField.text = @"V9ix0GCNlS8";
//    self.videoIdentifierTextField.delegate = self;
    self.title = @"Simple Side Menu";
    self.navigationController.navigationBarHidden = YES;
    bgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"backGround.jpg"]];
    bgView.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:bgView];
    
    UIImageView *a1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"a1.png"]];
    a1.frame = CGRectMake(210, 30, 95, 95);
    a1.alpha = 0.6;
    [self.view addSubview:a1];
    a1.layer.borderColor = [UIColor whiteColor].CGColor;
    a1.layer.borderWidth = 3;
    a1.clipsToBounds = YES;
    a1.layer.cornerRadius =  a1.frame.size.width/2;
    UITapGestureRecognizer *a1SingleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a1TapDetected)];
    a1SingleTap.numberOfTapsRequired = 1;
    [a1 setUserInteractionEnabled:YES];
    [a1 addGestureRecognizer:a1SingleTap];
    
    UIImageView *a2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"a2.png"]];
    a2.frame = CGRectMake(210, 135, 95, 95);
    a2.alpha = 0.6;
    [self.view addSubview:a2];
    a2.layer.borderColor = [UIColor whiteColor].CGColor;
    a2.layer.borderWidth = 3;
    a2.clipsToBounds = YES;
    a2.layer.cornerRadius =  a2.frame.size.width/2;
    UITapGestureRecognizer *a2SingleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a2TapDetected)];
    a2SingleTap.numberOfTapsRequired = 1;
    [a2 setUserInteractionEnabled:YES];
    [a2 addGestureRecognizer:a2SingleTap];
    
    UIImageView *a3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"a3.png"]];
    a3.frame = CGRectMake(210, 245, 95, 95);
    a3.alpha = 0.6;
    [self.view addSubview:a3];
    a3.layer.borderColor = [UIColor whiteColor].CGColor;
    a3.layer.borderWidth = 3;
    a3.clipsToBounds = YES;
    a3.layer.cornerRadius =  a3.frame.size.width/2;
    UITapGestureRecognizer *a3SingleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a3TapDetected)];
    a3SingleTap.numberOfTapsRequired = 1;
    [a3 setUserInteractionEnabled:YES];
    [a3 addGestureRecognizer:a3SingleTap];
    
    UIImageView *a4 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"a4.png"]];
    a4.frame = CGRectMake(10, 135, 95, 95);
    a4.alpha = 0.6;
    [self.view addSubview:a4];
    a4.layer.borderColor = [UIColor whiteColor].CGColor;
    a4.layer.borderWidth = 3;
    a4.clipsToBounds = YES;
    a4.layer.cornerRadius =  a4.frame.size.width/2;
    UITapGestureRecognizer *a4SingleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a4TapDetected)];
    a4SingleTap.numberOfTapsRequired = 1;
    [a4 setUserInteractionEnabled:YES];
    [a4 addGestureRecognizer:a4SingleTap];
    
    UIImageView *a5 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"a5.png"]];
    a5.frame = CGRectMake(10, 245, 95, 95);
    a5.alpha = 0.6;
    [self.view addSubview:a5];
    a5.layer.borderColor = [UIColor whiteColor].CGColor;
    a5.layer.borderWidth = 3;
    a5.clipsToBounds = YES;
    a5.layer.cornerRadius =  a5.frame.size.width/2;
    UITapGestureRecognizer *a5SingleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a5TapDetected)];
    a5SingleTap.numberOfTapsRequired = 1;
    [a5 setUserInteractionEnabled:YES];
    [a5 addGestureRecognizer:a5SingleTap];

    UIImageView *a6 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"a6.png"]];
    a6.frame = CGRectMake(10, 30, 95, 95);
    a6.alpha = 0.6;
    [self.view addSubview:a6];
    a6.layer.borderColor = [UIColor whiteColor].CGColor;
    a6.layer.borderWidth = 3;
    a6.clipsToBounds = YES;
    a6.layer.cornerRadius =  a6.frame.size.width/2;
    UITapGestureRecognizer *a6SingleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a6TapDetected)];
    a6SingleTap.numberOfTapsRequired = 1;
    [a6 setUserInteractionEnabled:YES];
    [a6 addGestureRecognizer:a6SingleTap];
    
    BTSimpleMenuItem *item0 = [[BTSimpleMenuItem alloc]initWithTitle:@"Love Never Felt So Good"
                                image:[UIImage imageNamed:nil]
                                onCompletion:^(BOOL success, BTSimpleMenuItem *item) {                                                            NSLog(@"I am Item 0");                                                            XCDYouTubeVideoPlayerViewController *videoPlayerViewController = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:@"HzwO_66VGoE"];
                                    [self presentMoviePlayerViewControllerAnimated:videoPlayerViewController];
                                                        }];
    
    BTSimpleMenuItem *item1 = [[BTSimpleMenuItem alloc]initWithTitle:@"Brightest Star in the Night"
                                image:[UIImage imageNamed:nil]
                                onCompletion:^(BOOL success, BTSimpleMenuItem *item) {                                                            NSLog(@"I am Item 1");                                                            XCDYouTubeVideoPlayerViewController *videoPlayerViewController = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:@"V9ix0GCNlS8"];
                                    [self presentMoviePlayerViewControllerAnimated:videoPlayerViewController];
                                }];
    
    BTSimpleMenuItem *item2 = [[BTSimpleMenuItem alloc]initWithTitle:@"FROZEN"
                                image:[UIImage imageNamed:@"icon2.png"]
                                onCompletion:^(BOOL success, BTSimpleMenuItem *item) {                                                          NSLog(@"I am Item 2");
                                    XCDYouTubeVideoPlayerViewController *videoPlayerViewController = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:@"IrObyn-T-vo"];
                                    [self presentMoviePlayerViewControllerAnimated:videoPlayerViewController];
                              }];
    
    BTSimpleMenuItem *item3 = [[BTSimpleMenuItem alloc]initWithTitle:@"Where Did Time Fly"
                                image:[UIImage imageNamed:@"icon3.png"]
                                onCompletion:^(BOOL success, BTSimpleMenuItem *item) {                                                            NSLog(@"I am Item 3");
                                    XCDYouTubeVideoPlayerViewController *videoPlayerViewController = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:@"JMyZDJBMC0w"];
                                    [self presentMoviePlayerViewControllerAnimated:videoPlayerViewController];
                              }];
    
    BTSimpleMenuItem *item4 = [[BTSimpleMenuItem alloc]initWithTitle:@"The Era of Jay"
                                image:[UIImage imageNamed:@"icon4.png"]
                                onCompletion:^(BOOL success, BTSimpleMenuItem *item) {
                                    NSLog(@"I am Item 4");
                                    XCDYouTubeVideoPlayerViewController *videoPlayerViewController = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:@"AEpwAzLISXU"];
                                    [self presentMoviePlayerViewControllerAnimated:videoPlayerViewController];
                              }];
    
    BTSimpleMenuItem *item5 = [[BTSimpleMenuItem alloc]initWithTitle:@"Evolution of Chinese Music"
                                image:[UIImage imageNamed:@"icon5.png"]
                                onCompletion:^(BOOL success, BTSimpleMenuItem *item) {                                                            NSLog(@"I am Item 5");
                                    XCDYouTubeVideoPlayerViewController *videoPlayerViewController = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:@"qI4LdAUT0lQ"];
                                    [self presentMoviePlayerViewControllerAnimated:videoPlayerViewController];
                              }];
    
    BTSimpleMenuItem *item6 = [[BTSimpleMenuItem alloc]initWithTitle:@"Intro Part1"
                                image:[UIImage imageNamed:@"icon6.png"]
                                onCompletion:^(BOOL success, BTSimpleMenuItem *item) {                                                            NSLog(@"I am Item 6");
                                    XCDYouTubeVideoPlayerViewController *videoPlayerViewController = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:@"lQBYpQG_8B4"];
                                    [self presentMoviePlayerViewControllerAnimated:videoPlayerViewController];
                              }];
    
    BTSimpleMenuItem *item7 = [[BTSimpleMenuItem alloc]initWithTitle:@"Intro Part2"
                                image:[UIImage imageNamed:@"icon7.png"]
                                onCompletion:^(BOOL success, BTSimpleMenuItem *item) {                                                            NSLog(@"I am Item 7");
                                    XCDYouTubeVideoPlayerViewController *videoPlayerViewController = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:@"PsMt7krL9H0"];
                                    [self presentMoviePlayerViewControllerAnimated:videoPlayerViewController];
                                }];
    
    sideMenu = [[BTSimpleSideMenu alloc]initWithItem:@[item0, item1, item2, item3, item4, item5, item6, item7] addToViewController:self];

}


-(void)a1TapDetected{
    NSLog(@"single Tap on imageview");
    [layerView removeFromSuperview];
    layerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 220)];
    [layerView.layer setBorderColor: [[UIColor whiteColor] CGColor]];
    [layerView.layer setBorderWidth: 2.0];
    [layerView setAlpha:1];
    UIImage *image = [UIImage imageNamed: @"chenchen.jpg"];
    [layerView setImage:image];
    UILabel *label=[ [UILabel alloc] initWithFrame:CGRectMake(0,220,self.view.frame.size.width,60)];
    [label.layer setBorderColor: [[UIColor whiteColor] CGColor]];
    [label.layer setBorderWidth: 2.0];
    label.text=@"Chen Chen 陈晨\nSoprano/VP";
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor whiteColor];
    label.font=[UIFont fontWithName:@"Helvetica" size:20.0 ];
    [layerView addSubview:label];
    [self.view addSubview:layerView];
    tap = [[UITapGestureRecognizer alloc]
           initWithTarget:self
           action:@selector(tapChangeImage)];
    
    [self.view addGestureRecognizer:tap];
}
-(void)tapChangeImage{
    [layerView removeFromSuperview];
}
-(void)a2TapDetected{
    NSLog(@"single Tap on imageview");
    [layerView removeFromSuperview];
    layerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 220)];
    [layerView.layer setBorderColor: [[UIColor whiteColor] CGColor]];
    [layerView.layer setBorderWidth: 2.0];
    [layerView setAlpha:1];
    UIImage *image = [UIImage imageNamed: @"li.jpg"];
    [layerView setImage:image];
    UILabel *label=[ [UILabel alloc] initWithFrame:CGRectMake(0,220,self.view.frame.size.width,60)];
    [label.layer setBorderColor: [[UIColor whiteColor] CGColor]];
    [label.layer setBorderWidth: 2.0];
    label.text=@"ZIMING LI 黎子明\nTENOR/VP/MUSIC MANAGER";
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor whiteColor];
    label.font=[UIFont fontWithName:@"Helvetica" size:20.0 ];
    [layerView addSubview:label];
    [self.view addSubview:layerView];
    tap = [[UITapGestureRecognizer alloc]
           initWithTarget:self
           action:@selector(tapChangeImage)];
    
    [self.view addGestureRecognizer:tap];
}

-(void)a3TapDetected{
    NSLog(@"single Tap on imageview");
    [layerView removeFromSuperview];
    layerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 220)];
    [layerView.layer setBorderColor: [[UIColor whiteColor] CGColor]];
    [layerView.layer setBorderWidth: 2.0];
    [layerView setAlpha:1];
    UIImage *image = [UIImage imageNamed: @"chen.jpg"];
    [layerView setImage:image];
    UILabel *label=[ [UILabel alloc] initWithFrame:CGRectMake(0,220,self.view.frame.size.width,60)];
    [label.layer setBorderColor: [[UIColor whiteColor] CGColor]];
    [label.layer setBorderWidth: 2.0];
    label.text=@"XU CHEN 陈序\nBARITONE";
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor whiteColor];
    label.font=[UIFont fontWithName:@"Helvetica" size:20.0 ];
    [layerView addSubview:label];
    [self.view addSubview:layerView];
    tap = [[UITapGestureRecognizer alloc]
           initWithTarget:self
           action:@selector(tapChangeImage)];
    
    [self.view addGestureRecognizer:tap];
}

-(void)a4TapDetected{
    NSLog(@"single Tap on imageview");
    [layerView removeFromSuperview];
    layerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 220)];
    [layerView.layer setBorderColor: [[UIColor whiteColor] CGColor]];
    [layerView.layer setBorderWidth: 2.0];
    [layerView setAlpha:1];
    UIImage *image = [UIImage imageNamed: @"wang.jpg"];
    [layerView setImage:image];
    UILabel *label=[ [UILabel alloc] initWithFrame:CGRectMake(0,220,self.view.frame.size.width,60)];
    [label.layer setBorderColor: [[UIColor whiteColor] CGColor]];
    [label.layer setBorderWidth: 2.0];
    label.text=@"BOB WANG 王天意\nBASS/VP";
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor whiteColor];
    label.font=[UIFont fontWithName:@"Helvetica" size:20.0 ];
    [layerView addSubview:label];
    [self.view addSubview:layerView];
    tap = [[UITapGestureRecognizer alloc]
           initWithTarget:self
           action:@selector(tapChangeImage)];
    
    [self.view addGestureRecognizer:tap];
}

-(void)a5TapDetected{
    NSLog(@"single Tap on imageview");
    [layerView removeFromSuperview];
    layerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 220)];
    [layerView.layer setBorderColor: [[UIColor whiteColor] CGColor]];
    [layerView.layer setBorderWidth: 2.0];
    [layerView setAlpha:1];
    UIImage *image = [UIImage imageNamed: @"lu.jpg"];
    [layerView setImage:image];
    UILabel *label=[ [UILabel alloc] initWithFrame:CGRectMake(0,220,self.view.frame.size.width,60)];
    [label.layer setBorderColor: [[UIColor whiteColor] CGColor]];
    [label.layer setBorderWidth: 2.0];
    label.text=@"DAVID LU 卢烨\nBASS";
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor whiteColor];
    label.font=[UIFont fontWithName:@"Helvetica" size:20.0 ];
    [layerView addSubview:label];
    [self.view addSubview:layerView];
    tap = [[UITapGestureRecognizer alloc]
           initWithTarget:self
           action:@selector(tapChangeImage)];
    
    [self.view addGestureRecognizer:tap];
}

-(void)a6TapDetected{
    NSLog(@"single Tap on imageview");
    [layerView removeFromSuperview];
    layerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 220)];
    [layerView.layer setBorderColor: [[UIColor whiteColor] CGColor]];
    [layerView.layer setBorderWidth: 2.0];
    [layerView setAlpha:1];
    UIImage *image = [UIImage imageNamed: @"he.jpg"];
    [layerView setImage:image];
    UILabel *label=[ [UILabel alloc] initWithFrame:CGRectMake(0,220,self.view.frame.size.width,60)];
    [label.layer setBorderColor: [[UIColor whiteColor] CGColor]];
    [label.layer setBorderWidth: 2.0];
    label.text=@"ZHIYAO HE 何知遥\nSOPRANO";
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor whiteColor];
    label.font=[UIFont fontWithName:@"Helvetica" size:20.0 ];
    [layerView addSubview:label];
    [self.view addSubview:layerView];
    tap = [[UITapGestureRecognizer alloc]
           initWithTarget:self
           action:@selector(tapChangeImage)];
    
    [self.view addGestureRecognizer:tap];
}


//- (IBAction) play:(id)sender {
//    [self.view endEditing:YES];
//    
//	XCDYouTubeVideoPlayerViewController *videoPlayerViewController = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:self.videoIdentifierTextField.text];
//	[self presentMoviePlayerViewControllerAnimated:videoPlayerViewController];
//}

#pragma mark - UITextFieldDelegate

//- (BOOL) textFieldShouldReturn:(UITextField *)textField
//{
//    //    NSLog(@"haha return");
//    [textField resignFirstResponder];
//	[self play:textField];
//	return YES;
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated {
    
}

-(void)show{
    [sideMenu toggleMenu];
}

#pragma -mark BTSimpleSideMenuDelegate

-(void)BTSimpleSideMenu:(BTSimpleSideMenu *)menu didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"Item Cliecked : %ld", (long)index);
}

-(void)BTSimpleSideMenu:(BTSimpleSideMenu *)menu selectedItemTitle:(NSString *)title {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Menu Clicked"
                                                   message:[NSString stringWithFormat:@"Item Title : %@", title]
                                                  delegate:self
                                         cancelButtonTitle:@"Dismiss"
                                         otherButtonTitles:nil, nil];
    [alert show];
}

@end
