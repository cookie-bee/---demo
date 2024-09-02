import getweatherUtil from '../Util/getWeatherUtil'
import {TimelyWeather} from '../bean/TimelyWeather/TimelyWeather'

@Component
export struct WindMessageComponent {

  private locationId: string = '101010100'

  @State TimelyWeatherModel: TimelyWeather = new TimelyWeather()

  @State WindDirection: string = ''

  @State WindLevel: string = ''

  aboutToAppear(): void
  {
    this.initDate()
  }
  //初始化方法
  async  initDate(){

    let result1: TimelyWeather = await getweatherUtil.getTimelyWeather_1(this.locationId)
    this.TimelyWeatherModel = result1
    this.WindDirection = result1.now.windDir
    this.WindLevel = result1.now.windScale

  }

  build() {
    Column(){
      Text("多日预报")
        .textAlign(TextAlign.Start)
        .fontSize(15)
        .fontColor(Color.White)
        .opacity(0.5)
        .width("100%")
        .margin({top:20,left:30})

      Row(){
        Image($r("app.media.fenglifadianji_white"))
          .width(80)
          .margin({top:20,right:60})

          Text(this.WindDirection+this.WindLevel+"级")
            .fontSize(25)
            .fontWeight(FontWeight.Regular)
            .margin({top:20})
            .fontColor(Color.White)


      }
    }
    .width("95%")
    .height("32%")
    .backgroundColor('rgba(255, 255, 255, 0.1)')
    .borderRadius(20)
    .margin({top:20})
  }
}