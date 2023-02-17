//
//  HealthService.h
//  objc-sdk
//
//  Created by Niles Hacking on 2/16/23.
//

#ifndef HealthService_h
#define HealthService_h

@class GRPCUnaryResponseHandler<ResponseType>;
@class SENGServerHealthResponse;

@interface SENHealthService : NSObject

- (void)getHealth: (GRPCUnaryResponseHandler<SENGServerHealthResponse*>*)handler;

@end

#endif /* SENHealthService_h */
