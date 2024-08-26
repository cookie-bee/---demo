import {TimelyWeatherComponent} from '../Components/TimelyWeatherComponent'
import {TimelyWeather} from '../bean/TimelyWeather/TimelyWeather'
import getweatherUtil from '../Util/getWeatherUtil'
import {HourlyWeatherComponent} from '../Components/HourlyWeatherComponent'
import {FutureDailyWeather} from '../Components/FutureDailyWeather'
import {AqiCircleComponent} from '../Components/AqiCircleComponent'
import {AqiComponent} from '../Components/AqiComponent'
import {LifePointComponent} from '../Components/LifePointComponent'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State cityTimelyWeather: TimelyWeather = new TimelyWeather()
  @State citytemp: string = ''
  @State cityName: string = '北京市'

  aboutToAppear(): void {
    this.initDate()
  }

  //初始化方法
  async initDate() {

    let result1: TimelyWeather = await getweatherUtil.getTimelyWeather_1()
    this.cityTimelyWeather = result1
    this.citytemp = result1.now.temp
    if(this.citytemp!== '')
    {
      console.log("测试"+this.citytemp)
    }
    else
      console.log("失败")


  }

  build() {
    Scroll() {
      Column() {

        Row() {
          Image($r('app.media.menu'))
            .width("40%")
            .backgroundImagePosition(Alignment.End)
            .position({ x: '180.00vp', y: '10vp' })


        }
        .height("6%")
        .width("100")

        Row() {

          Text(this.cityName)
            .fontSize(30)
            .fontColor(Color.White)
            .fontWeight(FontWeight.Medium)
            .textAlign(TextAlign.Center)
            .width("100%")

        }.width("100%")
        .height("10%")
        .justifyContent(FlexAlign.SpaceBetween)
        .margin({top:7})

        TimelyWeatherComponent()
          .margin({bottom:60})

        HourlyWeatherComponent()

        FutureDailyWeather()

        AqiComponent()

        LifePointComponent()


        }


      }
    .scrollable(ScrollDirection.Vertical)
    .scrollBarColor("rgba(0,0,0,0.5)")
    .scrollBar(BarState.Auto)
      .backgroundColor("#8aacef")
    .height("100%")
    }
  }
