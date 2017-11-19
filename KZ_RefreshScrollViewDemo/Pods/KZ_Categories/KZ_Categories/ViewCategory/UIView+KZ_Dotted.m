//
//  UIView+KZ_Dotted.m
//  KZ_Categories
//
//  Created by Kieron Zhang on 2016/12/24.
//  Copyright © 2016年 Kieron Zhang. All rights reserved.
//

#import "UIView+KZ_Dotted.h"
#import "NSString+KZ_Radom.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>

@interface UIView ()

@property (nonatomic, strong) NSMutableDictionary *shapeLayerDictionary;

@end

@implementation UIView (KZ_Dotted)

- (void)kz_removeShapeLayerWithKey:(NSString *)key {
    CAShapeLayer *shapeLayer = self.shapeLayerDictionary[key];
    if (shapeLayer) {
        [shapeLayer removeFromSuperlayer];
        [self.shapeLayerDictionary removeObjectForKey:key];
    }
}

#pragma mark InstanceMethods
- (NSString *)kz_drawDottedLineWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    return [self kz_drawDottedLineWithStartPoint:startPoint endPoint:endPoint backgroundColor:self.kz_layerBackgroundColor lineColor:self.kz_lineColor lineWidth:self.kz_lineWidth lineLength:self.kz_lineLength spaceLength:self.kz_spaceLength];
}

- (NSString *)kz_drawDottedLineWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint backgroundColor:(UIColor *)backgroundColor lineColor:(UIColor *)lineColor lineWidth:(CGFloat)lineWidth lineLength:(CGFloat)lineLength spaceLength:(CGFloat)spaceLength {
    CAShapeLayer *shapeLayer = [[self class] kz_drawDottedLineWithStartPoint:startPoint endPoint:endPoint backgroundColor:backgroundColor lineColor:lineColor lineWidth:lineWidth lineLength:lineLength spaceLength:spaceLength];
    [self.layer addSublayer:shapeLayer];
    NSString *key = [NSString kz_radom32BitString];
    self.shapeLayerDictionary[key] = shapeLayer;
    return key;
}

- (NSString *)kz_drawDottedRectWithRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius {
    return [self kz_drawDottedRectWithRect:rect cornerRadius:cornerRadius backgroundColor:self.kz_layerBackgroundColor lineColor:self.kz_lineColor lineWidth:self.kz_lineWidth lineLength:self.kz_lineLength spaceLength:self.kz_spaceLength];
}

- (NSString *)kz_drawDottedRectWithRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius backgroundColor:(UIColor *)backgroundColor lineColor:(UIColor *)lineColor lineWidth:(CGFloat)lineWidth lineLength:(CGFloat)lineLength spaceLength:(CGFloat)spaceLength {
    CAShapeLayer *shapeLayer = [[self class] kz_drawDottedRectWithRect:rect cornerRadius:cornerRadius backgroundColor:backgroundColor lineColor:lineColor lineWidth:lineWidth lineLength:lineLength spaceLength:spaceLength];
    [self.layer addSublayer:shapeLayer];
    NSString *key = [NSString kz_radom32BitString];
    self.shapeLayerDictionary[key] = shapeLayer;
    return key;
}

- (NSString *)kz_drawDottedRectWithRect:(CGRect)rect byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii {
    return [self kz_drawDottedRectWithRect:rect byRoundingCorners:corners cornerRadii:cornerRadii backgroundColor:self.kz_layerBackgroundColor lineColor:self.kz_lineColor lineWidth:self.kz_lineWidth lineLength:self.kz_lineLength spaceLength:self.kz_spaceLength];
}

