#import "CloseKeyboard.h"


@implementation CloseKeyboard

- (void)keyboard_close
{
    NSLog(@"[CloseKeyboard] Closed keyboard");   
	[[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

@end