//
//  ArrayTableViewController.m
//  scout-viewer-2016-iOS
//
//  Created by Citrus Circuits on 2/8/15.
//  Copyright (c) 2016 Citrus Circuits. All rights reserved.
//

#import "ArrayTableViewController.h"
#import "config.h"
#import "MultiCellTableViewCell.h"
#import "UINavigationController+SGProgress.h"
#import "AppDelegate.h"
#import "ios_viewer-Swift.h"

@interface ArrayTableViewController ()


@property (strong, nonatomic) NSMutableDictionary *highlighteds;

@end

@interface NSMutableArray ()

@end

@implementation ArrayTableViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    self.firebaseFetcher = [AppDelegate getAppDelegate].firebaseFetcher;
    self.lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGesture:)];
    self.lpgr.minimumPressDuration = .70;
    [self.tableView addGestureRecognizer:self.lpgr];
    
    self.tableView.estimatedRowHeight = 100;
    [self.tableView registerNib:[UINib nibWithNibName:[self cellIdentifier] bundle:nil] forCellReuseIdentifier:[self cellIdentifier]];
    if(self.searchbarIsEnabled) {
        self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
        self.searchController.searchResultsUpdater = self;
        self.searchController.dimsBackgroundDuringPresentation = NO;
        self.searchController.searchBar.delegate = self;
        if(self.keyboardType) {
            self.searchController.searchBar.keyboardType = *(self.keyboardType);
        } else {
            self.searchController.searchBar.keyboardType = UIKeyboardTypeAlphabet;
        }
        self.searchController.searchBar.scopeButtonTitles = [self scopeButtonTitles];
        self.searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x, self.searchController.searchBar.frame.origin.y, self.searchController.searchBar.frame.size.width, 44.0);
        self.tableView.tableHeaderView = self.searchController.searchBar;
    }
    [self setUpAppConnectionsDidLoad];
    
    
    self.definesPresentationContext = YES;
    
    [self.tableView reloadData];
    
    self.highlighteds = [[NSMutableDictionary alloc] init];
}

- (BOOL)searchbarIsEnabled {
    if(_searchbarIsEnabled) {
        return _searchbarIsEnabled;
    }
    return true;
}

- (void)setUpAppConnectionsDidLoad {
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(databaseUpdated:) name:SCOUT_VIEWER_DATABASE_UPDATE object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(databaseUpdated:) name:@"updateLeftTable" object:nil];
}

- (void)setUpAppConnectionsDidAppear {
    
}
-(void)setcurrentNumber:(NSInteger)currentNumber {
    self.currentNumber = currentNumber;
    NSDictionary *infoDict = @{@"currentNum":[NSNumber numberWithInt:currentNumber]};
    NSNotification *note = [[NSNotification alloc] initWithName:@"lpgrTriggered" object:nil userInfo:infoDict];
    [[NSNotificationCenter defaultCenter] postNotification:note];
}


- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSString *searchString = searchController.searchBar.text;
    [self.highlighteds setObject:searchString forKey:@(searchController.searchBar.selectedScopeButtonIndex)];
    if([searchString length] > 0) {
        self.filteredArray = [self filteredArrayForSearchText:searchString inScope:searchController.searchBar.selectedScopeButtonIndex];
    } else {
        self.filteredArray = nil;
    }
    
    [self.tableView reloadData];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        [self.tableView setNeedsDisplay];
    });
}

// Should be overridden in subclasses
- (NSArray *)filteredArrayForSearchText:(NSString *)text inScope:(NSInteger)scope
{
    return @[];
}



- (void) databaseUpdated:(NSNotification *)note {
    NSLog(@"We hit another update");
    [self refreshData:nil];
    
}

- (void) viewDidLayoutSubview {
    [self.searchController.searchBar sizeToFit];
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self setUpAppConnectionsDidAppear];
    self.dataArray = [self loadDataArray:NO];
    self.filteredArray = nil;
    [self.tableView reloadData];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    if(self.filteredArray) {
        return self.filteredArray.count;
    } else {
        return self.dataArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self cellIdentifier] forIndexPath:indexPath];
    
    id data = nil;
    
    if (self.filteredArray) {
        data = self.filteredArray[indexPath.row];
    } else {
        data = self.dataArray[indexPath.row];
    }
    
    [self configureCell:cell atIndexPath:indexPath forData:data inTableView:tableView];
    
    return cell;
}


//Should be overridden by child classes
- (NSString *)cellIdentifier
{
    return nil;
}

//Should be overriden by child classes
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)path forData:(id)data inTableView:(UITableView *)tableView
{
    //Do nothing
}

//Should be overridden by subclasses
-(NSArray *) loadDataArray:(BOOL)shouldForce
{
    return nil;
}


-(IBAction)refreshData:(UIRefreshControl *)refreshControl
{
    //Write code to refresh Matches
    self.dataArray = [self loadDataArray:YES];
    //self.filteredArray = nil;
    if(self.searchController.searchBar.text.length > 0) {
        self.filteredArray = [self filteredArrayForSearchText:self.searchController.searchBar.text inScope:self.searchController.searchBar.selectedScopeButtonIndex];
    }
    [self.tableView reloadData];
    //[refreshControl endRefreshing];
}

//Should be overridden in child files
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //Do nothing
}

//Override in subclasses
- (NSArray *)scopeButtonTitles {
    return nil;
}

- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
{
    [self updateSearchResultsForSearchController:self.searchController];
}

- (NSString *)highlightedStringForScope {
    return [self.highlighteds objectForKey:@(self.searchController.searchBar.selectedScopeButtonIndex)];
}

- (NSInteger)currentScope {
    return self.searchController.searchBar.selectedScopeButtonIndex;
}

//Should be overridden in child files
- (NSString *)notificationName {
    return @"updatedLeftTable";
}
//Should be overridden
-(void)handleLongPressGesture:(UILongPressGestureRecognizer *)sender {
    
}


@end
