# Rock, Paper, Scissors
精灵们开始在海滩上安营扎寨。为了决定谁的帐篷可以靠近零食储存，巨大的Rock, Paper, Scissors比赛正在进行中。

Rock, Paper, Scissors是两个玩家之间的比赛。每场比赛包含许多回合；在每个回合中，玩家们同时选择一种手势：Rock，Paper，Scissors 。然后，选择该回合的获胜者：Rock 胜利对 Scissors，Paper 胜利对 Rock，Scissors 胜利对 Paper。如果两个玩家选择相同的形状，则该回合以平局结束。## 形状和结果

有3 个形状。它们是：
 - Rock（opp 编码：`A`，玩家编码：`X`，胜利于：`Scissors`，分数：1），
 - Paper（opp 编码：`B`，玩家编码：`Y`，胜利于：`Rock`，分数：2），
 - Scissors（opp 编码：`C`，玩家编码：`Z`，胜利于：`Paper`，分数：3），


结果分数：
 - 胜：6
 - 负：0
 - 平：3

规则
对你昨天的帮助表示感谢，一个精灵给你一个加密的策略指南（你的谜题输入），他们说这将确保帮助你获胜。“第一列是你的对手将要玩的：A 代表Rock，B 代表Paper，C 代表Scissors 第二列是你应该回应的：X 代表Rock，Y 代表Paper，Z 代表Scissors， 每次都胜利可能会有嫌疑，因此回应必须经过仔细选择。

整个锦标赛的赢家是得分最高的选手。你的总分数是每轮得分的总和。单轮得分是你选择的形状（shapes = RockAXC1,shapes = PaperBYA2,shapes = ScissorsCZB3).
            
由于您不能确定精灵是在帮助您还是在欺骗您，因此您应该计算如果按照策略指南行事时会获得的得分。


### Example Game

因为你不能确定精灵是在帮助你还是在欺骗你，所以你应该计算如果你遵循策略指南的话你会得到的分数。

例如，假设你得到了以下策略指南：

```
A Y
B X
C Z
```
- 对手选择了Rock (代码 A)，玩家选择了Paper (代码 Y)
这一轮是win，得分为8
      选择得分：2，结果得分：6
- 对手选择了Paper (代码 B)，玩家选择了Rock (代码 X)
这一轮是loss，得分为1
      选择得分：1，结果得分：0
- 对手选择了Scissors (代码 C)，玩家选择了Scissors (代码 Z)
这一轮是draw，得分为6
      选择得分：3，结果得分：3
最终得分是：15
