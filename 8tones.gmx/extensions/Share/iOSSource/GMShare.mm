//
//  GMShare.m
//  GMShare
//
//  Created by Benoît Rouleau on 2014-12-07.
//
//

#import "GMShare.h"

static UIViewController *gmshare_rootViewController;
static BOOL gmshare_enabled = NO;
static BOOL gmshare_popoverUseRegion = NO;
static int gmshare_popoverX = 0;
static int gmshare_popoverY = 0;
static int gmshare_popoverRegionX = 0;
static int gmshare_popoverRegionY = 0;
static int gmshare_popoverRegionWidth = 0;
static int gmshare_popoverRegionHeight = 0;
static NSString *gmshare_subject = @"";
static NSString *gmshare_temporarySubject = @"";
static NSMutableArray *gmshare_activityTypes;
static BOOL gmshare_didFinish = NO;
static BOOL gmshare_completed = NO;
static int gmshare_chosenActivityType = -1;
static NSString *gmshare_chosenActivityTypeString = @"";
static NSMutableArray *gmshare_sharedItems;
static int gmshare_useActivityType = -1;
static NSMutableArray *gmshare_excludedActivityTypes;
static NSMutableArray *gmshare_recipients;
static BOOL gmshare_bodyIsHTML = NO;

@implementation GMShare

- (void)share_init {
    //NSLog(@"share_init");
    gmshare_rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    gmshare_popoverX = gmshare_rootViewController.view.frame.size.width / 2;
    gmshare_popoverY = gmshare_rootViewController.view.frame.size.height / 2;
    gmshare_activityTypes = [NSMutableArray new];
    if (NSFoundationVersionNumber >= NSFoundationVersionNumber_iOS_6_0) {
        gmshare_enabled = YES;
        [gmshare_activityTypes addObject:UIActivityTypePostToFacebook];
        [gmshare_activityTypes addObject:UIActivityTypePostToTwitter];
        [gmshare_activityTypes addObject:UIActivityTypePostToWeibo];
        [gmshare_activityTypes addObject:UIActivityTypeMessage];
        [gmshare_activityTypes addObject:UIActivityTypeMail];
        [gmshare_activityTypes addObject:UIActivityTypePrint];
        [gmshare_activityTypes addObject:UIActivityTypeCopyToPasteboard];
        [gmshare_activityTypes addObject:UIActivityTypeAssignToContact];
        [gmshare_activityTypes addObject:UIActivityTypeSaveToCameraRoll];
    }
    if (NSFoundationVersionNumber >= NSFoundationVersionNumber_iOS_7_0) {
        [gmshare_activityTypes addObject:UIActivityTypeAddToReadingList];
        [gmshare_activityTypes addObject:UIActivityTypePostToFlickr];
        [gmshare_activityTypes addObject:UIActivityTypePostToVimeo];
        [gmshare_activityTypes addObject:UIActivityTypePostToTencentWeibo];
        [gmshare_activityTypes addObject:UIActivityTypeAirDrop];
    }
    gmshare_sharedItems = [NSMutableArray new];
    gmshare_excludedActivityTypes = [NSMutableArray new];
    gmshare_recipients = [NSMutableArray new];
}

- (void)share_text:(NSString *)text {
    //NSLog(@"share_text");
    if (gmshare_enabled) {
        [self showActivityViewControllerWithItem:text];
    }
}

- (void)share_text_ext:(NSString *)text :(NSString *)subject :(NSString *)email {
    //NSLog(@"share_text_ext");
    if (gmshare_enabled) {
        gmshare_temporarySubject = subject;
        [self showActivityViewControllerWithItem:text];
    }
}

- (void)share_url:(NSString *)url {
    //NSLog(@"share_url");
    if (gmshare_enabled) {
        [self showActivityViewControllerWithItem:[NSURL URLWithString:url]];
    }
}

- (void)share_image:(NSString *)filename {
    //NSLog(@"share_image");
    if (gmshare_enabled) {
        NSDictionary *imageDict = [self createImageDictionaryWithFile:filename];
        if (imageDict != nil) {
            [self showActivityViewControllerWithItem:imageDict];
        }
    }
}

- (void)share_file:(NSString *)filename {
    //NSLog(@"share_file");
    if (gmshare_enabled) {
        [self showActivityViewControllerWithItem:[NSURL fileURLWithPath:[self getFilePath:filename]]];
    }
}

- (void)share_set_popover_origin:(int)x :(int)y {
    //NSLog(@"share_set_popover_origin");
    if (gmshare_enabled) {
        gmshare_popoverUseRegion = NO;
        gmshare_popoverX = x;
        gmshare_popoverY = y;
    }
}

