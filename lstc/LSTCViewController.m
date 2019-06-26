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
#import "LSTableViewCellFrame.h"

@interface LSTCViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong)NSMutableArray *cellFramesArray;

@end

@implementation LSTCViewController

- (NSMutableArray *)cellFramesArray{
    if (!_cellFramesArray) {
        _cellFramesArray = [NSMutableArray array];
    }
    return _cellFramesArray;
}

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
    return self.cellFramesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LSTableViewCell *cell = [LSTableViewCell cellForTableView:tableView];
    cell.cellFrame = self.cellFramesArray[indexPath.row];
    return cell;
}

#pragma mark - delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    LSTableViewCellFrame *cellframe = self.cellFramesArray[indexPath.row];
    return cellframe.cellHeight;
}

#pragma mark - loadData
- (void)loadData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://capi.douyucdn.cn/api/v1/getColumnDetail?shortName=PCgame" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) { 
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([responseObject[@"error"] integerValue] ==0) {
                NSMutableArray *tempArray = [NSMutableArray array];
                for (NSDictionary *dic in responseObject[@"data"]) {
                    LSTCModel *model = [LSTCModel mj_objectWithKeyValues:dic];
                    LSTableViewCellFrame *cellFrame = [[LSTableViewCellFrame alloc] init];
                    cellFrame.tcmodel = model;
                    [tempArray addObject:cellFrame];
                }
                self.cellFramesArray = [tempArray copy];
                [self.tableView reloadData];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error.description);
    }];
}

@end
