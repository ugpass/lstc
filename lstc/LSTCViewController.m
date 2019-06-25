//
//  LSTCViewController.m
//  lstc
//
//  Created by William on 2019/6/24.
//  Copyright © 2019 ls. All rights reserved.
//

#import "LSTCViewController.h"
#import "LSTCModel.h"
#import "LSTableViewCell.h"

@interface LSTCViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong)NSArray *dataSource;

@end

@implementation LSTCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //runloop监听 空闲时计算高度
    /*CFRunLoopRef runloop = CFRunLoopGetCurrent();
    CFRunLoopMode runloopMode = kCFRunLoopDefaultMode;
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopBeforeWaiting, true, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        
    });
    CFRunLoopAddObserver(runloop, observer, runloopMode);
    
    CFRunLoopRemoveObserver(runloop, observer, runloopMode);
    CFRelease(observer);
    */
    [self.view addSubview:self.tableView];
    [self loadData];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.frame = self.view.bounds;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

#pragma mark - dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LSTCModel *model = self.dataSource[indexPath.row];
    LSTableViewCell *cell = [LSTableViewCell cellForTableView:tableView model:model];
     
    return cell;
}

#pragma mark - delegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath NS_AVAILABLE_IOS(6_0){
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    LSTCModel *model = self.dataSource[indexPath.row];
    return model.cellHeight;
}

#pragma mark - loadData
- (void)loadData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://capi.douyucdn.cn/api/v1/getColumnDetail?shortName=PCgame" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([responseObject[@"error"] integerValue] ==0) {
                self.dataSource = [LSTCModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
                NSLog(@"respon=%@",self.dataSource);
                [self.tableView reloadData];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error.description);
    }];
}

@end
