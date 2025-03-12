/**
 * @ProjectName : HarmonyInterviewDemo
 * @FileName : SearchBarView.ets
 * @Date: 2025/3/12
 * @Author :  shaozj
 * @Description : 搜索框
 */
@Preview
@ComponentV2
export struct SearchBarView {
  @Param
  placeHolder?: string = '搜索题目'
  @Param
  clockNumber: number = 0
  @Param
  scanAction?: () => void = () => {
  }
  @Param
  searchAction?: () => void = () => {
  }

  // 回调父组件更新子组件打卡数量
  @Event
  updateClockCount: () => void = () => {
  }

  @Builder
  clock() {
    Column() {
      if (this.clockNumber > 0) {
        Text('连续打卡').fontSize(8)
        Text() {
          Span(this.clockNumber.toString()).fontSize(10).fontWeight(600)
          Span('天').fontSize(7)
        }
      } else {
        Text('未打卡').fontSize(12)
      }
    }
    .padding({ left: 12 })
    .backgroundImage($r('app.media.ic_common_clocked'))
    .width(80)
    .height(35)
    .justifyContent(FlexAlign.Center)
    .onClick(this.updateClockCount)

  }

  build() {
    Row() {
      Image($r('app.media.ic_home_scan')).width(20).height(20).onClick(this.scanAction)
      Row({ space: 4 }) {
        Image($r('app.media.ic_common_search')).width(10).height(10)
        Text(this.placeHolder).fontSize(13).fontColor($r('app.color.common_gray_03'))
      }
      .backgroundColor($r('app.color.common_gray_bg'))
      .layoutWeight(1)
      .justifyContent(FlexAlign.Center)
      .margin({ left: 10, right: 10 })
      .padding({ top: 8, bottom: 8 })
      .borderRadius(6)
      .onClick(this.searchAction)

      this.clock()

    }
    .width('100%')
    .padding({ left: 12, right: 12 })
    .justifyContent(FlexAlign.SpaceBetween)

  }
}