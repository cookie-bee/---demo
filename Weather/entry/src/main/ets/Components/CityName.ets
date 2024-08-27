import {TimelyWeatherComponent} from '../Components/TimelyWeatherComponent'
import {TimelyWeather} from '../bean/TimelyWeather/TimelyWeather'
import getweatherUtil from '../Util/getWeatherUtil'
import {HourlyWeatherComponent} from '../Components/HourlyWeatherComponent'
import {FutureDailyWeather} from '../Components/FutureDailyWeather'
import {AqiCircleComponent} from '../Components/AqiCircleComponent'
import {AqiComponent} from '../Components/AqiComponent'
import {LifePointComponent} from '../Components/LifePointComponent'
import {MainTemComponent} from '../Components/MainTemComponent'
import {CitySearch} from '../bean/CitySearch/CitySearch'



@Component
export struct CityName {
  @State message: string = 'Hello World';
  @State cityTimelyWeather: TimelyWeather = new TimelyWeather()
  @State citytemp: string = ''
  @State cityName: string = ''
  @State locationId: string = '101010100'
  @State cityMessage: CitySearch = new CitySearch()

  aboutToAppear(): void {
    this.initDate()
  }

  //初始化方法
  async initDate() {

    let result1: TimelyWeather = await getweatherUtil.getTimelyWeather_1(this.locationId)
    let result2: CitySearch = await getweatherUtil.getCityMessage_id_1(this.locationId)
    this.cityName = result2.location[0].name
    this.cityTimelyWeather = result1
    this.citytemp = result1.now.temp
    if(this.citytemp!== '')
    {
      console.log("测试"+this.citytemp)
    }
    else
      console.log("失败")

    if(this.cityName!== '')
    {
      console.log("测试"+this.cityName)
    }
    else
      console.log("失败")


  }

  build() {
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

  }
}