- (NSString *)kz_drawDottedRectWithRect:(CGRect)rect byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii backgroundColor:(UIColor *)backgroundColor lineColor:(UIColor *)lineColor lineWidth:(CGFloat)lineWidth lineLength:(CGFloat)lineLength spaceLength:(CGFloat)spaceLength {
    CAShapeLayer *shapeLayer = [[self class] kz_drawDottedRectWithRect:rect byRoundingCorners:corners cornerRadii:cornerRadii backgroundColor:backgroundColor lineColor:lineColor lineWidth:lineWidth lineLength:lineLength spaceLength:spaceLength];
    [self.layer addSublayer:shapeLayer];
    NSString *key = [NSString kz_radom32BitString];
    self.shapeLayerDictionary[key] = shapeLayer;
    return key;
}

- (NSString *)kz_drawDottedOvalWithRect:(CGRect)rect {
    return [self kz_drawDottedOvalWithRect:rect backgroundColor:self.kz_layerBackgroundColor lineColor:self.kz_lineColor lineWidth:self.kz_lineWidth lineLength:self.kz_lineLength spaceLength:self.kz_spaceLength];
}

- (NSString *)kz_drawDottedOvalWithRect:(CGRect)rect backgroundColor:backgroundColor lineColor:(UIColor *)lineColor lineWidth:(CGFloat)lineWidth lineLength:(CGFloat)lineLength spaceLength:(CGFloat)spaceLength {
    CAShapeLayer *shapeLayer = [[self class] kz_drawDottedOvalWithRect:rect backgroundColor:backgroundColor lineColor:lineColor lineWidth:lineWidth lineLength:lineLength spaceLength:spaceLength];
    [self.layer addSublayer:shapeLayer];
    NSString *key = [NSString kz_radom32BitString];
    self.shapeLayerDictionary[key] = shapeLayer;
    return key;
}

- (NSString *)kz_drawDottedCircleWithArcCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise {
    return [self kz_drawDottedCircleWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:clockwise backgroundColor:self.kz_layerBackgroundColor lineColor:self.kz_lineColor lineWidth:self.kz_lineWidth lineLength:self.kz_lineLength spaceLength:self.kz_spaceLength];
}

- (NSString *)kz_drawDottedCircleWithArcCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise backgroundColor:(UIColor *)backgroundColor lineColor:(UIColor *)lineColor lineWidth:(CGFloat)lineWidth lineLength:(CGFloat)lineLength spaceLength:(CGFloat)spaceLength {
    CAShapeLayer *shapeLayer = [[self class] kz_drawDottedCircleWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:clockwise backgroundColor:backgroundColor lineColor:lineColor lineWidth:lineWidth lineLength:lineLength spaceLength:spaceLength];
    [self.layer addSublayer:shapeLayer];
    NSString *key = [NSString kz_radom32BitString];
    self.shapeLayerDictionary[key] = shapeLayer;
    return key;
}

- (NSString *)kz_drawDottedWithFrame:(CGRect)frame path:(CGPathRef)path {
    return [self kz_drawDottedWithFrame:frame path:path backgroundColor:self.kz_layerBackgroundColor lineColor:self.kz_lineColor lineWidth:self.kz_lineWidth lineLength:self.kz_lineLength spaceLength:self.kz_spaceLength];
}

- (NSString *)kz_drawDottedWithFrame:(CGRect)frame path:(CGPathRef)path backgroundColor:(UIColor *)backgroundColor lineColor:(UIColor *)lineColor lineWidth:(CGFloat)lineWidth lineLength:(CGFloat)lineLength spaceLength:(CGFloat)spaceLength {
    CAShapeLayer *shapeLayer = [[self class] kz_drawDottedWithFrame:frame path:path backgroundColor:backgroundColor lineColor:lineColor lineWidth:lineWidth lineLength:lineLength spaceLength:spaceLength];
    [self.layer addSublayer:shapeLayer];
    NSString *key = [NSString kz_radom32BitString];
    self.shapeLayerDictionary[key] = shapeLayer;
    return key;
}

