//
//  HeroTableViewController.m
//  HeroTracker
//
//  Created by Komari Herring on 8/8/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "HeroTableViewController.h"
#import "HeroDetailViewController.h" 
#import "Hero.h"

@interface HeroTableViewController ()

@property NSMutableArray *heroes;

@end

@implementation HeroTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"S.H.I.E.L.D. Hero Tracker";

    self.heroes = [[NSMutableArray alloc] init];

    [self loadHeroes];

}

- (void)loadHeroes
{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"heroes" ofType:@"json"];
    
    
    NSArray *heroesArrayForJSON = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error:nil];
    
    for (NSDictionary *aDict in heroesArrayForJSON)
    {
        
        Hero *aHero = [Hero heroWithDictionary:aDict];
        [self.heroes addObject:aHero];
        
    }
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    
    [self.heroes sortUsingDescriptors:[NSArray arrayWithObject:sort]];
    
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.heroes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HeroCell" forIndexPath:indexPath];
    
    Hero *aHero = self.heroes[indexPath.row];
    
    // Configure the cell...
    cell.textLabel.text = aHero.name;
    cell.detailTextLabel.text = aHero.homeworld;
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    HeroDetailViewController *newHeroVC = [self.storyboard instantiateViewControllerWithIdentifier:@"HeroDetailVC"];
    
    [[self navigationController] pushViewController:newHeroVC animated:YES];
    
    Hero *selectedHero = self.heroes[indexPath.row];
    
    newHeroVC.hero = selectedHero;
    
    
    
}


@end
