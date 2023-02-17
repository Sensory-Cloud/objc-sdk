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

// TODO: rm
static NSString * const kHostAddress = @"localhost:50050";

@implementation SENManagementService

- (void)getEnrollments: (NSString*)userId handler:(GRPCUnaryResponseHandler<SENGEnrollmentResponse*>*)handler {
    SENGEnrollmentService *service = [self getEnrollmentService];

    SENGGetEnrollmentsRequest *request = [SENGGetEnrollmentsRequest message];
    request.userId = userId;

    [[service getEnrollmentsWithMessage:request responseHandler:handler callOptions:nil] start];
}

- (void)deleteEnrollment: (NSString*)enrollment handler:(GRPCUnaryResponseHandler<SENGEnrollmentResponse*>*)handler {
    SENGEnrollmentService *service = [self getEnrollmentService];

    SENGDeleteEnrollmentRequest *request = [SENGDeleteEnrollmentRequest message];
    request.id_p = enrollment;

    [[service deleteEnrollmentWithMessage:request responseHandler:handler callOptions:nil] start];
}

- (void)getEnrollmentGroups: (NSString*)userId handler:(GRPCUnaryResponseHandler<SENGEnrollmentGroupResponse*>*)handler {
    SENGEnrollmentService *service = [self getEnrollmentService];

    SENGGetEnrollmentsRequest *request = [SENGGetEnrollmentsRequest message];
    request.userId = userId;

    [[service getEnrollmentGroupsWithMessage:request responseHandler:handler callOptions:nil] start];
}

- (void)createEnrollmentGroup: (NSString*)userId
                      groupId: (NSString*)groupId
                    groupName: (NSString*)groupName
                  description: (NSString*)description
                    modelName: (NSString*)modelName
                      handler: (GRPCUnaryResponseHandler<SENGEnrollmentGroupResponse*>*)handler
{
    SENGEnrollmentService *service = [self getEnrollmentService];

    SENGCreateEnrollmentGroupRequest *request = [SENGCreateEnrollmentGroupRequest message];
    request.id_p = groupId;
    request.name = groupName;
    request.description_p = description;
    request.modelName = modelName;
    request.userId = userId.lowercaseString;

    [[service createEnrollmentGroupWithMessage:request responseHandler:handler callOptions:nil] start];
}

- (void)appendEnrollmentGroup: (NSString*)groupId
                  enrollments: (NSMutableArray<NSString*>*)enrollments
                      handler: (GRPCUnaryResponseHandler<SENGEnrollmentGroupResponse*>*)handler
{
    SENGEnrollmentService *service = [self getEnrollmentService];

    SENGAppendEnrollmentGroupRequest *request = [SENGAppendEnrollmentGroupRequest message];
    request.groupId = groupId;
    request.enrollmentIdsArray = enrollments;

    [[service appendEnrollmentGroupWithMessage:request responseHandler:handler callOptions:nil] start];
}

- (void)deleteEnrollmentGroup: (NSString*)groupId handler: (GRPCUnaryResponseHandler<SENGEnrollmentGroupResponse*>*)handler {
    SENGEnrollmentService *service = [self getEnrollmentService];

    SENGDeleteEnrollmentGroupRequest *request = [SENGDeleteEnrollmentGroupRequest message];
    request.id_p = groupId;

    [[service deleteEnrollmentGroupWithMessage:request responseHandler:handler callOptions:nil] start];
}

- (SENGEnrollmentService*)getEnrollmentService {
    GRPCMutableCallOptions *options = [[GRPCMutableCallOptions alloc] init];
    options.transport = GRPCDefaultTransportImplList.core_insecure;
    SENGEnrollmentService *service = [[SENGEnrollmentService alloc] initWithHost:kHostAddress callOptions:options];

    return service;
}

@end
