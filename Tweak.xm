
#import <UIKit/UIKit.h>

#import <QuartzCore/QuartzCore.h>
#define brownsh [UIColor colorWithRed:0.49 green:0.33 blue:0.22 alpha:1.0]
#define txtcolor [UIColor whiteColor]
@interface PSTableCell : UITableView
@end


@interface _UIVisualEffectSubview : UIView
@end
@interface _UIBarBackground : UIView
@end
@interface WFAssociationStateView : UIView
@end


@interface _UITableViewCellSeperatorView : UIView
@end
@interface _UINavigationBarLargeTitleView : UIView
@end
@interface UITableViewLabel : UILabel
@end
@interface _UITableViewHeaderFooterViewLabel : UILabel
@end

@interface NSUserDefaults (mcsettings)
-(id)objectForKey:(NSString *)key inDomain:(NSString *)domain;
-(void)setObject:(id)value forKey:(NSString *)key inDomain:(NSString *)domain;
@end

static NSString *nsDomainString = @"/var/mobile/Library/Preferences/com.kushy.mcsettings.plist";
static NSString *nsNotificationString = @"com.kushy.mcsettings-prefsreload";

static BOOL TweakEnabled;

static void notificationCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {

  NSNumber *eTweakEnabled = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"enabled" inDomain:nsDomainString];

  TweakEnabled = (eTweakEnabled ) ? [eTweakEnabled boolValue]:YES;

}

%group mcsettings
%hook UILabel
-(void)didMoveToWindow {
%orig;
    self.textColor = txtcolor;
    self.font = [UIFont fontWithName:@"ChalkboardSE-Bold" size:15];

}
%end
%hook _UITableViewHeaderFooterViewLabel

-(void)didMoveToWindow {
%orig;
    self.textColor = txtcolor;
    self.font = [UIFont fontWithName:@"ChalkboardSE-Bold" size:8];

}


%end

%hook WFAssociationStateView

-(void)layoutSubviews {
  %orig;
  self.backgroundColor = [UIColor clearColor];
}


%end


/*
%hook PreferencesAppController
-(void)applicationDidBecomeActive {
%orig;

NSString *soundFilePath = [NSString stringWithFormat:@"%@minecraft.mp3",[[NSBundle mainBundle] resourcePath]];
NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];

AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
player.numberOfLoops = -1; //Infinite

[player play];

}


%end
*/
/*
%hook UITableViewCellContentView

- (id)initWithTitle:(id)arg1 image:(id)arg2{
  NSBundle *tweakBundle = [NSBundle bundleWithPath:@"Applications/Preferences.app"];
  NSString *sources = [tweakBundle localizedStringForKey:@"QUICKACTION_WIFI" value:@"" table:nil];


 if([arg1 isEqualToString: @"Wifi"]) {
return %orig(@"gay",[UIImage imageNamed:@"cloud.png"]);
} else {
return %orig;
}
}
%end


*/


%hook UITableView



-(void) layoutSubviews {
  %orig;

  self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgstone.png"]];

}

-(void)setSeparatorEffect:(id)arg1
{
  %orig(0);
}

-(id)separatorEffect
{
  return 0;
}

%end

%hook _UITableViewCellSeperatorView
-(void) layoutSubviews {
  %orig;
  self.hidden = YES;

}



%end
%hook UINavigationBar

-(void) layoutSubviews {
  %orig;
  self.backgroundColor = [UIColor clearColor];

}



%end

%hook UITableViewCell

-(void)layoutSubviews{
  %orig;

  self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wood2.png"]];
}



%end
%hook _UIBarBackground

-(void) layoutSubviews {
  %orig;
  self.hidden = YES;

}



%end

%hook UITableViewLabel


-(UIColor *)textColor {

return txtcolor;

}
%end

%hook _UINavigationBarLargeTitleView


-(void)layoutSubviews {
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"mc.png"]];
}


%end

%hook UITableViewLabel


-(void)didMoveToWindow {

  self.textColor = txtcolor;
self.font = [UIFont fontWithName:@"ChalkboardSE-Bold" size:15];

}
%end

%hook PSTableCell

-(void) didMoveToWindow {
  %orig;
  self.separatorStyle = UITableViewCellSeparatorStyleNone;
  self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wood2.png"]];

}

-(void)layoutSubviews{
  %orig;

  self.separatorStyle = UITableViewCellSeparatorStyleNone;
}

%end

@interface PSListController :UITableView
@property (assign,nonatomic) BOOL edgeToEdgeCells;

-(void)setEdgeToEdgeCells:(BOOL)arg1;


@end



%hook PSListController


-(void) setEdgeToEdgeCells:(bool)arg1 {
%orig(NO); }

-(bool) _isRegularWidth {

    return NO;

}
%end

%hook _UIVisualEffectSubview


-(void) layoutSubviews {
  %orig;
  self.backgroundColor = [UIColor clearColor];

}

%end
%end
%ctor {

  notificationCallback(NULL, NULL, NULL, NULL, NULL);
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
    NULL,
    notificationCallback,
    (CFStringRef)nsNotificationString,
    NULL,
    CFNotificationSuspensionBehaviorCoalesce);
    if(TweakEnabled) {
       %init(mcsettings);
     }
  }
