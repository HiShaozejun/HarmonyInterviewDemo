/**
 * @ProjectName : HarmonyInterviewDemo
 * @FileName : TabContentView.ets
 * @Date: 2025/3/13
 * @Author :  shaozj
 * @Description :Home页 Tab内容
 */

import { HomeListView } from "../../pages/HomeListView"
import { QuestionItemView } from "./QuestionItemView"
import { TagView } from "./TagView"

interface QuestionType {
  id: number
  name: string
  displayNewestFlag: 0 | 1
}

@Component
export struct HomeTabContentView {
  @State
  activeIndex: number = 0
  mockData: QuestionType[] = [
    { id: 1, name: 'ArkTS', displayNewestFlag: 0 },
    { id: 2, name: 'ArkUI', displayNewestFlag: 1 },
    { id: 3, name: 'Hap', displayNewestFlag: 1 },
    { id: 4, name: 'Hsp', displayNewestFlag: 0 },
    { id: 5, name: 'Har', displayNewestFlag: 0 },
    { id: 6, name: 'Ability', displayNewestFlag: 0 },
    { id: 7, name: 'Stage', displayNewestFlag: 0 },
    { id: 8, name: 'Kit', displayNewestFlag: 0 }
  ]

  @Builder
  tabItemBuilder(item: QuestionType, index: number) {
    Column({ space: 6 }) {
      Row({ space: 4 }) {
        Text(item.name).fontSize(15)
          .fontColor(this.activeIndex === index ? $r('app.color.black') : $r('app.color.common_gray_01'))
        if (item.displayNewestFlag) {
          Image($r('app.media.ic_home_new')).width(30).height(15).objectFit(ImageFit.Contain)
        }
      }

      Blank()
        .width(20)
        .height(3)
        .color(this.activeIndex == index ? $r('app.color.common_gray_03') : $r('app.color.white'))
        .borderRadius(1.5)
        .animation({ duration: this.activeIndex === index ? 300 : 0 })
    }
    .justifyContent(FlexAlign.Center)
    .padding({ left: 10, right: 10 })
  }

  build() {
    Tabs({ index: this.activeIndex }) {
      ForEach(this.mockData, (itemValue: QuestionType, index: number) => {
        TabContent() {
          HomeListView()
        }
        .tabBar(this.tabItemBuilder(itemValue, index))
      })
    }
    .onTabBarClick((index) => this.activeIndex = index)
    .barPosition(BarPosition.Start)
    .scrollable(false)
    .barMode(BarMode.Scrollable) //设置滚动
    .barWidth('100%')
    .divider({ strokeWidth: 0.5, color: $r('app.color.common_gray_border') })

  }
}