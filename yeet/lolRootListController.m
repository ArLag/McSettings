#include "lolRootListController.h"
#import <spawn.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>
#import <Cephei/HBPreferences.h>
#include "NSTask.h"


@implementation lolRootListController

UIWebView *webView;


- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}




- (void)viewDidLayoutSubviews
{
	[super viewDidLayoutSubviews];

	CGRect wrapperFrame = ((UIView *)self.table.subviews[0]).frame; // UITableViewWrapperView
	CGRect frame = CGRectMake(wrapperFrame.origin.x, self.table.tableHeaderView.frame.origin.y, wrapperFrame.size.width, self.table.tableHeaderView.frame.size.height);

	self.table.tableHeaderView.frame = frame;
}



- (void)respring {
    NSTask *t = [[[NSTask alloc] init] autorelease];
    [t setLaunchPath:@"/usr/bin/killall"];
    [t setArguments:[NSArray arrayWithObjects:@"SpringBoard", nil]];
    [t launch];
}


- (IBAction)twitterkushy {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://twitter.com/kushdabush"]];
}

- (IBAction)renovare {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"cydia://package/com.kushy.renovare"]];
}



- (instancetype)init {
    self = [super init];

    if (self) {
        HBAppearanceSettings *appearanceSettings = [[HBAppearanceSettings alloc] init];
        appearanceSettings.tableViewCellSeparatorColor = [UIColor colorWithWhite:0 alpha:0];
        appearanceSettings.tintColor = [UIColor blackColor];
        self.hb_appearanceSettings = appearanceSettings;
    }

    return self;
}
@end
