//
//  PrivateChatController.m
//  SocketIMDemo
//
//  Created by Mac on 2018/3/24.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "PrivateChatController.h"

@interface PrivateChatController () {
    /**自己对应聊天体系中哪个人*/
    IMChater *_ownerChater;
    /**当前和哪个人在聊天*/
    IMChater *_otherChater;
    
    /**用户模型管理器*/
    UserManager *_userManager;
    /**聊天模型管理器*/
    IMUserManager *_iMUserManager;
    /**聊天类*/
    IMUserSocket *_iMUserSocket;
}

@end

@implementation PrivateChatController

#pragma mark -- Init Methods

- (instancetype)initWithTargetId:(NSString*)targetId {
    self = [super init];
    if (self) {
        _userManager = [UserManager manager];
        _iMUserManager = [IMUserManager manager];
        _iMUserSocket = [IMUserSocket socket];
        //获取自己
        _ownerChater = [IMChater new];
        _ownerChater.imid = _userManager.user.uid;
        _ownerChater.avatar = _userManager.user.avatar;
        _ownerChater.nick = _userManager.user.nick;
        //获取当前聊天的人
        for (User *currUser in [_userManager allUsers]) {
            if(currUser.uid != targetId.intValue) {
                continue;
            }
            //赋值
            _otherChater = [IMChater new];
            _otherChater.imid = currUser.uid;
            _otherChater.avatar = currUser.avatar;
            _otherChater.nick = currUser.nick;
            break;
        }
        assert(_otherChater != nil);
        self.navigationItem.title = _otherChater.nick;
    }
    return self;
}

#pragma mark -- Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)dealloc {
    
}

#pragma mark -- Class Private Methods

#pragma mark -- Class Public Methods

#pragma mark -- Function Private Methods

#pragma mark -- Function Public Methods

#pragma mark -- Instance Private Methods

#pragma mark -- Instance Public Methods

@end
