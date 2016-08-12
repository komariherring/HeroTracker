//
//  ViewController.m
//  HeroTracker
//
//  Created by Komari Herring on 7/25/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "HeroDetailViewController.h"

@interface HeroDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *heroNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *heroHomeWorldLabel;
@property (weak, nonatomic) IBOutlet UILabel *heroPowersLabel;
@property (weak, nonatomic) IBOutlet UIImageView *heroImageView;

- (void)configureView;
@end

@implementation HeroDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Managing the detail view
- (void)setHero:(Hero *)newHero
{
    if (_hero != newHero)
    {
        _hero = newHero;
        
        [self configureView]; 
    }
}

#pragma mark - Configure the view

- (void)configureView
{
    if (self.hero)
    {
        self.title = [NSString stringWithFormat:@"HERO"];
        
        self.heroNameLabel.text = self.hero.name;
        
        self.heroHomeWorldLabel.text = self.hero.homeworld;
        
        self.heroPowersLabel.text = self.hero.powers;
        
        self.heroImageView.image = [UIImage imageNamed:self.hero.imageName];
    }
}
@end
