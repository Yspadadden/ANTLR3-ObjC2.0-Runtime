#import <Cocoa/Cocoa.h>
#import "Fuzzy.h"
#import "antlr3.h"

int main(int argc, const char * argv[])
{
    NSError *error;
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	NSString *input = [NSString stringWithContentsOfFile:@"../../examples/fuzzy/input"  encoding:NSASCIIStringEncoding error:&error];
	NSLog(@"%@", input);
	ANTLRStringStream *stream = [ANTLRStringStream newANTLRStringStream:input];
	Fuzzy *lex = [Fuzzy newFuzzyWithCharStream:stream];
//	ANTLRCommonTokenStream *tokens = [ANTLRCommonTokenStream newANTLRCommonTokenStreamWithTokenSource:lex];
//	NSLog( [tokens toString] );
//#ifdef DONTUSENOMO
	id<ANTLRToken> currentToken;
	while ((currentToken = [lex nextToken]) && [currentToken getType] != ANTLRTokenTypeEOF) {
		NSLog(@"%@", [currentToken toString]);
	}
//#endif
	[lex release];
	[stream release];
	
	[pool release];
	return 0;
}