- (void)share_set_popover_region:(int)x :(int)y :(int)width :(int)height {
    //NSLog(@"share_set_popover_region");
    if (gmshare_enabled) {
        gmshare_popoverUseRegion = YES;
        gmshare_popoverRegionX = x;
        gmshare_popoverRegionY = y;
        gmshare_popoverRegionWidth = width;
        gmshare_popoverRegionHeight = height;
    }
}

- (void)share_set_dialog_title:(NSString *)title {
    //NSLog(@"share_set_dialog_title");
}

- (int)share_did_finish {
    //NSLog(@"share_did_finish");
    if (gmshare_didFinish) {
        gmshare_didFinish = NO;
        return 1;
    }
    return 0;
}

- (int)share_get_completed {
    //NSLog(@"share_get_completed");
    if (gmshare_completed) {
        return 1;
    }
    return 0;
}

- (int)share_get_chosen_activity {
    //NSLog(@"share_get_chosen_activity");
    return gmshare_chosenActivityType;
}

- (NSString *)share_get_chosen_activity_string {
    //NSLog(@"share_get_chosen_activity_string");
    return gmshare_chosenActivityTypeString;
}

- (void)share_ext_prepare {
    //NSLog(@"share_ext_prepare");
    if (gmshare_enabled) {
        [gmshare_sharedItems removeAllObjects];
        gmshare_useActivityType = -1;
        [gmshare_excludedActivityTypes removeAllObjects];
        gmshare_subject = @"";
        [gmshare_recipients removeAllObjects];
        gmshare_bodyIsHTML = NO;
    }
}

- (void)share_ext_add_text:(NSString *)text {
    //NSLog(@"share_ext_add_text");
    if (gmshare_enabled) {
        [gmshare_sharedItems addObject:text];
    }
}

- (void)share_ext_add_url:(NSString *)url {
    //NSLog(@"share_ext_add_url");
    if (gmshare_enabled) {
        [gmshare_sharedItems addObject:[NSURL URLWithString:url]];
    }
}

- (void)share_ext_add_image:(NSString *)filename {
    //NSLog(@"share_ext_add_image");
    if (gmshare_enabled) {
        NSDictionary *imageDict = [self createImageDictionaryWithFile:filename];
        if (imageDict != nil) {
            [gmshare_sharedItems addObject:imageDict];
        }
    }
}

- (void)share_ext_add_file:(NSString *)filename {
    //NSLog(@"share_ext_add_file");
    if (gmshare_enabled) {
        [gmshare_sharedItems addObject:[NSURL fileURLWithPath:[self getFilePath:filename]]];
    }
}

- (void)share_ext_set_activity:(int)activityType {
    //NSLog(@"share_ext_set_activity");
    if (gmshare_enabled) {
        gmshare_useActivityType = activityType;
    }
}

- (void)share_ext_exclude_activity:(int)activityType {
    //NSLog(@"share_ext_exclude_activity");
    if (gmshare_enabled) {
        NSString *activityTypeString = [self activityTypeIntToString:activityType];
        if ([activityTypeString length] > 0) {
            [gmshare_excludedActivityTypes addObject:activityTypeString];
        }
    }
}

- (void)share_ext_set_subject:(NSString *)subject {
    //NSLog(@"share_ext_set_subject");
    if (gmshare_enabled) {
        gmshare_subject = subject;
    }
}

- (void)share_ext_add_recipient:(NSString *)email {
    //NSLog(@"share_ext_add_recipient");
    if (gmshare_enabled) {
        [gmshare_recipients addObject:email];
    }
}

- (void)share_ext_set_body_is_html:(int)isHTML {
    //NSLog(@"share_ext_set_body_is_html");
    if (gmshare_enabled) {
        gmshare_bodyIsHTML = NO;
        if (isHTML == 1) {
            gmshare_bodyIsHTML = YES;
        }
    }
}

