import {CitySearch} from '../../bean/CitySearch/CitySearch'
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
    this.initDate()
  }

  async initDate() {

    let result: TimelyWeather = await getWeatherUtil.getTimelyWeather_1(this.locationId)
    this.TimelyTemp = result.now.temp
    this.TimelyWeather = result.now.text

    let result1: DailyWeather = await getWeatherUtil.getDailyWeather_1(this.locationId)
    this.tempMax = result1.daily[0].tempMax
    this.tempMin = result1.daily[0].tempMin

    let result2: CitySearch = await getWeatherUtil.getCityMessage_id_1(this.locationId)
    this.CityName = result2.location[0].name


  }

  build() {
    Row({space:150}){
      Column(){

        Text(this.CityName)
          .fontSize(35)
          .fontColor(Color.White)
          .margin({bottom:15})


        Text(this.TimelyWeather)
          .fontSize(20)
          .fontColor(Color.White)

      }
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Start)

      Column(){
        Row(){
          Text(this.TimelyTemp)
            .fontSize(40)
            .fontColor(Color.White)

          Text("°C")
            .fontSize(30)
            .fontColor(Color.White)


        }

        Text(this.tempMax+"/"+this.tempMin+"°C")
          .fontSize(15)
          .fontColor("rgba(255,255,255,0.6)")

      }
    }
    .padding({top:10,bottom:10,left:15,right:15})
    .width("90%")
    .height("20%")
    .backgroundColor("#65aef3")
    .borderRadius(20)
  }



}