#pragma mark ClassMethods
+ (CAShapeLayer *)kz_drawDottedLineWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint backgroundColor:(UIColor *)backgroundColor lineColor:(UIColor *)lineColor lineWidth:(CGFloat)lineWidth lineLength:(CGFloat)lineLength spaceLength:(CGFloat)spaceLength {
    CGRect frame = CGRectMake(MIN(startPoint.x, endPoint.x), MIN(startPoint.y, endPoint.y), fabs(startPoint.x - endPoint.x), fabs(startPoint.y - endPoint.y));
    CAShapeLayer *shapeLayer = [[self class] kz_createShapeLayerWithFrame:frame backgroundColor:backgroundColor lineColor:lineColor lineWidth:lineWidth lineLength:lineLength spaceLength:spaceLength];
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:startPoint];
    [bezierPath addLineToPoint:endPoint];
    shapeLayer.path = bezierPath.CGPath;
    return shapeLayer;
}

+ (CAShapeLayer *)kz_drawDottedRectWithRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius backgroundColor:(UIColor *)backgroundColor lineColor:(UIColor *)lineColor lineWidth:(CGFloat)lineWidth lineLength:(CGFloat)lineLength spaceLength:(CGFloat)spaceLength {
    CAShapeLayer *shapeLayer = [[self class] kz_createShapeLayerWithFrame:rect backgroundColor:backgroundColor lineColor:lineColor lineWidth:lineWidth lineLength:lineLength spaceLength:spaceLength];
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
    shapeLayer.path = bezierPath.CGPath;
    return shapeLayer;
}

+ (CAShapeLayer *)kz_drawDottedRectWithRect:(CGRect)rect byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii backgroundColor:(UIColor *)backgroundColor lineColor:(UIColor *)lineColor lineWidth:(CGFloat)lineWidth lineLength:(CGFloat)lineLength spaceLength:(CGFloat)spaceLength {
    CAShapeLayer *shapeLayer = [[self class] kz_createShapeLayerWithFrame:rect backgroundColor:backgroundColor lineColor:lineColor lineWidth:lineWidth lineLength:lineLength spaceLength:spaceLength];
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:cornerRadii];
    shapeLayer.path = bezierPath.CGPath;
    return shapeLayer;
}

+ (CAShapeLayer *)kz_drawDottedOvalWithRect:(CGRect)rect backgroundColor:(UIColor *)backgroundColor lineColor:(UIColor *)lineColor lineWidth:(CGFloat)lineWidth lineLength:(CGFloat)lineLength spaceLength:(CGFloat)spaceLength {
    CAShapeLayer *shapeLayer = [[self class] kz_createShapeLayerWithFrame:rect backgroundColor:backgroundColor lineColor:lineColor lineWidth:lineWidth lineLength:lineLength spaceLength:spaceLength];
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:rect];
    shapeLayer.path = bezierPath.CGPath;
    return shapeLayer;
}

+ (CAShapeLayer *)kz_drawDottedCircleWithArcCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise backgroundColor:(UIColor *)backgroundColor lineColor:(UIColor *)lineColor lineWidth:(CGFloat)lineWidth lineLength:(CGFloat)lineLength spaceLength:(CGFloat)spaceLength {
    CGRect frame = CGRectMake(center.x - radius, center.y - radius, radius * 2, radius * 2);
    CAShapeLayer *shapeLayer = [[self class] kz_createShapeLayerWithFrame:frame backgroundColor:backgroundColor lineColor:lineColor lineWidth:lineWidth lineLength:lineLength spaceLength:spaceLength];
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:clockwise];
    shapeLayer.path = bezierPath.CGPath;
    return shapeLayer;
}

+ (CAShapeLayer *)kz_drawDottedWithFrame:(CGRect)frame path:(CGPathRef)path backgroundColor:(UIColor *)backgroundColor lineColor:(UIColor *)lineColor lineWidth:(CGFloat)lineWidth lineLength:(CGFloat)lineLength spaceLength:(CGFloat)spaceLength {
    CAShapeLayer *shapeLayer = [[self class] kz_createShapeLayerWithFrame:frame backgroundColor:backgroundColor lineColor:lineColor lineWidth:lineWidth lineLength:lineLength spaceLength:spaceLength];
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithCGPath:path];
    shapeLayer.path = bezierPath.CGPath;
    return shapeLayer;
}

