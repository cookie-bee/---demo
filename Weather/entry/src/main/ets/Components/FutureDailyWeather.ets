import {DailyWeather} from '../bean/DailyWeather/DailyWeather'
import {daily} from '../bean/DailyWeather/daily'
import getweatherUtil from '../Util/getWeatherUtil'

@Component
export struct FutureDailyWeather {
  @State FutureWeather: DailyWeather = new DailyWeather()
  @State FutureWeatherData: Array<daily> = []

  aboutToAppear(): void {
    this.initDate()
  }

  //初始化方法
  async initDate() {

    let result1: DailyWeather = await getweatherUtil.getDailyWeather_1()
    this.FutureWeather = result1
    this.FutureWeatherData = result1.daily
    console.log("Date_test"+this.FutureWeatherData[0].fxDate)

  }

  @Builder
  weatherImage(weather: string, size: number) {

    if (weather === '晴') {
      Image($r("app.media.tianqi_qing"))
        .width(size)
    }

    if (weather === '阴') {
      Image($r("app.media.tianqi_yintian"))
        .width(size)
    }

    if (weather === '多云') {
      Image($r("app.media.tianqi_duoyun"))
        .width(size)
    }

    if (weather.includes("雨")) {
      Image($r("app.media.tianqi_zhongyu"))
        .width(size)


    }
  }

  formatDate(date: Date): string {
    // 获取年、月、日等部分
    let year = date.getFullYear();
    let month = (date.getMonth() + 1).toString().padStart(2, '0');
    let day = date.getDate().toString().padStart(2, '0');

    // 组合成所需的日期格式，例如：2024-08-07
    return `${month}/${day}`;
  }

  DateChange(dates:string):string{
    //i 假设的时间字符串
    let dateString: string = dates

    // 使用Date对象解析时间字符串
    let date = new Date(dateString);

    // 创建一个格式化日期时间的函数


    // 调用函数并打印结果
    let formattedTime:string = this.formatDate(date);
    return formattedTime  // 输出: 下午10点00分
  }



  build() {

  Column({space:20}){

    Text("多日预报")
      .textAlign(TextAlign.Start)
      .fontSize(15)
      .fontColor(Color.White)
      .opacity(0.5)
      .width("100%")
      .margin({top:20,left:30})

    List({space:25}){
      ForEach(this.FutureWeatherData,(Daily:daily)=>{
        ListItem(){

          Column(){
            Text(this.DateChange(Daily.fxDate))
              .fontSize(15)
              .fontColor(Color.White)
              .opacity(0.5)
              .margin({bottom:15})
            this.weatherImage(Daily.textDay,30)
            Text(Daily.tempMax.toString()+"°C")
              .fontSize(20)
              .fontColor(Color.White)
              .margin({bottom:60,top:15})

            Text(Daily.tempMin.toString()+"°C")
              .fontSize(20)
              .fontColor(Color.White)
          }
        }
      })
    }
    .listDirection(Axis.Horizontal)
    .width("90%")
    .height("80%")

  }
  .width("95%")
  .height("40%")
  .backgroundColor('rgba(255, 255, 255, 0.1)')
  .borderRadius(20)
  .margin({top:20})


}
}