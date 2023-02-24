//
//  ManagementService.m
//  abseil
//
//  Created by Niles Hacking on 2/17/23.
//

#import <Foundation/Foundation.h>
#import "ManagementService.h"
#import "GRPCClient/GRPCTransport.h"
#import "Enrollment.pbrpc.h"
#import "TokenManager.h"

// TODO: rm
static NSString * const kHostAddress = @"localhost:50050";

@interface SENManagementService ()
@property SENTokenManager* tokenManager;
@end

@implementation SENManagementService

- (id)init: (SENTokenManager*)tokenManager {
    if (self = [super init]) {
        self.tokenManager = tokenManager;
    }
    return self;
}

- (void)getEnrollments: (NSString*)userId handler:(void (^)(SENGEnrollmentResponse*, NSError*))handler {
    NSError* error;
    SENGEnrollmentService* service = [self getEnrollmentService];
    GRPCMutableCallOptions* headers = [[self tokenManager] getAuthorizationMetadata:&error];
    if (headers == nil) {
        handler(nil, error);
        return;
    }

    SENGGetEnrollmentsRequest* request = [SENGGetEnrollmentsRequest message];
    request.userId = userId;

    GRPCUnaryResponseHandler* rspHandler = [[GRPCUnaryResponseHandler alloc] initWithResponseHandler:handler responseDispatchQueue:nil];
    [[service getEnrollmentsWithMessage:request responseHandler:rspHandler callOptions:headers] start];
}

- (void)deleteEnrollment: (NSString*)enrollment handler:(void (^)(SENGEnrollmentResponse*, NSError*))handler {
    NSError* error;
    SENGEnrollmentService* service = [self getEnrollmentService];
    GRPCMutableCallOptions* headers = [[self tokenManager] getAuthorizationMetadata:&error];
    if (headers == nil) {
        handler(nil, error);
        return;
    }

    SENGDeleteEnrollmentRequest* request = [SENGDeleteEnrollmentRequest message];
    request.id_p = enrollment;

    GRPCUnaryResponseHandler* rspHandler = [[GRPCUnaryResponseHandler alloc] initWithResponseHandler:handler responseDispatchQueue:nil];
    [[service deleteEnrollmentWithMessage:request responseHandler:rspHandler callOptions:headers] start];
}

- (void)getEnrollmentGroups: (NSString*)userId handler:(void (^)(SENGEnrollmentGroupResponse*, NSError*))handler {
    NSError* error;
    SENGEnrollmentService* service = [self getEnrollmentService];
    GRPCMutableCallOptions* headers = [[self tokenManager] getAuthorizationMetadata:&error];
    if (headers == nil) {
        handler(nil, error);
        return;
    }

    SENGGetEnrollmentsRequest* request = [SENGGetEnrollmentsRequest message];
    request.userId = userId;

    GRPCUnaryResponseHandler* rspHandler = [[GRPCUnaryResponseHandler alloc] initWithResponseHandler:handler responseDispatchQueue:nil];
    [[service getEnrollmentGroupsWithMessage:request responseHandler:rspHandler callOptions:headers] start];
}

- (void)createEnrollmentGroup: (NSString*)userId
                      groupId: (NSString*)groupId
                    groupName: (NSString*)groupName
                  description: (NSString*)description
                    modelName: (NSString*)modelName
                      handler: (void (^)(SENGEnrollmentGroupResponse*, NSError*))handler
{
    NSError* error;
    SENGEnrollmentService* service = [self getEnrollmentService];
    GRPCMutableCallOptions* headers = [[self tokenManager] getAuthorizationMetadata:&error];
    if (headers == nil) {
        handler(nil, error);
        return;
    }

    SENGCreateEnrollmentGroupRequest* request = [SENGCreateEnrollmentGroupRequest message];
    request.id_p = groupId;
    request.name = groupName;
    request.description_p = description;
    request.modelName = modelName;
    request.userId = userId.lowercaseString;

    GRPCUnaryResponseHandler* rspHandler = [[GRPCUnaryResponseHandler alloc] initWithResponseHandler:handler responseDispatchQueue:nil];
    [[service createEnrollmentGroupWithMessage:request responseHandler:rspHandler callOptions:headers] start];
}

- (void)appendEnrollmentGroup: (NSString*)groupId
                  enrollments: (NSMutableArray<NSString*>*)enrollments
                      handler: (void (^)(SENGEnrollmentGroupResponse*, NSError*))handler
{
    NSError* error;
    SENGEnrollmentService* service = [self getEnrollmentService];
    GRPCMutableCallOptions* headers = [[self tokenManager] getAuthorizationMetadata:&error];
    if (headers == nil) {
        handler(nil, error);
        return;
    }

    SENGAppendEnrollmentGroupRequest* request = [SENGAppendEnrollmentGroupRequest message];
    request.groupId = groupId;
    request.enrollmentIdsArray = enrollments;

    GRPCUnaryResponseHandler* rspHandler = [[GRPCUnaryResponseHandler alloc] initWithResponseHandler:handler responseDispatchQueue:nil];
    [[service appendEnrollmentGroupWithMessage:request responseHandler:rspHandler callOptions:headers] start];
}

- (void)deleteEnrollmentGroup: (NSString*)groupId handler: (void (^)(SENGEnrollmentGroupResponse*, NSError*))handler {
    NSError* error;
    SENGEnrollmentService* service = [self getEnrollmentService];
    GRPCMutableCallOptions* headers = [[self tokenManager] getAuthorizationMetadata:&error];
    if (headers == nil) {
        handler(nil, error);
        return;
    }

    SENGDeleteEnrollmentGroupRequest* request = [SENGDeleteEnrollmentGroupRequest message];
    request.id_p = groupId;

    GRPCUnaryResponseHandler* rspHandler = [[GRPCUnaryResponseHandler alloc] initWithResponseHandler:handler responseDispatchQueue:nil];
    [[service deleteEnrollmentGroupWithMessage:request responseHandler:rspHandler callOptions:headers] start];
}

- (SENGEnrollmentService*)getEnrollmentService {
    GRPCMutableCallOptions *options = [[GRPCMutableCallOptions alloc] init];
    options.transport = GRPCDefaultTransportImplList.core_insecure;
    SENGEnrollmentService *service = [[SENGEnrollmentService alloc] initWithHost:kHostAddress callOptions:options];

    return service;
}

@end
