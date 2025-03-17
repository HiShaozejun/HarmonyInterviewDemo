/**
 * @ProjectName : HarmonyInterviewDemo
 * @FileName : HomeListView.ets
 * @Date: 2025/3/13
 * @Author :  shaozj
 * @Description : HomeListview
 */
import { QuestionItemView } from "../commons/components/QuestionItemView"


@Extend(Row) function  config(){
  .width('100%')
  .height(80)
  .justifyContent(FlexAlign.Center)
}
@Component
export struct HomeListView {

  @State
  isfinished: boolean = false

  @State
  isLoadAllData:boolean = false

  @State
  isHeaderRefreshing: boolean = false

  @Builder
  loadBottomView(){
    ListItem(){
      if (this.isfinished){
        Row(){
          Text('没有更多了~')
        }.
        config()
      }else{
        Row(){
          LoadingProgress().width(20)
          Text('正在加载...')
        }
        .config()
      }
    }
  }

  loadMore(){
    if (this.isfinished || this.isLoadAllData || this.isHeaderRefreshing) {
      return;
    }

    // 模拟加载更多的数据
  }

  build() {
    Refresh({refreshing:$$this.isHeaderRefreshing }){
      Column(){
        List(){
          ForEach([1,2,3,4,5,6,7,8,9],(itemValue: number,index)=>{
            ListItem(){
              QuestionItemView()
            }
          })
          this.loadBottomView()
        }
        .edgeEffect(EdgeEffect.None)//取消回弹效果
        .onReachEnd(this.loadMore.bind(this)) // 列表触底
      }
    }.onRefreshing(()=>{
      setTimeout(
        ()=>{
          this.isHeaderRefreshing = false;
        },300)
    })
  }
}