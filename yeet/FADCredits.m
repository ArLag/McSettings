#include "FADCredits.h"
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>
#import <Cephei/HBPreferences.h>
#import <spawn.h>

@implementation FADCredits
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Credits" target:self] retain];
	}

	return _specifiers;
}

- (instancetype)init {
    self = [super init];

    if (self) {
        HBAppearanceSettings *appearanceSettings = [[HBAppearanceSettings alloc] init];
        appearanceSettings.tableViewCellSeparatorColor = [UIColor colorWithWhite:0 alpha:0];
        appearanceSettings.tintColor = [UIColor colorWithRed:200.f / 255.f green:33.f / 255.f blue:129.f / 255.f alpha:1];
        self.hb_appearanceSettings = appearanceSettings;
    }

    return self;
}
@end
