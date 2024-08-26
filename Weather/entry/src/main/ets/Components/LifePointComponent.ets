import getweatherUtil from '../Util/getWeatherUtil'
import {WeatherPoint} from '../bean/WeatherPoint/WeatherPoint'
import {daily} from '../bean/WeatherPoint/daily'

@Component
export struct LifePointComponent {

  @State Point_Data : WeatherPoint = new WeatherPoint()

  @State daily_point : Array<daily> = []



  aboutToAppear(): void
  {
    this.initDate()
  }
  //初始化方法
  async  initDate(){

    let result1: WeatherPoint = await getweatherUtil.getWeatherPoint_1()
    this.Point_Data = result1
    this.daily_point = result1.daily

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
            Column({space:30}){

              Image($r('app.media.tianqi_xuezhuanqing'))
                .width(30)

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
