//
//  WeMessageModel.swift
//  wechatchat
//
//  Created by Quentin on 2019/5/2.
//  Copyright © 2019 quentin. All rights reserved.
//

import Foundation
import ObjectMapper

class MessageModel: NSObject, WeModelProtocol {
    var middleImageURL : String?
    var unreadNumber : Int?
    var nickname : String?
    var messageFromType : MessageFromType = MessageFromType.Personal
    var messageContentType : MessageContentType = MessageContentType.Text
    var chatId : String?  //每个人，群，公众帐号都有一个 uid，统一叫 chatId
    var latestMessage : String? //当且仅当消息类型为 Text 的时候，才有数据，其他类型需要本地造
    var dateString: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        middleImageURL <- map["avatar_url"]
        unreadNumber <- map["message_unread_num"]
        nickname <- map["nickname"]
        messageFromType <- (map["meesage_from_type"], EnumTransform<MessageFromType>())
        chatId <- map["userid"]
        latestMessage <- map["last_message.message"]
        messageContentType <- (map["last_message.message_content_type"], EnumTransform<MessageContentType>())
        dateString <- (map["last_message.timestamp"], TransformerTimestampToTimeAgo)
    }
    
    var lastMessage: String? { get {
        switch (self.messageContentType) {
        case .Text, .System:
            return self.latestMessage
        case .Image:
            return "[图片]"
        case .Voice:
            return "[语音]"
        case .File:
            return "[文件]"
        default:
            return ""
        }}
    }
}

