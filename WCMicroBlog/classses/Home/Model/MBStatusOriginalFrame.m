//
//  MBStatusOriginalFrame.m
//  WCMicroBlog
//
//  Created by 王超 on 16/6/23.
//  Copyright © 2016年 王超. All rights reserved.
//

#import "MBStatusOriginalFrame.h"
#import "StatusModel.h"
@implementation MBStatusOriginalFrame
- (void)setStatus:(StatusModel *)status
{
    _status = status;
    //设置头像
    CGFloat iconX = MBCellInset;
    CGFloat iconY = MBCellInset;
    CGFloat iconW = 35;
    CGFloat iconH = 35;
    self.iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    //设置昵称
    CGFloat nameX = CGRectGetMaxX(self.iconFrame)+MBCellInset;
    CGFloat nameY = iconY;
//    CGFloat nameW = 35;
//    CGFloat nameH = 35;
    NSDictionary * nameAttr = @{NSFontAttributeName:MBStatusOriginalNameFont};
    CGSize nameSize = [status.user.name sizeWithAttributes:nameAttr];
//    self.nameFrame = CGRectMake(nameX, nameY, nameW, nameH);
    self.nameFrame = (CGRect){{nameX,nameY},nameSize};

    //设置时间
    CGFloat timeX = nameX;
    CGFloat timeY = CGRectGetMaxY(self.nameFrame)+MBCellInset;
    NSDictionary * timeAttr = @{NSFontAttributeName:MBStatusOriginalTimeFont};
    CGSize timeSize = [status.created_at sizeWithAttributes:timeAttr];
//    CGFloat timeW = 35;
//    CGFloat timeH = 35;
//    self.timeFrame = CGRectMake(iconX, iconY, iconW, iconH);
    self.timeFrame = (CGRect){{timeX,timeY},timeSize};

    //设置来源
    CGFloat sourceX = CGRectGetMaxX(self.timeFrame)+MBCellInset;
    CGFloat sourceY = CGRectGetMaxY(self.nameFrame)+MBCellInset;
    NSDictionary * sourceAttr = @{NSFontAttributeName:MBStatusOriginalSourceFont};
    CGSize sourceSize = [status.source sizeWithAttributes:sourceAttr];
    self.sourceFrame = (CGRect){{sourceX,sourceY},sourceSize};
    //设置正文
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(_iconFrame) + MBCellInset;
    NSDictionary * textAttr = @{NSFontAttributeName:MBStatusOriginalTextFont};
    
    CGSize textSize = [status.text sizeWithAttributes:textAttr ];
    textSize = [status.text boundingRectWithSize:textSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAttr context:nil ].size;
    
    

}
@end
