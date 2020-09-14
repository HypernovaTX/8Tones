//
//  GMShare.h
//  GMShare
//
//  Created by Benoît Rouleau on 2014-12-07.
//
//

#import <Foundation/Foundation.h>
#import <Social/Social.h>
#import <MessageUI/MessageUI.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface GMShare : NSObject <MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate>

- (void)share_init;
- (void)share_text:(NSString *)text;
- (void)share_text_ext:(NSString *)text :(NSString *)subject :(NSString *)email;
- (void)share_url:(NSString *)url;
- (void)share_image:(NSString *)filename;
- (void)share_file:(NSString *)filename;
- (void)share_set_popover_origin:(int)x :(int)y;
- (void)share_set_popover_region:(int)x :(int)y :(int)width :(int)height;
- (void)share_set_dialog_title:(NSString *)title;
- (int)share_did_finish;
- (int)share_get_completed;
- (int)share_get_chosen_activity;
- (NSString *)share_get_chosen_activity_string;
- (void)share_ext_prepare;
- (void)share_ext_add_text:(NSString *)text;
- (void)share_ext_add_url:(NSString *)url;
- (void)share_ext_add_image:(NSString *)filename;
- (void)share_ext_add_file:(NSString *)filename;
- (void)share_ext_set_activity:(int)activityType;
- (void)share_ext_exclude_activity:(int)activityType;
- (void)share_ext_set_subject:(NSString *)subject;
- (void)share_ext_add_recipient:(NSString *)email;
- (void)share_ext_set_body_is_html:(int)isHTML;
- (int)share_ext_launch;

- (NSString *)activityTypeIntToString:(int)activityTypeInt;
- (int)activityTypeStringToInt:(NSString *)activityTypeString;
- (void)showActivityViewControllerWithItem:(NSObject *)sharedItem;
- (void)showActivityViewControllerWithItems:(NSMutableArray *)sharedItems useExt:(BOOL)useExt;
- (NSString *)getFilePath:(NSString *)filename;
- (NSDictionary *)createImageDictionaryWithFile:(NSString *)filename;
- (NSString *)getMIMETypeOfFile:(NSString *)path;

@end