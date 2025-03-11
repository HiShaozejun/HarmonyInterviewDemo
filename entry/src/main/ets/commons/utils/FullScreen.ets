/**
 * @ProjectName : HarmonyInterviewDemo
 * @FileName : FullScreen.ets
 * @Date: 2025/3/11
 * @Author :  shaozj
 * @Description : 全屏适配工具类
 */
import { window } from '@kit.ArkUI'

class FullScreen {
  // 开启全屏
  async fullScreenEnable() {
    const context = AppStorage.get<Context>('context');
    if (context) {
      const windowClass = await window.getLastWindow(context)
      windowClass.setWindowLayoutFullScreen(true)
      let topAvoidArea: window.AvoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
      let topHeight = topAvoidArea.topRect.height
      AppStorage.setOrCreate<number>('topHeight', px2vp(topHeight))

      let bottomAvoidArea: window.AvoidArea =
        windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR)
      let bottomHeight = bottomAvoidArea.bottomRect.height
      AppStorage.setOrCreate<number>('bottomHeight', px2vp(bottomHeight))

    }

  }

  // 关闭全屏
  async fullScreenDisable() {
    const context = AppStorage.get<Context>('context');
    if (context) {
      const windowClass = await window.getLastWindow(context)
      windowClass.setWindowLayoutFullScreen(false)
      AppStorage.setOrCreate<number>('topHeight', 0)
      AppStorage.setOrCreate<number>('bottomHeight', 0)
    }
  }
}

export const fullscreenUtil = new FullScreen()