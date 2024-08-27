import getweatherUtil from '../Util/getWeatherUtil'
import {TimelyWeather} from '../bean/TimelyWeather/TimelyWeather'
import {DailyWeather} from '../bean/DailyWeather/DailyWeather'
import {daily} from '../bean/DailyWeather/daily'
import {TimelyAir} from  '../bean/TimelyAir/TimelyAir'

@Component
export struct TimelyWeatherComponent {

  private locationId: string ='101010100'

  @State cityTimelyWeather: TimelyWeather = new TimelyWeather()

  @State cityDailyWeather: DailyWeather = new DailyWeather()

  @State timelyAir: TimelyAir = new TimelyAir()

  @State today:Array<daily> = []

  @State citytemp: string = ''

  @State tempMax: string = ''

  @State tempMin: string = ''

  @State WeatherNow: string = ''

  @State AirNow: string = ''



  aboutToAppear(): void
  {
    this.initDate()
  }
  //初始化方法
  async  initDate(){

    let result1: TimelyWeather = await getweatherUtil.getTimelyWeather_1(this.locationId)
    this.cityTimelyWeather = result1
    this.citytemp = result1.now.temp
    this.WeatherNow = result1.now.text

    let result2: DailyWeather = await getweatherUtil.getDailyWeather_1(this.locationId)
    this.cityDailyWeather = result2
    this.today = result2.daily

    let result3: TimelyAir = await getweatherUtil.getTimelyAir_1(this.locationId)
    this.timelyAir = result3
    this.AirNow = result3.now.category




  }

  @Builder
  weatherImage(weather:string){

    if (weather === '晴') {
      Image($r("app.media.tianqi_qing"))
        .width(30)
    }

    if (weather === '阴') {
      Image($r("app.media.tianqi_yintian"))
        .width(30)
    }

    if (weather === '多云') {
      Image($r("app.media.tianqi_duoyun"))
        .width(30)
    }

    if (weather.includes("雨")) {
      Image($r("app.media.tianqi_zhongyu"))
        .width(30)


    }
  }

  build() {
    Column(){
      Row(){

        Text(this.citytemp)
          .fontSize(100)
          .fontWeight(FontWeight.Lighter)
          .fontColor(Color.White)

        Text("°C")
          .fontSize(20)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Regular)
          .position({ x: '100.00vp', y: '12vp' })
      }

      ForEach(this.today,(day: daily)=>{
        if(this.today[0] === day)   //当前天气集合中第一个元素等于cast
        {
          Column(){
            //温度天气
            Row(){
              Text(" " + day.tempMax+ " / " + day.tempMin + "°C")
                .fontSize(20)
                .fontColor(Color.White)
                .fontWeight(FontWeight.Regular)
            }
          }.margin({top:0,bottom:7})
        }
      })

      Row(){

        Text(this.WeatherNow)
          .fontSize(15)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Regular)



        Text("   空气质量"+this.AirNow)
          .fontSize(15)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Regular)
      }
      .width("100%")
      .justifyContent(FlexAlign.Center)

    }
  }
}