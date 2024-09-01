import {HourlyWeather} from '../bean/HourlyWeather/HourlyWeather'
import getweatherUtil from '../Util/getWeatherUtil'
import {hourly} from '../bean/HourlyWeather/hourly'
import { EditableTitleBar } from '@ohos.arkui.advanced.EditableTitleBar'

@Component
export struct HourlyWeatherComponent {

  private locationId : string = '101010100'

  @State hourlyWeather: HourlyWeather = new HourlyWeather()

  @State hourly_weather: Array<hourly> = []


  aboutToAppear(): void
  {
    this.initDate()
  }
  //初始化方法
  async  initDate(){

    let result1: HourlyWeather = await getweatherUtil.getHourlyWeather_1(this.locationId)
    this.hourlyWeather = result1
    this.hourly_weather = result1.hourly

  }

  @Builder
  weatherImage(weather:string,size:number){

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


  formatTime(date: Date): string {
    // 获取小时数（24小时制）
    let hours = date.getHours();

    // 转换为12小时制
    let period = hours >= 12 ? "下午" : "上午";
    hours = hours % 12;
    // 如果小时数为0，表示中午12点
    hours = hours ? hours : 12;

    // 格式化分钟数，始终保留两位数字（例如："05"）
    let minutes = date.getMinutes().toString().padStart(2, '0');

    // 返回格式化后的时间字符串
    return `${period}${hours}:${minutes}`;
  }

  timeChange(time:string):string{
    // 假设的时间字符串
    let timeString: string = time

    // 使用Date对象解析时间字符串
    let date = new Date(timeString);

    // 创建一个格式化日期时间的函数


    // 调用函数并打印结果
    let formattedTime:string = this.formatTime(date);
    return formattedTime  // 输出: 下午10点00分
  }



  build() {
  Column(){
    List({space:3}){
      ForEach(this.hourly_weather,(hour:hourly)=>{
        ListItem(){
          Column({space:10}){


            Text(this.timeChange(hour.fxTime))
              .fontSize(13)
              .fontColor(Color.White)
              .fontWeight(FontWeight.Normal)

            this.weatherImage(hour.text,30)

            Text(hour.temp+"°C")
              .fontColor(Color.White)

          }
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .padding({top:15,bottom:15,left:15,right:15})
        }

      })
    }
    .listDirection(Axis.Horizontal)
    .width("92%")


  }.width("95%")
  .height("15%")
  .backgroundColor('rgba(255, 255, 255, 0.1)')
  .borderRadius(20)
  .margin({top:10})
  }
}