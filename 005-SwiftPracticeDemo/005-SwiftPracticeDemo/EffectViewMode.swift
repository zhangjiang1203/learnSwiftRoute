//
//  EffectViewMode.swift
//  005-SwiftPracticeDemo
//
//  Created by DFHZ on 2017/6/27.
//  Copyright © 2017年 DFHZ. All rights reserved.
//

import UIKit

class EffectViewMode {
    
    //MARK Public API
    var title = ""
    var descrip = ""
    var numberOfMembers = 0
    var numberOfPosts = 0
    var featureImage:UIImage!
    
    //初始化方法
    init(title:String,desc:String,image:UIImage) {
        self.title = title
        self.descrip = desc
        self.featureImage = image
        numberOfPosts = 1
        numberOfMembers = 1
    }
    
    //MARK: -Private
    static func createMyInterests()-> [EffectViewMode]{
        return [
            EffectViewMode.init(title: "卓文君的《白头吟》", desc: "皑如山上雪，皎若云间月。\n闻君有两意，故来相决绝。\n今日斗酒会，明旦沟水头。\n躞蹀御沟上，沟水东西流。\n凄凄复凄凄，嫁娶不须啼。\n愿得一人心，白首不相离。\n竹竿何袅袅，鱼尾何簁簁！\n男儿重意气，何用钱刀为！", image: UIImage(named: "hello")!),
            EffectViewMode.init(title: "李商隐的《无题》", desc: "昨夜星辰昨夜风，画楼西畔桂堂东。\n身无彩凤双飞翼，心有灵犀一点通。\n隔座送钩春酒暖，分曹射覆蜡灯红。\n嗟余听鼓应官去，走马兰台类转蓬。", image: UIImage(named: "hhhhh")!),
            EffectViewMode.init(title: "元稹的《离思》", desc: "曾经沧海难为水，除却巫山不是云。\n取次花丛懒回顾，半缘修道半缘君。", image: UIImage(named: "runingStep")!),
            EffectViewMode.init(title: "刘禹锡的《竹枝词二首·其一》", desc: "杨柳青青江水平，闻郎江上唱歌声。\n东边日出西边雨，道是无晴却有晴。", image: UIImage(named: "dudu")!),
            EffectViewMode.init(title: "柳永的《蝶恋花·柳永》", desc: "伫倚危楼风细细，望极春愁，黯黯生天际。\n草色烟光残照里，无言谁会凭栏意。\n拟把疏狂图一醉，对酒当歌，强乐还无味。\n衣带渐宽终不悔，为伊消得人憔悴。", image: UIImage(named: "darkvarder")!),
            EffectViewMode.init(title: "张谓的《早梅》", desc: "一树寒梅白玉条，迥临村路傍溪桥。\n不知近水花先发，疑是经冬雪未销。", image: UIImage(named: "bodyline")!)
        ]
    }
}
