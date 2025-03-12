import { fullscreenUtil } from '../commons/utils/FullScreen';
import { logger } from '../commons/utils/Logger';
import { statusBarUtil } from '../commons/utils/StatusBar';
import { HomePage } from './HomePage';
import { InterViewPage } from './InterViewPage';
import { MinePage } from './MinePage';
import { ProjectPage } from './ProjectPage';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @StorageProp('topHeight')
  topHeight: number = 0
  @StorageProp('bottomHeight')
  bottomHeight: number = 0
  @State
  curIndex: number = 0

  @Builder
  tabBarItem(title: string,normalImage : Resource, selectImage: Resource, index: number) {
    Column({ space: 4 }) {
      Image(this.curIndex == index ? selectImage : normalImage).width(14).height(14)
      Text(title).fontSize(14).fontColor(this.curIndex == index ? Color.Black : Color.Gray)
    }
  }

  build() {
    Column() {
      Tabs() {
        TabContent() {
          HomePage()
        }.tabBar(this.tabBarItem('首页', $r('app.media.tabbar_home'), $r('app.media.tabbar_home_fill'), 0))

        TabContent() {
          ProjectPage()
        }.tabBar(this.tabBarItem('项目', $r('app.media.tabbar_project'), $r('app.media.tabbar_project_fill'), 1))

        TabContent() {
          InterViewPage()
        }.tabBar(this.tabBarItem('面经', $r('app.media.tabbar_interview'), $r('app.media.tabbar_interview_fill'), 2))

        TabContent() {
          MinePage()
        }.tabBar(this.tabBarItem('我的', $r('app.media.tabbar_mine'), $r('app.media.tabbar_mine_fill'), 3))
      }
      .scrollable(false)
      .barPosition(BarPosition.End)
      .animationDuration(0)
      .barWidth('100%')
      .onTabBarClick((index:number)=>{
        this.curIndex = index;
      })
    }
    .height('100%')
    .width('100%')
    .padding({top:this.topHeight, bottom:this.bottomHeight})
  }
}