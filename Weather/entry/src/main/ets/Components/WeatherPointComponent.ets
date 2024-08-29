import getweatherUtil from '../Util/getWeatherUtil'
import {TimelyWeather} from '../bean/TimelyWeather/TimelyWeather'
import { now } from '../bean/TimelyWeather/now'

@Component
export struct WeatherPointComponent {
  private locationId: string = '101010100'
  @State TimelyWeatherModel: TimelyWeather = new TimelyWeather()
  @State nowPoint: now = new now()

  aboutToAppear(): void {
    this.initDate()
  }

  async initDate() {

    let result: TimelyWeather = await getweatherUtil.getTimelyWeather_1(this.locationId)
    this.TimelyWeatherModel = result
    this.nowPoint = result.now

  }

  build() {

    Column() {
      Text("天气指数")
        .textAlign(TextAlign.Start)
        .fontSize(15)
        .fontColor(Color.White)
        .opacity(0.5)
        .width("100%")
        .margin({ top: 20, left: 30 })

      List({space:10}) {
        ListItem() {
          Column({ space: 20 }) {

            Image($r("app.media.tiganwendu"))
              .width(30
              )
            Text(this.nowPoint.feelsLike + "°C")
              .fontSize(20)
              .fontColor(Color.White)

            Text("体感温度")
              .fontSize(15)
              .fontColor(Color.White)
              .opacity(0.5)
          }
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .padding({top:15,bottom:15,left:15,right:15})
        }

        ListItem() {
          Column({ space: 20 }) {

            Image($r("app.media.shidu"))
              .width(30
              )
            Text(this.nowPoint.humidity + "%")
              .fontSize(20)
              .fontColor(Color.White)

            Text("湿度")
              .fontSize(15)
              .fontColor(Color.White)
              .opacity(0.5)
          }
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .padding({top:15,bottom:15,left:15,right:15})
        }

        ListItem() {
          Column({ space: 20 }) {

            Image($r("app.media.cloud"))
              .width(30
              )
            Text(this.nowPoint.cloud + "%")
              .fontSize(20)
              .fontColor(Color.White)

            Text("云量")
              .fontSize(15)
              .fontColor(Color.White)
              .opacity(0.5)
          }
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .padding({top:15,bottom:15,left:15,right:15})
        }

        ListItem() {
          Column({ space: 20 }) {

            Image($r("app.media.fengli"))
              .width(30
              )
            Text(this.nowPoint.windScale + "级")
              .fontSize(20)
              .fontColor(Color.White)

            Text("风力")
              .fontSize(15)
              .fontColor(Color.White)
              .opacity(0.5)
          }
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .padding({top:15,bottom:15,left:15,right:15})
        }

        ListItem() {
          Column({ space: 20 }) {

            Image($r("app.media.fengxiang"))
              .width(30
              )
            Text(this.nowPoint.windDir)
              .fontSize(20)
              .fontColor(Color.White)

            Text("风向")
              .fontSize(15)
              .fontColor(Color.White)
              .opacity(0.5)
          }
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .padding({top:15,bottom:15,left:15,right:15})
        }

        ListItem() {
          Column({ space: 20 }) {

            Image($r("app.media.qiya"))
              .width(30
              )
            Text(this.nowPoint.pressure + "百帕")
              .fontSize(20)
              .fontColor(Color.White)

            Text("气压")
              .fontSize(15)
              .fontColor(Color.White)
              .opacity(0.5)
          }
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .padding({top:15,bottom:15,left:15,right:15})
        }

        ListItem() {
          Column({ space: 20 }) {

            Image($r("app.media.nengjiandu"))
              .width(30
              )
            Text(this.nowPoint.vis + "公里")
              .fontSize(20)
              .fontColor(Color.White)

            Text("能见度")
              .fontSize(15)
              .fontColor(Color.White)
              .opacity(0.5)
          }
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .padding({top:15,bottom:15,left:15,right:15})
        }
      }
      .listDirection(Axis.Horizontal)
      .width("92%")
    }
    .width("95%")
    .height("30%")
    .backgroundColor('rgba(255, 255, 255, 0.1)')
    .borderRadius(20)
    .margin({top:20})
  }
}


