/**
 * @ProjectName : HarmonyInterviewDemo
 * @FileName : StatusBar.ets
 * @Date: 2025/3/11
 * @Author :  shaozj
 * @Description : 修改状态的背景颜色和字色工具
 */
import { window } from '@kit.ArkUI';

class StatusBar {

  async setStatusBarLight(){
    await this.setStatusBar({statusBarColor:'#FFFFFF',statusBarContentColor:'#000000'})
  }

  async setStatusBarDark(){
    await this.setStatusBar({statusBarColor:'#000000',statusBarContentColor:'#FFFFFF'})
  }

 // 自定义状态栏颜色
 async setStatusBar(property: window.SystemBarProperties) {
    const context = AppStorage.get<Context>('context')
    if (context) {
      let windowClass = await window.getLastWindow(context)
      windowClass.setWindowSystemBarProperties(property)
    }
  }
}

export const statusBarUtil = new StatusBar()