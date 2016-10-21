//
//  CustomItemView.m
//  DxManager
//
//  Created by ligb on 16/9/6.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//
#define ITEM_BY  8
#define ITEM_BW  80    //item  button width
#define ITEM_BH  30     //item  button height
#define HEAD_H   35     // head View height
#define LINE_H   15     // head View line height
#define ITEMCOLOR  @"#333333".color


#import "CustomItemView.h"
#import "AppDefine.h"
#import "HTHorizontalSelectionList.h"
@interface CustomHeadView : UIView
@property (nonatomic , strong) UILabel *itemLab;
@end

@implementation CustomHeadView
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title{
    self = [super initWithFrame:frame];
    if (self) {
        self.itemLab.text = title;
    }
    return self;
}

- (UILabel *)itemLab{
    if (!_itemLab) {
        _itemLab = [[UILabel alloc] initWithFrame:self.bounds];
        _itemLab.textColor = ITEMCOLOR;
        _itemLab.font = [UIFont systemFontOfSize:15];
        [self addSubview:_itemLab];
    }
    return _itemLab;
}


@end


@interface CustomItemView()<UIScrollViewDelegate,HTHorizontalSelectionListDataSource, HTHorizontalSelectionListDelegate>
{
    
}
@property (nonatomic , strong) HTHorizontalSelectionList *headView;
@property (nonatomic , strong) NSMutableArray *itemViews;

@end


@implementation CustomItemView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)awakeFromNib{
}
- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.backgroundColor = [UIColor colorViewBg];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.scrollEnabled = YES;
        _scrollView.delegate = self;
        [self addSubview:_scrollView];
        
        _scrollView.translatesAutoresizingMaskIntoConstraints = NO;
       
        //寬度
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_scrollView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_scrollView)]];
        
        NSString *vFormat = [NSString stringWithFormat:@"V:|-%d-[_scrollView]|",HEAD_H];
        //高度
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vFormat options:0 metrics:nil views:NSDictionaryOfVariableBindings(_scrollView)]];
    }
    return _scrollView;
}

- (HTHorizontalSelectionList *)headView{
    if (!_headView) {
        _headView = [[HTHorizontalSelectionList alloc] initWithFrame:CGRectMake(0, 0, self.screen_W, HEAD_H)];
        _headView.delegate = self;
        _headView.dataSource = self;
        
        //    _selectionList.selectionIndicatorAnimationMode = HTHorizontalSelectionIndicatorAnimationModeLightBounce;
        _headView.selectionIndicatorStyle = HTHorizontalSelectionIndicatorStyleButtonBorder;
        _headView.selectionIndicatorColor = [UIColor colorAppBg];
        [_headView setTitleColor:[@"666666" color] forState:UIControlStateHighlighted];
        [_headView setTitleFont:[UIFont systemFontOfSize:15] forState:UIControlStateNormal];
        [_headView setTitleFont:[UIFont boldSystemFontOfSize:15] forState:UIControlStateSelected];
        [_headView setTitleFont:[UIFont boldSystemFontOfSize:15] forState:UIControlStateHighlighted];
        
        UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, _headView.h-1, _headView.w, 0.5)];
        line.backgroundColor = [UIColor lightGrayColor];
        [_headView addSubview:line];
        
        [self addSubview:_headView];
    }
    return _headView;
}
- (void)addHeadItems:(NSArray *)titles{
    _itemViews = [NSMutableArray arrayWithCapacity:titles.count];
    for (int i=0;i<titles.count;i++) {
        float width = i == 0 ? 60 : 80;
        CustomHeadView *item = [[CustomHeadView alloc] initWithFrame:CGRectMake(0, 0, width, HEAD_H) title:titles[i]];
        if (i == 0) {
            item.itemLab.textColor = [UIColor colorBlue];
            item.itemLab.font = [UIFont systemFontOfSize:18];
        }
        [_itemViews addObject:item];
    }
    [self.headView reloadData];
    
}
- (void)addItemView:(NSArray *)views title:(NSArray *)titles height:(float)height{
    
    if (titles.count) {
        [self addHeadItems:titles];
    }
   
    //设置contentSize
    self.scrollView.contentSize = CGSizeMake(self.screen_W * views.count, _scrollView.h);
    
    for (int i= 0; i< views.count; i++) {
        UIView *iView = views[i];
//        iView.backgroundColor = [UIColor randomColor];
//        iView.layer.borderWidth = 1;
//        iView.layer.borderColor = [UIColor randomColor].CGColor;
//        iView.translatesAutoresizingMaskIntoConstraints = NO;
        iView.frame = CGRectMake(i*self.screen_W, 0, self.screen_W, height-HEAD_H);
        [_scrollView addSubview:iView];
        
        /*
        NSString *formatW = [NSString stringWithFormat:@"H:|-%f-[iView(==%f)]",i*self.screen_W,self.screen_W];
        //寬度
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:formatW options:0 metrics:nil views:NSDictionaryOfVariableBindings(iView,_scrollView)]];
        
        //高度
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[iView(height)]|" options:0 metrics:@{@"height":@(height-HEAD_H)}  views:NSDictionaryOfVariableBindings(iView)]];*/
    }
    
    
    
    //点击item改变对应的页面
//    @WeakObj(self);
//    _headView.itemsEventAction = ^(NSInteger index){
//        selfWeak.itemIndex = index;
//        if (views.count >1 ) {
//            [selfWeak.scrollView setContentOffset:CGPointMake(index * self.screen_W, 0) animated:YES];
//        }
//        
//        if (selfWeak.itemsEcentAction) {
//            selfWeak.itemsEcentAction (index);
//        }
//    };
}

- (void)loadItemsStatus:(NSInteger)index{
    //记录item
    self.itemIndex = index;
    if (_itemsEcentAction) {
        //block 返回item index
        _itemsEcentAction (index);
    }
    
    //改变item title 状态
    for (int i= 0; i< _itemViews.count; i++) {
        CustomHeadView *iView = _itemViews[i];
        if (i == index) {
            iView.itemLab.textColor = [UIColor colorBlue];
            iView.itemLab.font = [UIFont systemFontOfSize:18];
        }else{
            iView.itemLab.textColor = ITEMCOLOR;
            iView.itemLab.font = [UIFont systemFontOfSize:15];
        }
    }
    
    
}

#pragma mark ScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    // 得到每页宽度
    CGFloat pageWidth = scrollView.screen_W;
    // 根据当前的x坐标和页宽度计算出当前页数
    int currentPage = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    //滑动判断如果滑动的page 没有变化就不去改变页面
    if (self.itemIndex == currentPage)
        return;
    
    //改变item 选择状态
    _headView.selectedButtonIndex = currentPage;
   
    [self loadItemsStatus:currentPage];
}

#pragma mark
#pragma mark - HTHorizontalSelectionListDataSource Protocol Methods
- (NSInteger)numberOfItemsInSelectionList:(HTHorizontalSelectionList *)selectionList {
    return _itemViews.count;
}

- (UIView *)selectionList:(HTHorizontalSelectionList *)selectionList viewForItemWithIndex:(NSInteger)index{
    return _itemViews[index];
}
#pragma mark - HTHorizontalSelectionListDelegate Protocol Methods

- (void)selectionList:(HTHorizontalSelectionList *)selectionList didSelectButtonWithIndex:(NSInteger)index {
    [self.scrollView setContentOffset:CGPointMake(index * self.screen_W, 0) animated:YES];
    
    [self loadItemsStatus:index];
    
}

@end
