//
//  S03SQLite.swift
//  S03-SQLite
//
//  Created by Li Wenya Colin on 2019/1/15.
//  Copyright © 2019 Li Wenya Colin. All rights reserved.
//

import UIKit
import SQLite
//https://www.jianshu.com/p/30e31282c4b9
let ducumentPath = NSHomeDirectory() + "/Documents" + "/S03SQlite.sqlite"

class S03SQLite: NSObject {
    var db: Connection!
    let messageList = Table("messageList")
    
    let id = Expression<Int64>("id")
    let uid = Expression<String>("uid")
    let name = Expression<String>("name")
    let desc = Expression<String>("description")
    let mp3URL = Expression<String>("mp3_url")
    let htmlURL = Expression<String>("html_url")
    let expireDate = Expression<Date>("expireDate")
    let expireDate2 = Expression<Date>("expireDate2")
    override init() {
        db = try! Connection.init(ducumentPath)
    }
    func operate() {
        
        let createTable = messageList.create { (builder) in
            builder.column(id,primaryKey:.autoincrement)
            builder.column(uid)
            builder.column(name)
            builder.column(desc)
            builder.column(mp3URL)
            builder.column(htmlURL)
            builder.column(expireDate)
            builder.column(expireDate2)
        }
        do {
            try db.run(messageList.drop(ifExists: true))
            try db.run(createTable)
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    func insert() -> Int64?{
        var rowid:Int64 = 0
        do {
            rowid = try (db.run(messageList.insert(uid <- "S1",
                                                    name <- "name1",
                                                    desc <- "description1",
                                                    mp3URL <- "https://fs-gateway.esdict.cn/store_main/sentencemp3/0qDG0C7bnZrL0jhpVb9T4OGdAnM=.mp3",
                                                    htmlURL <- "https://raw.githubusercontent.com/ms99ster/learn/master/README.md",
                                                    expireDate <- Date(),
                                                    expireDate2 <- Date()
                )
                ))
            
        }catch {
            print(error)
        }
        return rowid
    }
    func select() -> Array<Dictionary<String, Any>>{
        var array = [Dictionary<String, Any>].init()
        do {
            for item in try db.prepare(Table("messageList")) {
                print(item[id])
                var dic = Dictionary<String, Any>.init()
                dic.updateValue(item[id] as NSNumber, forKey: "id")
                dic.updateValue(item[uid] as String, forKey: "uid")
                dic.updateValue(item[name] as String, forKey: "name")
                dic.updateValue(item[desc] as String, forKey: "description")
                dic.updateValue(item[mp3URL] as String, forKey: "mp3URL")
                dic.updateValue(item[htmlURL] as String, forKey: "htmlURL")
                dic.updateValue(item[expireDate] as Date, forKey: "expireDate")
                dic.updateValue(item[expireDate2] as Date, forKey: "expireDate2")
                array.append(dic)
            }
        } catch  {
            print("select data error")
        }
        return array;
    }
}
