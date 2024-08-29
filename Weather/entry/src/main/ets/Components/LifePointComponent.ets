import getweatherUtil from '../Util/getWeatherUtil'
import {WeatherPoint} from '../bean/WeatherPoint/WeatherPoint'
import {daily} from '../bean/WeatherPoint/daily'

@Component
export struct LifePointComponent {

  private locationId: string = '101010100'

  @State Point_Data : WeatherPoint = new WeatherPoint()

  @State daily_point : Array<daily> = []



  aboutToAppear(): void
  {
    this.initDate()
  }
  //初始化方法
  async  initDate(){

    let result1: WeatherPoint = await getweatherUtil.getWeatherPoint_1(this.locationId)
    this.Point_Data = result1
    this.daily_point = result1.daily

  }

  @Builder
  LifePointImage(keyWord:string){

    if (keyWord === '运动指数') {
      Image($r("app.media.yundongzhishu"))
        .width(30)
    }

    if (keyWord === '洗车指数') {
      Image($r("app.media.maps_local_car_wash"))
        .width(30)
    }

    if (keyWord === '穿衣指数') {
      Image($r("app.media.chuanyizhishu"))
        .width(30)
    }

    if (keyWord === '钓鱼指数') {
      Image($r("app.media.diaoyuzhishu"))
        .width(30)
    }

    if (keyWord === '紫外线指数') {
      Image($r("app.media.ziwaixianzhishu"))
        .width(30)
    }

    if (keyWord === '旅游指数') {
      Image($r("app.media.lvyouzhishu"))
        .width(30)
    }

    if (keyWord === '过敏指数') {
      Image($r("app.media.guominzhishu"))
        .width(30)
    }

    if (keyWord === '舒适度指数') {
      Image($r("app.media.shushiduzhishu_xian"))
        .width(30)
    }

    if (keyWord === '感冒指数') {
      Image($r("app.media.ganmaozhishu"))
        .width(30)
    }

    if (keyWord === '空气污染扩散条件指数') {
      Image($r("app.media.u_105"))
        .width(30)
    }

    if (keyWord === '空调开启指数') {
      Image($r("app.media.airconditioner"))
        .width(30)
    }

    if (keyWord === '太阳镜指数') {
      Image($r("app.media.glass"))
        .width(30)
    }

    if (keyWord === '化妆指数') {
      Image($r("app.media.fenleiweidianji"))
        .width(30)
    }

    if (keyWord === '晾晒指数') {
      Image($r("app.media.liangshaizhishu"))
        .width(30)
    }

    if (keyWord === '交通指数') {
      Image($r("app.media.check"))
        .width(30)
    }

    if (keyWord === '防晒指数') {
      Image($r("app.media.BeachUmbrella"))
        .width(30)
    }
  }

  build() {
    Column({space:20}){

      Text("生活指数")
        .textAlign(TextAlign.Start)
        .fontSize(15)
        .fontColor(Color.White)
        .opacity(0.5)
        .width("100%")
        .margin({top:20,left:30})

      List({space:5}){
        ForEach(this.daily_point,(point:daily)=>{
          ListItem(){
            Column({space:20}){

              this.LifePointImage(point.name)

              Text(point.category)
                .fontSize(20)
                .fontColor(Color.White)

              Text(point.name)
                .fontSize(15)
                .fontColor(Color.White)
                .opacity(0.5)



            }
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)
            .padding({top:15,bottom:15,left:15,right:15})
          }

        })
      }
      .listDirection(Axis.Horizontal)
      .width("92%")


    }
    .width("95%")
    .height("40%")
    .backgroundColor('rgba(255, 255, 255, 0.1)')
    .borderRadius(20)
    .margin({top:20})

  }
}
