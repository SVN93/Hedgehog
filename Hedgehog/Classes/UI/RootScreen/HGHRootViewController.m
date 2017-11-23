//
//  ViewController.m
//  Hedgehog
//
//  Created by Vladislav Solovyov on 23/11/2017.
//

#import "HGHRootViewController.h"
#import "HGHRootView.h"
#import "HGHImageTableViewCell.h"
#import "HGHImageCellModel.h"

@interface HGHRootViewController () <UITableViewDataSource, UITableViewDelegate> {
    HGHRootView *_rootView;
    NSArray<HGHImageCellModel *> *_models;
}

@end

@implementation HGHRootViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        NSString *dirPath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"ContentImages"];
        NSError *error;
        NSArray *images = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:dirPath error:&error];
        NSMutableArray<HGHImageCellModel *> *mModels = [NSMutableArray arrayWithCapacity:images.count];
        for (NSString *imageName in images) {
            NSString *imagePath = [dirPath stringByAppendingPathComponent:imageName];
            HGHImageCellModel *model = [[HGHImageCellModel alloc] initWithImagePath:imagePath];
            [mModels addObject:model];
        }
        
        _models = [mModels copy];
    }
    
    return self;
}

- (void)loadView {
    _rootView = [[HGHRootView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = _rootView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _rootView.tableView.dataSource = self;
    _rootView.tableView.delegate = self;
    [_rootView.tableView reloadData];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _models.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    HGHImageTableViewCell *cell = (HGHImageTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[HGHImageTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }

    HGHImageCellModel *model = _models[indexPath.row];
    cell.model = model;
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 300.f;
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(HGHImageTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//}

//- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(HGHImageTableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath {
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
