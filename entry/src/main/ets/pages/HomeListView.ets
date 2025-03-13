/**
 * @ProjectName : HarmonyInterviewDemo
 * @FileName : HomeListView.ets
 * @Date: 2025/3/13
 * @Author :  shaozj
 * @Description : HomeListview
 */
import { QuestionItemView } from "../commons/components/QuestionItemView"

@Component
export struct HomeListView {
  build() {
    Column(){
      List(){
        ForEach([1,2,3,4,5,6,7,8,9],(itemValue: number,index)=>{
          ListItem(){
            QuestionItemView()
          }
        })
      }
    }
  }
}