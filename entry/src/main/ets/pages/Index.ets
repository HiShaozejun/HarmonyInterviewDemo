import { fullscreenUtil } from '../commons/utils/FullScreen';
import { logger } from '../commons/utils/Logger';
import { statusBarUtil } from '../commons/utils/StatusBar';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @StorageProp('topHeight')
  topHeight: number = 0
  @StorageProp('bottomHeight')
  bottomHeight: number = 0

  build() {
    Column() {
      Text('听哦破防了答复就开了')
      Blank()
      Button('open').onClick(async () => {
        fullscreenUtil.fullScreenEnable()
      })

      Button('close').onClick(() => {
        fullscreenUtil.fullScreenDisable()
      })
        Blank()

      Button('light').onClick(() => {
        statusBarUtil.setStatusBarLight()
      })

      Button('dark').onClick(() => {
        statusBarUtil.setStatusBarDark()
      })
      Text('听哦破防了答复就开了')


    }
    .height('100%')
    .width('100%')
    .backgroundColor(Color.Orange)
    .padding({ top: this.topHeight, bottom: this.bottomHeight })
  }
}