import { DailyWeather } from '../../bean/DailyWeather/DailyWeather'
import { TimelyWeather } from '../../bean/TimelyWeather/TimelyWeather'
import getWeatherUtil from '../../Util/getWeatherUtil'


@Component
export struct CityBlock {

  private locationId: string = '101010100'

  @State CityName: string = ''

  @State TimelyTemp: string = ''

  @State TimelyWeather: string = ''

  @State tempMax: string = ''

  @State tempMin: string = ''

  aboutToAppear(): void {
  }

  async initDate() {

    let result: TimelyWeather = await getWeatherUtil.getTimelyWeather_1(this.locationId)
    this.TimelyTemp = result.now.temp
    this.TimelyWeather = result.now.text

    let result1: DailyWeather = await getWeatherUtil.getDailyWeather_1(this.locationId)
    this.tempMax = result1.daily[0].tempMax
    this.tempMin = result1.daily[0].tempMin


  }



}