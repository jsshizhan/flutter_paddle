//
//  EasyDLResultData.h
//  EasyDL
//
//  Created by Xiaoyu Chen on 2020/7/6.
//  Copyright © 2020 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef __cplusplus

#import <opencv2/opencv.hpp>

#endif

NS_ASSUME_NONNULL_BEGIN

@interface EasyDLResultData : NSObject

@end


/**
 * 图像分类的结果
 */
@interface EasyDLClassfiData : EasyDLResultData

@property(nonatomic, copy) NSString *label;
@property(nonatomic) int category;
@property(nonatomic) float accuracy;

@end


/**
 * 物体检测的结果
 */
@interface EasyDLObjectDetectionData : EasyDLClassfiData

/**
 * 左上角和有效角的坐标
 * 均为相对于长宽的0~1的比例值
 */
@property(nonatomic) float xmin;
@property(nonatomic) float ymin;
@property(nonatomic) float xmax;
@property(nonatomic) float ymax;

@end


/**
 * 图像分割识别结果
 */
@interface EasyDLObjSegmentationData : EasyDLObjectDetectionData
#ifdef __cplusplus
@property cv::Mat mask;
#endif
@property(nonatomic) NSString *mask_rle;
@end


/**
 * OCR 识别结果
 */

@interface EasyDLOcrData : EasyDLClassfiData

/**
 * 四边形的四个点，均为相对于长宽的0~1的比例值
 * 一段连续的文字
 */

@property(nonatomic) NSArray *polygonPoints;

@end

/**
 * 姿态估计的结果
 */
@interface EasyDLPoseData : EasyDLClassfiData

/**
 * 关键点坐标以及pairs的其他关键点
 * x,y均为相对于长宽的0~1的比例值
 */
@property(nonatomic) int id;
@property(nonatomic) int group_id;
@property(nonatomic) float x1;
@property(nonatomic) float y1;

@property(nonatomic) bool isShow;
@property(nonatomic) NSArray<EasyDLPoseData *> *pairs;
@property(nonatomic) bool drawCircle;
@end

/**
 * Gan 识别结果
 */
@interface EasyDLGanData : EasyDLClassfiData
#ifdef __cplusplus
@property cv::Mat genImg;
#endif
@end

NS_ASSUME_NONNULL_END