- (int)share_ext_launch {
    //NSLog(@"share_ext_launch");
    if (!gmshare_enabled) {
        return 0;
    }
    gmshare_didFinish = NO;
    gmshare_completed = NO;
    gmshare_chosenActivityType = -1;
    gmshare_chosenActivityTypeString = @"";
    NSString *activityType = [self activityTypeIntToString:gmshare_useActivityType];
    if ([activityType isEqualToString:UIActivityTypePostToFacebook] ||
        [activityType isEqualToString:UIActivityTypePostToTwitter] ||
        [activityType isEqualToString:UIActivityTypePostToWeibo]) {
        NSString *serviceType = nil;
        if ([activityType isEqualToString:UIActivityTypePostToFacebook]) {
            serviceType = SLServiceTypeFacebook;
        }
        else if ([activityType isEqualToString:UIActivityTypePostToTwitter]) {
            serviceType = SLServiceTypeTwitter;
        }
        else if ([activityType isEqualToString:UIActivityTypePostToWeibo]) {
            serviceType = SLServiceTypeSinaWeibo;
        }
        SLComposeViewController *composeViewController = [SLComposeViewController composeViewControllerForServiceType:serviceType];
        NSMutableArray *textItems = [NSMutableArray new];
        for (id obj in gmshare_sharedItems) {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                [composeViewController addImage:obj[@"image"]];
            }
            else if ([obj isKindOfClass:[NSURL class]]) {
                [composeViewController addURL:obj];
            }
            else {
                [textItems addObject:obj];
            }
        }
        if (textItems.count > 0) {
            [composeViewController setInitialText:[textItems componentsJoinedByString:@"\n"]];
        }
        [composeViewController setCompletionHandler:^(SLComposeViewControllerResult result) {
            gmshare_didFinish = YES;
            gmshare_completed = NO;
            if (result == SLComposeViewControllerResultDone) {
                gmshare_completed = YES;
            }
            gmshare_chosenActivityType = [self activityTypeStringToInt:activityType];
            gmshare_chosenActivityTypeString = activityType;
        }];
        [gmshare_rootViewController presentViewController:composeViewController animated:YES completion:nil];
    }
    else if ([activityType isEqualToString:UIActivityTypeMessage]) {
        if (![MFMessageComposeViewController canSendText]) {
            return 0;
        }
        MFMessageComposeViewController *composeViewController = [[MFMessageComposeViewController alloc] init];
        composeViewController.messageComposeDelegate = self;
        composeViewController.recipients = [gmshare_recipients copy];
        if (gmshare_subject.length > 0) {
            composeViewController.subject = gmshare_subject;
        }
        NSMutableArray *textItems = [NSMutableArray new];
        for (id obj in gmshare_sharedItems) {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                NSData *imageData = nil;
                if ([obj[@"type"] isEqualToString:(NSString *)kUTTypeJPEG]) {
                    imageData = UIImageJPEGRepresentation(obj[@"image"], 1);
                }
                else {
                    imageData = UIImagePNGRepresentation(obj[@"image"]);
                }
                [composeViewController addAttachmentData:imageData typeIdentifier:(NSString *)obj[@"type"] filename:obj[@"filename"]];
            }
            else if ([obj isKindOfClass:[NSURL class]]) {
                if ([obj isFileURL]) {
                    [composeViewController addAttachmentURL:obj withAlternateFilename:nil];
                }
                else {
                    [textItems addObject:[obj absoluteString]];
                }
            }
            else {
                [textItems addObject:obj];
            }
        }
        if (textItems.count > 0) {
            composeViewController.body = [textItems componentsJoinedByString:@"\n"];
        }
        [gmshare_rootViewController presentViewController:composeViewController animated:YES completion:nil];
    }
    else if ([activityType isEqualToString:UIActivityTypeMail]) {
        if (![MFMailComposeViewController canSendMail]) {
            return 0;
        }
        MFMailComposeViewController *composeViewController = [[MFMailComposeViewController alloc] init];
        composeViewController.mailComposeDelegate = self;
        [composeViewController setToRecipients:[gmshare_recipients copy]];
        [composeViewController setSubject:gmshare_subject];
        NSMutableArray *textItems = [NSMutableArray new];
        for (id obj in gmshare_sharedItems) {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                NSData *imageData = nil;
                NSString *mimeType = @"";
                if ([obj[@"type"] isEqualToString:(NSString *)kUTTypeJPEG]) {
                    imageData = UIImageJPEGRepresentation(obj[@"image"], 1);
                    mimeType = @"image/jpeg";
                }
                else {
                    imageData = UIImagePNGRepresentation(obj[@"image"]);
                    mimeType = @"image/png";
                }
                [composeViewController addAttachmentData:imageData mimeType:mimeType fileName:obj[@"filename"]];
            }
            else if ([obj isKindOfClass:[NSURL class]]) {
                if ([obj isFileURL]) {
                    NSData *fileData = [[NSFileManager defaultManager] contentsAtPath:[obj path]];
                    [composeViewController addAttachmentData:fileData mimeType:[self getMIMETypeOfFile:[obj absoluteString]] fileName:[[obj absoluteString] lastPathComponent]];
                }
                else {
                    [textItems addObject:[obj absoluteString]];
                }
            }
            else {
                [textItems addObject:obj];
            }
        }
        if (textItems.count > 0) {
            [composeViewController setMessageBody:[textItems componentsJoinedByString:@"\n"] isHTML:gmshare_bodyIsHTML];
        }
        [gmshare_rootViewController presentViewController:composeViewController animated:YES completion:nil];
    }
    else {
        [self showActivityViewControllerWithItems:gmshare_sharedItems useExt:YES];
    }
    return 1;
}

- (NSString *)activityTypeIntToString:(int)activityTypeInt {
    if (activityTypeInt < 0) {
        return @"";
    }
    return gmshare_activityTypes[activityTypeInt];
}

