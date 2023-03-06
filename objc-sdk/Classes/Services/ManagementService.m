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
#import "Initializer.h"

@interface SENManagementService ()
@property SENTokenManager* tokenManager;
@property dispatch_queue_t responseQueue;
@end

@implementation SENManagementService

- (id)init: (SENTokenManager*)tokenManager {
    if (self = [super init]) {
        self.tokenManager = tokenManager;
        dispatch_queue_attr_t qos = dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_SERIAL, QOS_CLASS_USER_INITIATED, -1);
        self.responseQueue = dispatch_queue_create("managementServiceQueue", qos);
    }
    return self;
}

- (void)getEnrollments: (NSString*)userId handler:(void (^)(SENGEnrollmentResponse*, NSError*))handler {
    NSError* error;
    SENGEnrollmentService* service = [self getEnrollmentService: &error];
    if (error != nil) {
        handler(nil, error);
        return;
    }
    GRPCMutableCallOptions* headers = [[self tokenManager] getAuthorizationMetadata:&error];
    if (error != nil) {
        handler(nil, error);
        return;
    }

    SENGGetEnrollmentsRequest* request = [SENGGetEnrollmentsRequest message];
    request.userId = userId;

    GRPCUnaryResponseHandler* rspHandler = [[GRPCUnaryResponseHandler alloc] initWithResponseHandler:handler responseDispatchQueue:self.responseQueue];
    [[service getEnrollmentsWithMessage:request responseHandler:rspHandler callOptions:headers] start];
}

- (void)deleteEnrollment: (NSString*)enrollment handler:(void (^)(SENGEnrollmentResponse*, NSError*))handler {
    NSError* error;
    SENGEnrollmentService* service = [self getEnrollmentService: &error];
    if (error != nil) {
        handler(nil, error);
        return;
    }
    GRPCMutableCallOptions* headers = [[self tokenManager] getAuthorizationMetadata:&error];
    if (error != nil) {
        handler(nil, error);
        return;
    }

    SENGDeleteEnrollmentRequest* request = [SENGDeleteEnrollmentRequest message];
    request.id_p = enrollment;

    GRPCUnaryResponseHandler* rspHandler = [[GRPCUnaryResponseHandler alloc] initWithResponseHandler:handler responseDispatchQueue:self.responseQueue];
    [[service deleteEnrollmentWithMessage:request responseHandler:rspHandler callOptions:headers] start];
}

- (void)getEnrollmentGroups: (NSString*)userId handler:(void (^)(SENGEnrollmentGroupResponse*, NSError*))handler {
    NSError* error;
    SENGEnrollmentService* service = [self getEnrollmentService: &error];
    if (error != nil) {
        handler(nil, error);
        return;
    }
    GRPCMutableCallOptions* headers = [[self tokenManager] getAuthorizationMetadata:&error];
    if (error != nil) {
        handler(nil, error);
        return;
    }

    SENGGetEnrollmentsRequest* request = [SENGGetEnrollmentsRequest message];
    request.userId = userId;

    GRPCUnaryResponseHandler* rspHandler = [[GRPCUnaryResponseHandler alloc] initWithResponseHandler:handler responseDispatchQueue:self.responseQueue];
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
    SENGEnrollmentService* service = [self getEnrollmentService: &error];
    if (error != nil) {
        handler(nil, error);
        return;
    }
    GRPCMutableCallOptions* headers = [[self tokenManager] getAuthorizationMetadata:&error];
    if (error != nil) {
        handler(nil, error);
        return;
    }

    SENGCreateEnrollmentGroupRequest* request = [SENGCreateEnrollmentGroupRequest message];
    request.id_p = groupId;
    request.name = groupName;
    request.description_p = description;
    request.modelName = modelName;
    request.userId = userId.lowercaseString;

    GRPCUnaryResponseHandler* rspHandler = [[GRPCUnaryResponseHandler alloc] initWithResponseHandler:handler responseDispatchQueue:self.responseQueue];
    [[service createEnrollmentGroupWithMessage:request responseHandler:rspHandler callOptions:headers] start];
}

- (void)appendEnrollmentGroup: (NSString*)groupId
                  enrollments: (NSMutableArray<NSString*>*)enrollments
                      handler: (void (^)(SENGEnrollmentGroupResponse*, NSError*))handler
{
    NSError* error;
    SENGEnrollmentService* service = [self getEnrollmentService: &error];
    if (error != nil) {
        handler(nil, error);
        return;
    }
    GRPCMutableCallOptions* headers = [[self tokenManager] getAuthorizationMetadata:&error];
    if (error != nil) {
        handler(nil, error);
        return;
    }

    SENGAppendEnrollmentGroupRequest* request = [SENGAppendEnrollmentGroupRequest message];
    request.groupId = groupId;
    request.enrollmentIdsArray = enrollments;

    GRPCUnaryResponseHandler* rspHandler = [[GRPCUnaryResponseHandler alloc] initWithResponseHandler:handler responseDispatchQueue:self.responseQueue];
    [[service appendEnrollmentGroupWithMessage:request responseHandler:rspHandler callOptions:headers] start];
}

- (void)deleteEnrollmentGroup: (NSString*)groupId handler: (void (^)(SENGEnrollmentGroupResponse*, NSError*))handler {
    NSError* error;
    SENGEnrollmentService* service = [self getEnrollmentService: &error];
    if (error != nil) {
        handler(nil, error);
        return;
    }
    GRPCMutableCallOptions* headers = [[self tokenManager] getAuthorizationMetadata:&error];
    if (error != nil) {
        handler(nil, error);
        return;
    }

    SENGDeleteEnrollmentGroupRequest* request = [SENGDeleteEnrollmentGroupRequest message];
    request.id_p = groupId;

    GRPCUnaryResponseHandler* rspHandler = [[GRPCUnaryResponseHandler alloc] initWithResponseHandler:handler responseDispatchQueue:self.responseQueue];
    [[service deleteEnrollmentGroupWithMessage:request responseHandler:rspHandler callOptions:headers] start];
}

- (SENGEnrollmentService*)getEnrollmentService: (out NSError**)error {
    struct SENInitConfig config = SENInitializer.sharedConfig;
    if (config.fullyQualifiedDomainName == nil || [config.fullyQualifiedDomainName isEqual:@""]) {
        if (error != nil) {
            *error = [SENInitializer getNotInitializedError];
        }
        return nil;
    }

    GRPCMutableCallOptions* options = [[GRPCMutableCallOptions alloc] init];
    if (config.isSecure) {
        options.transport = GRPCDefaultTransportImplList.core_secure;
    } else {
        options.transport = GRPCDefaultTransportImplList.core_insecure;
    }

    SENGEnrollmentService* service = [[SENGEnrollmentService alloc] initWithHost:config.fullyQualifiedDomainName callOptions:options];
    return service;
}

@end
