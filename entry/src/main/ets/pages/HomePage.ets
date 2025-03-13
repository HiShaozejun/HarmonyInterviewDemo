import { SearchBarView } from "../commons/components/SearchBarView";
import { promptAction } from "@kit.ArkUI";
import { SwiperView } from "../commons/components/SwiperView";
import { HomeTabContentView } from "../commons/components/TabContentView";


@Component
export struct HomePage {
  @State clockCount: number = 0

  searchAction() {
    promptAction.showToast({ message: '开始搜索' })
  }

  scanAction() {
    promptAction.showToast({ message: '开始扫码' })
  }

  clockAction() {
    this.clockCount = 10
  }

  build() {
    Column() {
      // 搜索
      SearchBarView({
        searchAction: this.searchAction,
        scanAction: this.scanAction,
        clockNumber: this.clockCount,
        updateClockCount: this.clockAction.bind(this)
      })

      // 轮播
      SwiperView()

      // 主页tab
      HomeTabContentView().layoutWeight(1)
    }
    .height('100%')
    .width('100%')
  }
}