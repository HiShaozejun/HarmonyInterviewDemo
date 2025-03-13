/**
 * @ProjectName : HarmonyInterviewDemo
 * @FileName : QuestionItemView.ets
 * @Date: 2025/3/13
 * @Author :  shaozj
 * @Description : Home列表的view
 */
import { TagView } from "./TagView"


@Extend(Text)
function grayText(isStart: boolean = false) {
  .lineHeight(13)
  .fontSize(13)
  .fontColor($r('app.color.common_gray_01'))
  .padding({ left: isStart ? 0 : 12, right: 12 })
}

@Component
export struct QuestionItemView {
  build() {
    Column({space:10}) {
      Row({space:7}) {
        TagView()
        Text('测试数据研代会发货房间卡很费劲卡法福达坊久啊联发科大富豪科技吧')
          .fontSize(15)
          .layoutWeight(1)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .fontWeight(500)
      }

      // 带中间竖线的组件
      RowSplit() {
        Text('点赞 100')
          .grayText(true)
        Text('浏览 1000')
          .grayText()
        Text('已看过')
          .grayText()
      }
    }.padding(14)
    .width('100%')
    .height(80)
    .alignItems(HorizontalAlign.Start)

  }
}