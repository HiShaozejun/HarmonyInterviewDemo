/**
 * @ProjectName : HarmonyInterviewDemo
 * @FileName : TagView.ets
 * @Date: 2025/3/13
 * @Author :  shaozj
 * @Description : 标签组件
 */

interface TagInfo {
  text: string;
  color: ResourceColor;
}

const infoMap: Record<number, TagInfo> = {
  1: { text: "简单", color: $r("app.color.common_green") },
  2: { text: "简单", color: $r("app.color.common_green") },
  3: { text: "一般", color: $r("app.color.common_blue") },
  4: { text: "一般", color: $r("app.color.common_blue") },
  5: { text: "困难", color: $r("app.color.common_main_color") },
};

@Component
export struct TagView {
  @Prop
  tagName: string = ''
  @Prop
  level: number = 1
  @Prop
  color: ResourceStr = ''

  build() {
    Row() {
      Text(this.tagName || infoMap[this.level].text)
        .fontColor(this.color || infoMap[this.level].color)
        .fontSize(10)
        .height(18)
        .padding({ left: 6, right: 6 })
        .constraintSize({ minWidth: 34 })
        .borderRadius(2)
        .backgroundColor($r('app.color.common_gray_bg'))
        .textAlign(TextAlign.Center)
    }
  }
}