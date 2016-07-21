//
//  KLScreenPFSLable.m
//  KLScreenFPSLabel
//
//  Created by 快摇002 on 16/7/18.
//  Copyright © 2016年 aiitec. All rights reserved.
//

#import "KLScreenFPSLable.h"

@interface KLScreenFPSLable ()

@property (strong, nonatomic) CADisplayLink *displayLink;
@property (strong, nonatomic) NSTimer *timer;
@property (assign, nonatomic) NSInteger count;
@property (assign, nonatomic) NSTimeInterval interval;

@end

@implementation KLScreenFPSLable

- (instancetype)initWithFrame:(CGRect)frame
{
    if (frame.size.width == 0 && frame.size.height == 0)
    {
        frame.size = CGSizeMake(60, 20);
    }

    if (self = [super initWithFrame:frame])
    {
        self.layer.cornerRadius = 5;
        self.clipsToBounds = YES;
        self.textAlignment = NSTextAlignmentCenter;
        self.userInteractionEnabled = NO;
        self.textColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.700];

        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displaylinkTick:)];
        [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
    return self;
}

- (void)displaylinkTick:(CADisplayLink *)link
{
    if (_interval == 0) {
        _interval = link.timestamp;
        return;
    }

    _count++;
    NSTimeInterval delta = link.timestamp - _interval;
    if (delta < 1) return;
    _interval = link.timestamp;
    float fps = _count / delta;
    _count = 0;

    CGFloat progress = fps / 60.0;
    UIColor *color = [UIColor colorWithHue:0.27 * (progress - 0.2) saturation:1 brightness:0.9 alpha:1];

    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%d FPS",(int)round(fps)]];
    [text addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0,text.length-3)];
    self.attributedText = text;
}

- (void)dealloc
{
    [_displayLink invalidate];
}

+ (void)showInView:(UIView *)view
{
    KLScreenFPSLable *label = [[KLScreenFPSLable alloc]init];
    label.center = view.center;
    [view addSubview:label];
}


@end
