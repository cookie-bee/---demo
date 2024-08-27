import getweatherUtil from '../Util/getWeatherUtil'
import {TimelyWeather} from '../bean/TimelyWeather/TimelyWeather'
import {CitySearch} from '../bean/CitySearch/CitySearch'

@Component
export struct MainTemComponent {

  private locationId: string = '101010100'

  @State cityName: string = ''
  @State cityTemp: string = ''
  @State cityTimelyWeather: TimelyWeather = new TimelyWeather()
  @State cityMessage: CitySearch = new CitySearch()
  @State message: string = 'Hello World';
  @State citytemp: string = ''


  aboutToAppear(): void
  {
    this.initDate
  }

  async initDate(){


    let result2: CitySearch = await getweatherUtil.getCityMessage_id_1(this.locationId)
    this.cityName = result2.location[0].name

    if(this.cityTemp!== '')
    {
      console.log("测试"+this.cityTemp)
    }
    else
      console.log("失败")

    if(this.cityName!== '')
    {
      console.log("测试2"+this.cityName)
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