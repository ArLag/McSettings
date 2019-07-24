/// I removed the DRM because i dont want Pirate repos to find my method
/// Please Credit me if you choose to modify or take code from this
/// Dont forget to drink water













@import Foundation;
@import UIKit;
@import AVFoundation;

#import <UIKit/UIKit.h>
#import <UIKit/UIDevice.h>
#import <Cephei/HBPreferences.h>
@import AVFoundation;

BOOL hasPlayedApp = NO;
AVQueuePlayer *songPlayer = [[AVQueuePlayer alloc] init];
AVPlayerLooper *songLooper;
NSBundle *audio = [NSBundle bundleWithPath:@"/Library/Application Support/minecraft/"];


#define yeet @"/Library/Application Support/minecraft/mc.gif"



///preferences setup

@interface NSUserDefaults (mcsettings)
-(id)objectForKey:(NSString *)key inDomain:(NSString *)domain;
-(void)setObject:(id)value forKey:(NSString *)key inDomain:(NSString *)domain;
@end

static NSString *nsDomainString = @"/var/mobile/Library/Preferences/com.kushy.mcsettings.plist";
static NSString *nsNotificationString = @"com.kushy.mcsettings-prefsreload";

static BOOL TweakEnabled;
static BOOL MusicOn;

static void notificationCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {

  NSNumber *eTweakEnabled = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"enabled" inDomain:nsDomainString];
  NSNumber *musicenabled = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"music" inDomain:nsDomainString];
  TweakEnabled = (eTweakEnabled ) ? [eTweakEnabled boolValue]:YES;
  MusicOn = (musicenabled ) ? [musicenabled boolValue]:YES;
}

%group mcsettings ///Group all hooks so you can easily enable/disable the tweak.



//Set background image of settings
%hook UITableView
-(void)didMoveToWindow {
        %orig;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        UIImage *bgImage = [UIImage imageNamed:@"bgstone.png"];
        self.backgroundView = [[UIImageView alloc] initWithImage: bgImage];
}
%end





%hook UITableViewCell
-(void)layoutSubviews {
        %orig;

        ///play music when tablecells load
if(MusicOn){
            if([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.Preferences"]) {
                AVPlayerItem *song = [AVPlayerItem playerItemWithURL:[audio URLForResource:@"mc" withExtension:@"mp3"]];
                if (!hasPlayedApp) {
                    songLooper = [[AVPlayerLooper alloc] initWithPlayer:songPlayer templateItem:song timeRange:kCMTimeRangeInvalid];
                    songPlayer.volume = 0.3;
                    [songPlayer play];
                    hasPlayedApp = YES;
                }
            }
}

    ///setup TableCells
        [self setBackgroundColor: [UIColor colorWithPatternImage:[UIImage imageNamed:@"wood2.png"]]];
        self.textLabel.textColor =[UIColor whiteColor];
        self.detailTextLabel.textColor = [UIColor whiteColor];
        self.clipsToBounds = YES;

        ///special hook to modify slectioncolor trough ivars
        MSHookIvar<UIColor*>(self, "_selectionTintColor") = [UIColor blackColor];
}
%end



///Color statusbar on iphoneX

%hook _UIStatusBar

@interface _UIStatusBar : UIView
@property (nonatomic, retain) UIColor *foregroundColor;
@end

-(void)layoutSubviews {
        %orig;
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"top.png"]];
        self.foregroundColor = [UIColor whiteColor];
}
%end




%hook UINavigationBar

@interface UINavigationBar (Settings)
-(void)setLargeTitleTextAttributes:(NSDictionary *)arg1;
@end
///clear search blur for Gif
-(void)layoutSubviews {
        %orig;

        [self setBarStyle:UIBarStyleBlack];
        self.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor clearColor]};
        self.tintColor = [UIColor redColor];
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.translucent = YES;


}


