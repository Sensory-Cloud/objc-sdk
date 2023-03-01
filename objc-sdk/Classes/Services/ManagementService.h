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

/// A collection of GRPC service calls for managing existing enrollments and enrollment groups
@interface SENManagementService : NSObject

/// Initializes a new instance of `SENManagementService`
///
/// - Parameter tokenManager: Token manager instance to get OAuth credentials from
- (id)init: (SENTokenManager*)tokenManager;

/// Fetches a list of enrollments for the given user id
/// - Parameters:
///   - userId: UserID to fetch enrollments for
///   - handler: Handler callback that will be called with the server's response
- (void)getEnrollments: (NSString*)userId
               handler: (void (^)(SENGEnrollmentResponse*, NSError*))handler;

/// Requests the deletion of an enrollment
///
/// The server will prevent users from deleting their last enrollment
/// - Parameters:
///   - enrollment: Enrollment ID of the enrollment to delete
///   - handler: Handler callback that will be called with the server's response
- (void)deleteEnrollment: (NSString*)enrollment
                 handler: (void (^)(SENGEnrollmentResponse*, NSError*))handler;

/// Fetches a list of enrollment groups for the given user id
///
/// - Parameters:
///   - userId: UserID to fetch enrollment groups for
///   - handler: Handler callback that will be called with the server's response
- (void)getEnrollmentGroups: (NSString*)userId
                    handler: (void (^)(SENGEnrollmentGroupResponse*, NSError*))handler;

/// Creates a new group of enrollments that can be used for group authentication
///
/// - Parameters:
///   - userId: UserID of the user that owns the enrollment group
///   - groupId: unique group identifier for the enrollment group
///   - groupName: Friendly display name for the enrollment group
///   - description: User supplied description of the enrollment group
///   - modelName: The name of the model that all enrollments in this group will use
///   - handler: Handler callback that will be called with the server's response
- (void)createEnrollmentGroup: (NSString*)userId
                      groupId: (NSString*)groupId
                    groupName: (NSString*)groupName
                  description: (NSString*)description
                    modelName: (NSString*)modelName
                      handler: (void (^)(SENGEnrollmentGroupResponse*, NSError*))handler;

/// Appends enrollments to an existing enrollment group
///
/// - Parameters:
///   - groupId: GroupID of the enrollment group to append enrollments to
///   - enrollments: A list of enrollment IDs to append to the enrollment group
///   - handler: Handler callback that will be called with the server's response
- (void)appendEnrollmentGroup: (NSString*)groupId
                  enrollments: (NSMutableArray<NSString*>*)enrollments
                      handler: (void (^)(SENGEnrollmentGroupResponse*, NSError*))handler;

/// Requests the deletion of an enrollment group
///
/// - Parameters:
///   - groupId: Enrollment group ID of the group to delete
///   - handler: Handler callback that will be called with the server's response
- (void)deleteEnrollmentGroup: (NSString*)groupId
                      handler: (void (^)(SENGEnrollmentGroupResponse*, NSError*))handler;

@end

#endif /* ManagementService_h */
