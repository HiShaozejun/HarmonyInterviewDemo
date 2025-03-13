/**
 * @ProjectName : HarmonyInterviewDemo
 * @FileName : SwiperView.ets
 * @Date: 2025/3/13
 * @Author :  shaozj
 * @Description : 轮播图组件 Swiper组件学习
 */

const swiperData: Resource[] = [$r('app.media.banner_ai'), $r('app.media.banner_pj'), $r('app.media.banner_qa')]

@Component
export struct SwiperView {
  build() {
    Swiper() {
      ForEach(swiperData, (itemValue: Resource, index: number) => {
        Row() {
          Image(itemValue).width('100%').aspectRatio(2.6).objectFit(ImageFit.Fill)
        }
        .padding(12)
      })
    }
    .autoPlay(true)
    .loop(true)
    // 间隔1.5秒滚动下一画面
    .interval(1500)
    // 设置指示器的样式
    .indicator(DotIndicator.dot()
      .itemWidth(6)
      .selectedItemWidth(12)
      .color($r('app.color.common_gray_02'))
      .selectedColor($r('app.color.common_green')))

  }
}