- (int)activityTypeStringToInt:(NSString *)activityTypeString {
    int count = 0;
    if ([activityTypeString length] == 0) {
        return -1;
    }
    for (NSString *obj in gmshare_activityTypes) {
        if ([obj isEqualToString:activityTypeString]) {
            return count;
        }
        count ++;
    }
    return -2;
}

- (void)showActivityViewControllerWithItem:(NSObject *)sharedItem {
    //NSLog(@"showActivityViewControllerWithItem");
    NSMutableArray *sharedItems = [NSMutableArray new];
    [sharedItems addObject:sharedItem];
    [self showActivityViewControllerWithItems:sharedItems useExt:NO];
}

- (void)showActivityViewControllerWithItems:(NSMutableArray *)sharedItems useExt:(BOOL)useExt {
    //NSLog(@"showActivityViewControllerWithItems");
    [sharedItems enumerateObjectsUsingBlock:^(id obj, NSUInteger n, BOOL *stop) {
        if ([obj isKindOfClass:[NSDictionary class]]) {
            [sharedItems replaceObjectAtIndex:n withObject:obj[@"image"]];
        }
    }];
    gmshare_didFinish = NO;
    gmshare_completed = NO;
    gmshare_chosenActivityType = -1;
    gmshare_chosenActivityTypeString = @"";
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:sharedItems applicationActivities:nil];
    NSString *useSubject = @"";
    if ([gmshare_temporarySubject length] > 0) {
        useSubject = gmshare_temporarySubject;
        gmshare_temporarySubject = @"";
    }
    if (useExt && [gmshare_subject length] > 0) {
        useSubject = gmshare_subject;
    }
    if ([useSubject length] > 0) {
        [activityViewController setValue:useSubject forKey:@"subject"];
    }
    if (useExt && [gmshare_excludedActivityTypes count] > 0) {
        activityViewController.excludedActivityTypes = [gmshare_excludedActivityTypes copy];
    }
    [activityViewController setCompletionHandler:^(NSString *activityType, BOOL completed) {
        gmshare_didFinish = YES;
        gmshare_completed = completed;
        gmshare_chosenActivityType = [self activityTypeStringToInt:activityType];
        gmshare_chosenActivityTypeString = activityType;
    }];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        [gmshare_rootViewController presentViewController:activityViewController animated:YES completion:nil];
    }
    else {
        UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:activityViewController];
        CGRect rect;
        if (gmshare_popoverUseRegion) {
            rect = CGRectMake(gmshare_popoverRegionX, gmshare_popoverRegionY, gmshare_popoverRegionWidth, gmshare_popoverRegionHeight);
        }
        else {
            rect = CGRectMake(gmshare_popoverX, gmshare_popoverY, 0, 0);
        }
        [popover presentPopoverFromRect:rect inView:gmshare_rootViewController.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
}

- (NSString *)getFilePath:(NSString *)filename {
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [docPath stringByAppendingPathComponent:filename];
}

- (NSDictionary *)createImageDictionaryWithFile:(NSString *)filename {
    NSString *path = [self getFilePath:filename];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    if (image != nil) {
        CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (CFStringRef)[path pathExtension], NULL);
        CFStringRef imageType = kUTTypeImage;
        if (UTTypeConformsTo(UTI, kUTTypeJPEG)) {
            imageType = kUTTypeJPEG;
        }
        else {
            imageType = kUTTypePNG;
        }
        CFRelease(UTI);
        return @{
                 @"image": [image retain],
                 @"filename": [filename retain],
                 @"type": (NSString *)imageType
                 };
    }
    return nil;
}

- (NSString *)getMIMETypeOfFile:(NSString *)path {
    CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (CFStringRef)[path pathExtension], NULL);
    CFStringRef MIMEType = UTTypeCopyPreferredTagWithClass(UTI, kUTTagClassMIMEType);
    CFRelease(UTI);
    return (NSString *)MIMEType;
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    //NSLog(@"messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result");
    [controller dismissModalViewControllerAnimated:YES];
    gmshare_didFinish = YES;
    gmshare_completed = NO;
    if (result == MessageComposeResultSent) {
        gmshare_completed = YES;
    }
    gmshare_chosenActivityTypeString = UIActivityTypeMessage;
    gmshare_chosenActivityType = [self activityTypeStringToInt:gmshare_chosenActivityTypeString];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    //NSLog(@"mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error");
    [controller dismissModalViewControllerAnimated:YES];
    gmshare_didFinish = YES;
    gmshare_completed = NO;
    if (result == MFMailComposeResultSent) {
        gmshare_completed = YES;
    }
    gmshare_chosenActivityTypeString = UIActivityTypeMail;
    gmshare_chosenActivityType = [self activityTypeStringToInt:gmshare_chosenActivityTypeString];
}

@end