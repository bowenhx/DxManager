//
//  SendMegViewController.m
//  DxManager
//
//  Created by ligb on 16/10/18.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "SendMegViewController.h"
#import "UIImage+UIImageExt.h"
#import "ZLPhotoPickerViewController.h"
#import "ZLPhotoPickerBrowserViewController.h"
#import "ZLPhotoAssets.h"
#import "ZLCamera.h"
#import "UploadingFormData.h"

#define SPACE 20  //图片间隔20


@interface SendMegViewController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,ZLPhotoPickerBrowserViewControllerDelegate>
{
    
    __weak IBOutlet UITextView *_textView;
    
    __weak IBOutlet UILabel *_labText;
    
    float img_W;
    
}
@property (nonatomic , strong) UIButton *photoBtn; //添加照片btn
@property (nonatomic , strong) NSMutableArray *assets;//照片数据源
@end

@implementation SendMegViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"发布通知";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
       
}

- (void)loadNewView{
    [self.rightBtn setTitle:@"发布" forState:0];
    
    
    img_W = (self.screen_W - SPACE * 4) / 3;
    
    [self photoBtn];
    
}

- (UIButton *)photoBtn{
    if (!_photoBtn) {
        _photoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _photoBtn.frame = CGRectMake(SPACE,_textView.max_Y + 10, img_W, img_W);
        [_photoBtn setBackgroundImage:[UIImage imageNamed:@"3-1-2-3"] forState:UIControlStateNormal];
        [_photoBtn addTarget:self action:@selector(selectPhotoAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_photoBtn];
    }
    return _photoBtn;
}

- (NSMutableArray *)assets{
    if (!_assets) {
        _assets = [NSMutableArray array];
    }
    return _assets;
}
- (void)tapRightBtn{
    if ([@"" isStringBlank:_textView.text]) {
        [self.view showHUDTitleView:@"请输入内容再发布" image:nil];
    }
   
    NSArray *files = [NSArray uploadingImageFiles:self.assets];
    
    NSDictionary *info = @{@"action":@"doPublishNotice",
                           @"authorid":@(2),
                           @"noticecontent":_textView.text,
                           @"filecount":@(self.assets.count)
                           };
    
    
    [self.view showHUDActivityView:@"正在加载" shade:NO];
    [[ANet share] upload:BASE_URL params:info files:files precent:^(float precent) {
        
    } completion:^(BNetData *model, NSString *netErr) {
        [self.view removeHUDActivity];
        
        NSLog(@"data = %@",model.data);
        if (model.status == 0) {
            
            [self.view showHUDTitleView:model.message image:nil];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"updataHomeStatus" object:nil];
            
            [self performSelector:@selector(tapBackBtn) withObject:nil afterDelay:.7];
        }else{
            [self.view showHUDTitleView:model.message image:nil];
        }
    }];
    
    
}


