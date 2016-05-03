//
//  ViewController.m
//  SLAlterView
//
//  Created by 收付宝－胜利 on 16/5/3.
//  Copyright © 2016年 胜利_Terry. All rights reserved.
//

#import "ViewController.h"
#import "ShowTitleView.h"

@interface ViewController ()
<UITableViewDelegate,
 UITableViewDataSource> {
    
    UITableView *_tableView;
}

@property (nonatomic, copy) ShowTitleView *tableShowTitle;  //!< 提示信息

@end

@implementation ViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    
    [self.view addSubview:_tableView];
    
    
    [NSTimer scheduledTimerWithTimeInterval:2 target:self
                                   selector:@selector(show:)
                                   userInfo:nil
                                    repeats:NO];
}

- (void)show:(NSTimer *)timer {
    
    NSString *txt = @"请求失败或数据为空";
    
    [self.tableShowTitle showBtnAndTitleWithView:self.view
                                            text:txt
                                          view_y:180
                                          action:@selector(go)
                                          target:self
                                        isHidden:NO];
}

- (void)go {
    
    NSLog(@"___________");
    
    /**
     *  这个方法只有没有数据或请求失败的时候使用，不是点击就隐藏
     *  现在只是为了测试。
     */
    [self.tableShowTitle hiddenBtnAndTitleView:YES];
    
    //这里可以重新请求接口数据 然后刷新表格
}

- (ShowTitleView *)tableShowTitle {
    
    if (!_tableShowTitle) {
        
        ShowTitleView *title = [[ShowTitleView alloc] init];
        _tableShowTitle = title;
    }
    return _tableShowTitle;
}

#pragma mark ------------ UITableView delegate / dataSource ----------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 45;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cell_id = @"cell_id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cell_id];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"hello cell %zd",indexPath.row + 1];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  {
    
        ///点击后移动 tableviewCell
    [tableView scrollToRowAtIndexPath:indexPath
                     atScrollPosition:UITableViewScrollPositionMiddle
                             animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
