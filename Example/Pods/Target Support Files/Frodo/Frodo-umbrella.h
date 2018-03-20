#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "Frodo-HTTP.h"
#import "HTTPManager.h"
#import "Frodo-TCP.h"
#import "TCPManager.h"

FOUNDATION_EXPORT double FrodoVersionNumber;
FOUNDATION_EXPORT const unsigned char FrodoVersionString[];

