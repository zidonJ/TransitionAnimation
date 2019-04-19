/*
 Copyright (C) 2016 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 The presented view controller for the Swipe demo.
 */

#import "AAPLSwipeSecondViewController.h"
#import "AAPLSwipeTransitionDelegate.h"

@interface AAPLSwipeSecondViewController ()


@end


@implementation AAPLSwipeSecondViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    UIScreenEdgePanGestureRecognizer *interactiveTransitionRecognizer;
    interactiveTransitionRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(interactiveTransitionRecognizerAction:)];
    interactiveTransitionRecognizer.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:interactiveTransitionRecognizer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    AAPLSwipeTransitionDelegate *transitionDelegate = self.transitioningDelegate;
    
    transitionDelegate.targetEdge = UIRectEdgeLeft;
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)interactiveTransitionRecognizerAction:(UIScreenEdgePanGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateBegan) {

//        [self dismissViewControllerAnimated:true completion:nil];
        
        if ([self.transitioningDelegate isKindOfClass:AAPLSwipeTransitionDelegate.class]) {
            AAPLSwipeTransitionDelegate *transitionDelegate = self.transitioningDelegate;
            
            if ([sender isKindOfClass:UIGestureRecognizer.class])
                transitionDelegate.gestureRecognizer = sender;
            else
                transitionDelegate.gestureRecognizer = nil;
            transitionDelegate.targetEdge = UIRectEdgeLeft;
            [self dismissViewControllerAnimated:true completion:nil];
        }
    }
}

@end