// textViewDelegate
- (void)textViewDidChange:(UITextView *)textView {
    // 默认提示字
    if ([textView.text length] == 0) {
        [_labText setHidden:NO];
    }
    if ([textView.text length] != 0) {
        [_labText setHidden:YES];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//退出键盘action
- (void)cancelResponder
{
    if ([_textView isFirstResponder]){
        [_textView resignFirstResponder];
    }
}

- (void)selectPhotoAction:(UIButton *)sender {
    [self cancelResponder];
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"手机相册",@"系统拍照", nil];
    [sheet showInView:self.view];
}

#pragma mark 选择相册
- (void)localPhoto{
    ZLPhotoPickerViewController *pickerVc = [[ZLPhotoPickerViewController alloc] init];
    pickerVc.status = PickerViewShowStatusCameraRoll;
    pickerVc.maxCount = 9;
    pickerVc.selectPickers = self.assets;
    pickerVc.photoStatus = PickerPhotoStatusPhotos;
    // Desc Show Photos, And Suppor Camera
    pickerVc.topShowPhotoPicker = YES;
    // CallBack
    __weak typeof(self) bself = self;
    pickerVc.callBack = ^(NSArray<ZLPhotoAssets *> *status){
        if (_assets.count)
            [_assets removeAllObjects];
        
        for (ZLPhotoAssets *asset in status) {
            ZLPhotoPickerBrowserPhoto *photo = [[ZLPhotoPickerBrowserPhoto alloc] init];
            if ([asset isKindOfClass:[ZLPhotoAssets class]]) {
                photo.asset = asset;
                //当asset 找不到图片时可以取photoImage/ photoURL
                photo.photoImage = asset.originImage;
                photo.photoURL = asset.assetURL;
            }else if ([asset isKindOfClass:[ZLCamera class]]){
                ZLCamera *camera = (ZLCamera *)asset;
                photo.photoImage = [camera photoImage];
            }
            [_assets addObject:photo];
        }
        [bself removeScrollViewSuperViewBtn];
    };
    
    
    [self presentViewController:pickerVc animated:YES completion:nil];
    
    
}
- (void)removeScrollViewSuperViewBtn
{
    for (UIButton *buttonView in [self.view subviews]) {
        if ([buttonView isKindOfClass:[UIButton class]]) {
            //判断，不要把选择主题分类按钮删除掉
            if ([buttonView backgroundImageForState:UIControlStateNormal]) {
                [buttonView removeFromSuperview];
            }
        }
    }
    
    [self addPhotosImage];
}
- (void)addPhotosImage{

    float Y = _textView.max_Y + 10;
    // 加一是为了有个添加button
    NSInteger count = self.assets.count +1;
    for (int i=0;i < count; i++) {
        float addBtnX = SPACE + (SPACE + img_W) * (i%3);
        float addBtnY = Y + (SPACE + img_W) * (i/3);

        //多算一个frame确定添加按钮的坐标位置
        if (i == self.assets.count) {
            if (i>8) {
                self.photoBtn.hidden = YES;
            }else{
                self.photoBtn.hidden = NO;
                self.photoBtn.frame = CGRectMake(addBtnX, addBtnY, img_W, img_W);
                [self.view addSubview:_photoBtn];
            }
            break;
        }
        
        UIButton *btnImage = [UIButton buttonWithType:UIButtonTypeCustom];
        btnImage.frame = CGRectMake(addBtnX, addBtnY, img_W, img_W);
        btnImage.tag = i;
        UIImage *image = [self.assets[i] thumbImage];
        [btnImage setBackgroundImage:image forState:UIControlStateNormal];
        [self.view addSubview:btnImage];
        [btnImage addTarget:self action:@selector(didSelectPhotoImage:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
}

- (void)didSelectPhotoImage:(UIButton *)btn
{
    // 图片游览器
    ZLPhotoPickerBrowserViewController *pickerBrowser = [[ZLPhotoPickerBrowserViewController alloc] init];
    
    // 淡入淡出效果
    // pickerBrowser.status = UIViewAnimationAnimationStatusFade;
    // 数据源/delegate
    pickerBrowser.delegate = self;
    pickerBrowser.editing = YES;
    pickerBrowser.photos = self.assets;
    // 当前选中的值
    pickerBrowser.currentIndex = btn.tag;
    // 展示控制器
    [pickerBrowser showPickerVc:self];
    
}

#pragma mark - <ZLPhotoPickerBrowserViewControllerDelegate>
- (void)photoBrowser:(ZLPhotoPickerBrowserViewController *)photoBrowser removePhotoAtIndex:(NSInteger)index{
    if (self.assets.count > index) {
        [self.assets removeObjectAtIndex:index];
        [self removeScrollViewSuperViewBtn];
    }
}


#pragma  mark ActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0://手机相册
            [self localPhoto];
            break;
        case 1://拍照
            [self takePhoto];
            break;
        default:
            break;
    }
}
#pragma mark 拍照
- (void)takePhoto
{
    if (self.assets.count >= 9) {
        [self.view showHUDTitleView:@"只能選擇9張圖片上傳" image:nil];
        return;
    }
    
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        //    imagePicker.allowsEditing = YES;
        //拍照
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.videoQuality = UIImagePickerControllerQualityTypeIFrame960x540;
    
        [self presentViewController:imagePicker animated:YES completion:nil];
        
        
    }else
    {
        NSLog(@"模拟其中无法打开照相机,请在真机中使用");
    }
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    image = [image scalingImageByRatio];
    image = [image fixOrientation];//调整图片
    
    //把牌照图片存储到本地
    NSString *path = [SavaData saveImagePath:image];
    NSData *data = UIImageJPEGRepresentation(image, 0.6);
    image = [UIImage imageWithData:data];
    
    ZLPhotoAssets *assets = [[ZLPhotoAssets alloc] init];
    assets.originImage = image;
    assets.assetURL = [NSURL URLWithString:path];
    
    ZLPhotoPickerBrowserPhoto *photo = [[ZLPhotoPickerBrowserPhoto alloc] init];
    photo.asset = assets;
    photo.photoImage = image;
    photo.thumbImage = image;
    photo.photoURL = [NSURL URLWithString:path];
    
    [self.assets addObject:photo];
    
    [self removeScrollViewSuperViewBtn];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
