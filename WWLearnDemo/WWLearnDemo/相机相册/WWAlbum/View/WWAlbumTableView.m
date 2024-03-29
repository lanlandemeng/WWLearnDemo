//
//  WWAlbumTableView.m
//  WWLearnDemo
//
//  Created by wwchao on 2019/11/25.
//  Copyright © 2019 wwchao. All rights reserved.
//

#import "WWAlbumTableView.h"
#import "WWAlbumTableViewCell.h"

@interface WWAlbumTableView() <UITableViewDelegate, UITableViewDataSource>

@end

static NSString *albumTableViewCell = @"LYFAlbumTableViewCell";

@implementation WWAlbumTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        [self setupTableView];
    }
    
    return self;
}

#pragma mark - 设置tableView
-(void)setupTableView {
    [self registerClass:[WWAlbumTableViewCell class] forCellReuseIdentifier:albumTableViewCell];
    
    self.delegate = self;
    self.dataSource = self;
    
    self.tableFooterView = [UIView new];
}

#pragma mark - Set方法
-(void)setAssetCollectionList:(NSMutableArray<WWAlbumModel *> *)assetCollectionList {
    _assetCollectionList = assetCollectionList;
    
    [self reloadData];
}

#pragma mark - UITableViewDataSource / UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.assetCollectionList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   WWAlbumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:albumTableViewCell];
    
    cell.row = indexPath.row;
    cell.albumModel = self.assetCollectionList[indexPath.row];
    [cell loadImage:indexPath];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.selectAction) {
        self.selectAction(self.assetCollectionList[indexPath.row]);
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.f;
}

@end

