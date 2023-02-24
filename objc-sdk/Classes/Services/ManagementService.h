//
//  ManagementService.h
//  Pods
//
//  Created by Niles Hacking on 2/17/23.
//

#ifndef ManagementService_h
#define ManagementService_h

@class SENTokenManager;
@class SENGEnrollmentResponse;
@class SENGEnrollmentGroupResponse;

@interface SENManagementService : NSObject

- (id)init: (SENTokenManager*)tokenManager;

- (void)getEnrollments: (NSString*)userId
               handler: (void (^)(SENGEnrollmentResponse*, NSError*))handler;

- (void)deleteEnrollment: (NSString*)enrollment
                 handler: (void (^)(SENGEnrollmentResponse*, NSError*))handler;

- (void)getEnrollmentGroups: (NSString*)userId
                    handler: (void (^)(SENGEnrollmentGroupResponse*, NSError*))handler;

- (void)createEnrollmentGroup: (NSString*)userId
                      groupId: (NSString*)groupId
                    groupName: (NSString*)groupName
                  description: (NSString*)description
                    modelName: (NSString*)modelName
                      handler: (void (^)(SENGEnrollmentGroupResponse*, NSError*))handler;

- (void)appendEnrollmentGroup: (NSString*)groupId
                  enrollments: (NSMutableArray<NSString*>*)enrollments
                      handler: (void (^)(SENGEnrollmentGroupResponse*, NSError*))handler;

- (void)deleteEnrollmentGroup: (NSString*)groupId
                      handler: (void (^)(SENGEnrollmentGroupResponse*, NSError*))handler;

@end

#endif /* ManagementService_h */