+ (CAShapeLayer *)kz_createShapeLayerWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor lineColor:(UIColor *)lineColor lineWidth:(CGFloat)lineWidth lineLength:(CGFloat)lineLength spaceLength:(CGFloat)spaceLength {
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.bounds = frame;
    shapeLayer.position = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame));
    shapeLayer.fillColor = backgroundColor.CGColor;
    shapeLayer.strokeColor = lineColor.CGColor;
    shapeLayer.lineWidth = lineWidth;
    shapeLayer.lineJoin = kCALineJoinRound;
    if (lineLength > 0 && spaceLength > 0) {
        shapeLayer.lineDashPattern = @[@(lineLength), @(spaceLength)];
    }
    return shapeLayer;
}

#pragma mark SetGetMethods
- (void)setShapeLayerDictionary:(NSMutableDictionary *)shapeLayerDictionary {
    objc_setAssociatedObject(self, @"KZ_DottedView_ShapeLayerDictionary", shapeLayerDictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableDictionary *)shapeLayerDictionary {
    NSMutableDictionary *dictionary = objc_getAssociatedObject(self, @"KZ_DottedView_ShapeLayerDictionary");
    if (!dictionary) {
        dictionary = [[NSMutableDictionary alloc] initWithCapacity:0];
        self.shapeLayerDictionary = dictionary;
    }
    return dictionary;
}

- (void)setKz_lineColor:(UIColor *)kz_lineColor {
    objc_setAssociatedObject(self, @"KZ_DottedView_LineColor", kz_lineColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)kz_lineColor {
    UIColor *color = objc_getAssociatedObject(self, @"KZ_DottedView_LineColor");
    if (!color) {
        color = [UIColor blackColor];
        self.kz_lineColor = color;
    }
    return color;
}

- (void)setKz_layerBackgroundColor:(UIColor *)kz_layerBackgroundColor {
    objc_setAssociatedObject(self, @"KZ_DottedView_LayerBackgroundColor", kz_layerBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)kz_layerBackgroundColor {
    UIColor *color = objc_getAssociatedObject(self, @"KZ_DottedView_LayerBackgroundColor");
    if (!color) {
        color = [UIColor clearColor];
        self.kz_layerBackgroundColor = color;
    }
    return color;
}

- (void)setKz_lineWidth:(CGFloat)kz_lineWidth {
    objc_setAssociatedObject(self, @"KZ_DottedView_LineWidth", @(kz_lineWidth), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)kz_lineWidth {
    NSNumber *number = objc_getAssociatedObject(self, @"KZ_DottedView_LineWidth");
    if (!number) {
        number = [NSNumber numberWithFloat:1.0f];
        self.kz_lineWidth = number.floatValue;
    }
    return number.floatValue;
}

- (void)setKz_lineLength:(CGFloat)kz_lineLength {
    objc_setAssociatedObject(self, @"KZ_DottedView_LineLength", @(kz_lineLength), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)kz_lineLength {
    NSNumber *number = objc_getAssociatedObject(self, @"KZ_DottedView_LineLength");
    if (!number) {
        number = [NSNumber numberWithFloat:3.0f];
        self.kz_lineLength = number.floatValue;
    }
    return number.floatValue;
}

- (void)setKz_spaceLength:(CGFloat)kz_spaceLength {
    objc_setAssociatedObject(self, @"KZ_DottedView_SpaceLength", @(kz_spaceLength), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)kz_spaceLength {
    NSNumber *number = objc_getAssociatedObject(self, @"KZ_DottedView_SpaceLength");
    if (!number) {
        number = [NSNumber numberWithFloat:3.0f];
        self.kz_spaceLength = number.floatValue;
    }
    return number.floatValue;
}

@end
