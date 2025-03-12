import { SearchBarView } from "../commons/components/SearchBarView";
import { promptAction } from "@kit.ArkUI";


@Component
export struct HomePage {
  @State clockCount:number = 0

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
      SearchBarView({
        searchAction: this.searchAction,
        scanAction: this.scanAction,
        clockNumber: this.clockCount,
        updateClockCount: this.clockAction.bind(this)
      })
    }
    .height('100%')
    .width('100%')
  }
}