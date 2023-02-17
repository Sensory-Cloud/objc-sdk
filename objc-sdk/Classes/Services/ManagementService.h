//
//  ManagementService.h
//  Pods
//
//  Created by Niles Hacking on 2/17/23.
//

#ifndef ManagementService_h
#define ManagementService_h

@class GRPCUnaryResponseHandler<ResponseType>;
@class SENGEnrollmentResponse;
@class SENGEnrollmentGroupResponse;

@interface SENManagementService : NSObject

- (void)getEnrollments: (NSString*)userId
               handler: (GRPCUnaryResponseHandler<SENGEnrollmentResponse*>*)handler;

- (void)deleteEnrollment: (NSString*)enrollment
                 handler: (GRPCUnaryResponseHandler<SENGEnrollmentResponse*>*)handler;

- (void)getEnrollmentGroups: (NSString*)userId
                    handler: (GRPCUnaryResponseHandler<SENGEnrollmentGroupResponse*>*)handler;

- (void)createEnrollmentGroup: (NSString*)userId
                      groupId: (NSString*)groupId
                    groupName: (NSString*)groupName
                  description: (NSString*)description
                    modelName: (NSString*)modelName
                      handler: (GRPCUnaryResponseHandler<SENGEnrollmentGroupResponse*>*)handler;

- (void)appendEnrollmentGroup: (NSString*)groupId
                  enrollments: (NSMutableArray<NSString*>*)enrollments
                      handler: (GRPCUnaryResponseHandler<SENGEnrollmentGroupResponse*>*)handler;

- (void)deleteEnrollmentGroup: (NSString*)groupId
                      handler: (GRPCUnaryResponseHandler<SENGEnrollmentGroupResponse*>*)handler;

@end

#endif /* ManagementService_h */
