//
//  PINAlternateRepresentationProvider.m
//  Pods
//
//  Created by Garrett Moon on 3/17/16.
//
//

#import "PINAlternateRepresentationProvider.h"

#import "PINCachedAnimatedImage.h"
#import "NSData+ImageDetectors.h"

@implementation PINAlternateRepresentationProvider

- (id)alternateRepresentationWithData:(NSData *)data options:(PINRemoteImageManagerDownloadOptions)options
{
    if ([data pin_isAnimatedGIF]) {
        return [[PINCachedAnimatedImage alloc] initWithAnimatedImageData:data];
    }
#if PIN_WEBP
    if ([data pin_isAnimatedWebP]) {
        return [[PINCachedAnimatedImage alloc] initWithAnimatedImageData:data];
    }
#endif
#if PIN_APNG
    if ([data pin_isAPNG]) {
        return [[PINCachedAnimatedImage alloc] initWithAnimatedImageData:data];
    }
#endif
    return nil;
}

@end