///load transparent GIF
-(void)_willMoveToWindow:(id)arg1{
  UIView *xiView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
  xiView.backgroundColor = [UIColor whiteColor];
  UIImage *image1 = [UIImage imageNamed:@"loader/sp00.png"];
  UIImage *image2 = [UIImage imageNamed:@"loader/sp01.png"];
  UIImage *image3 = [UIImage imageNamed:@"loader/sp02.png"];
  UIImage *image4 = [UIImage imageNamed:@"loader/sp03.png"];
  UIImage *image5 = [UIImage imageNamed:@"loader/sp04.png"];
  UIImage *image6 = [UIImage imageNamed:@"loader/sp05.png"];
  UIImage *image7 = [UIImage imageNamed:@"loader/sp06.png"];
  UIImage *image8 = [UIImage imageNamed:@"loader/sp07.png"];
  UIImage *image9 = [UIImage imageNamed:@"loader/sp08.png"];
  UIImage *image10 = [UIImage imageNamed:@"loader/sp09.png"];
  UIImage *image11 = [UIImage imageNamed:@"loader/sp10.png"];
  UIImage *image12 = [UIImage imageNamed:@"loader/sp11.png"];
  UIImage *image13 = [UIImage imageNamed:@"loader/sp12.png"];
  UIImage *image14 = [UIImage imageNamed:@"loader/sp13.png"];
  UIImage *image15 = [UIImage imageNamed:@"loader/sp14.png"];
  UIImage *image16 = [UIImage imageNamed:@"loader/sp15.png"];
  UIImage *image17 = [UIImage imageNamed:@"loader/sp16.png"];
  UIImage *image18 = [UIImage imageNamed:@"loader/sp17.png"];
  UIImage *image19 = [UIImage imageNamed:@"loader/sp18.png"];
  UIImage *image20 = [UIImage imageNamed:@"loader/sp19.png"];
  UIImage *image21 = [UIImage imageNamed:@"loader/sp20.png"];
  UIImage *image22 = [UIImage imageNamed:@"loader/sp21.png"];
  UIImage *image23 = [UIImage imageNamed:@"loader/sp22.png"];
  UIImage *image24 = [UIImage imageNamed:@"loader/sp23.png"];
  UIImage *image25 = [UIImage imageNamed:@"loader/sp24.png"];
  UIImage *image26 = [UIImage imageNamed:@"loader/sp25.png"];
  UIImage *image27 = [UIImage imageNamed:@"loader/sp26.png"];
  UIImage *image28 = [UIImage imageNamed:@"loader/sp27.png"];
  UIImage *image29 = [UIImage imageNamed:@"loader/sp28.png"];
  UIImage *image30 = [UIImage imageNamed:@"loader/sp29.png"];
  UIImage *image31 = [UIImage imageNamed:@"loader/sp30.png"];
  UIImage *image32 = [UIImage imageNamed:@"loader/sp00.png"];


  UIImageView *logo = [[UIImageView alloc] init];
  logo.animationImages = [[NSArray alloc] initWithObjects:image1,image2,image3,image4,image5,image6,image7,image8,image9,image10,image11,image12,image13,image14,image15,image16,image17,image18,image19,image20,image21,image22,image23,image24,image25,image26,image27,image28,image29,image30,image31,image32, nil];
  logo.animationRepeatCount = -1;//Infinite
  [logo startAnimating];
  CGRect currentFrame = self.frame;
  currentFrame.origin.x = 0;
  currentFrame.origin.y = 0;
  self.frame = currentFrame;
  logo.frame = CGRectMake((self.frame.size.width/2) - (250/2), -10, 250, 150);
  logo.layer.masksToBounds = YES;


  [self addSubview:logo];
}
%end




///hide SETTINGS text

@interface _UINavigationBarLargeTitleView: UIView
@end
%hook _UINavigationBarLargeTitleView
-(void)layoutSubviews{
  self.hidden= YES;
}
%end




// Utils
HBPreferences *pfs;
static BOOL hasDisplayedKushy = NO;
static BOOL launchDiscord = NO;

@interface SBLockScreenManager : NSObject
+(instancetype)sharedInstance;
- (_Bool)unlockUIFromSource:(int)arg1 withOptions:(id)arg2;
@end

@interface SBHomeScreenWindow : UIWindow
@end
/// one time notification
%hook UITableViewLabel
-(void)layoutSubviews {

    %orig;
    if(launchDiscord && hasDisplayedKushy) {
      launchDiscord = NO;

        // Launch URL
        NSURL *URL = [NSURL URLWithString: @"https://discordapp.com/invite/E2jeK22"];
          [[UIApplication sharedApplication] openURL:URL options:@{} completionHandler:nil];
    }

 	if(!hasDisplayedKushy){
	  	// Update key
	  	hasDisplayedKushy = YES;
	  	[pfs setBool:hasDisplayedKushy forKey:@"onetimemcsettingsnotification"];

	  	// UIAlert to confirm deletion
	    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Join our discord!" message:@"We are developing a state of the art repo and we need your feedback so join!" preferredStyle:UIAlertControllerStyleAlert];

	    UIAlertAction* yesButton  = [UIAlertAction actionWithTitle:@"Yes, please" style:UIAlertActionStyleDefault handler:^(UIAlertAction* _Nonnull action)
	    {
	    	launchDiscord = YES;
	        [[objc_getClass("SBLockScreenManager") sharedInstance] unlockUIFromSource:17 withOptions:nil];
	    }];


      UIAlertAction* noButton  = [UIAlertAction actionWithTitle:@"Of course but later" style:UIAlertActionStyleDefault handler:^(UIAlertAction* _Nonnull action)
      {
        launchDiscord = NO;
          [[objc_getClass("SBLockScreenManager") sharedInstance] unlockUIFromSource:17 withOptions:nil];
      }];

	    // Add actions
	    [alert addAction:yesButton];
	    [alert addAction:noButton];

	    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];


  	}
}
%end




%end
%ctor {
  pfs = [[HBPreferences alloc] initWithIdentifier:@"com.kushy.mcsettings"];

    // Register preferences
    [pfs registerBool:&hasDisplayedKushy default:NO forKey:@"onetimemcsettingsnotification"];
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
