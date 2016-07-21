//
//  TableViewCell.m
//  KLScreenFPSLabel
//
//  Created by 快摇002 on 16/7/18.
//  Copyright © 2016年 aiitec. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailsLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation TableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)setContentView
{
    NSInteger num = arc4random_uniform(200);
    NSInteger iconIndex = arc4random_uniform(4);
    self.titleLabel.text = [NSString stringWithFormat:@"随机数:%ld",num];
    self.detailsLabel.text = [NSString stringWithFormat:@"随机数:%ld",num];
    self.headerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"icon%ld.jpg",iconIndex]];
    NSArray *commentsArray = @[@"社会主义好！👌👌👌👌社会主义好！社会主义好！社会主义好！",
                               @"正宗好凉茶，正宗好声音。。。好好好好好好好好好好好好好好v",
                               @"你好，我好，大家好才是真的好,大家好才是真的好,大家好才是真的好,大家好才是真的好,大家好才是真的好",
                               @"你瞅啥？你瞅啥？你瞅啥？",
                               @"瞅你咋地？？？！！！",
                               @"hello，看我",
                               @"曾经在幽幽暗暗反反复复中追问，才知道平平淡淡从从容容才是真",
                               @"人艰不拆,人艰不拆,人艰不拆,人艰不拆",
                               @"我勒个去，啥世道啊",
                               @"真有意思啊你💢💢💢真有意思啊你💢💢💢真有意思啊你💢💢💢真有意思啊你💢💢💢真有意思啊你💢💢💢真有意思啊你💢💢💢真有意思啊你💢💢💢真有意思啊你💢💢💢"];
    NSInteger contentIndex = arc4random_uniform(10);
    self.contentLabel.text = [commentsArray objectAtIndex:contentIndex];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
