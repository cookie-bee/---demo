import getweatherUtil from '../Util/getWeatherUtil'
import {TimelyAir} from '../bean/TimelyAir/TimelyAir'
import {AqiCircleComponent} from './AqiCircleComponent'

@Component
export struct AqiComponent {

  @State aqi_data : TimelyAir = new TimelyAir()

  @State aqi : string = ''

  aboutToAppear(): void {
    this.initDate()
  }

  //初始化方法
  async initDate() {

    let result1: TimelyAir = await getweatherUtil.getTimelyAir_1()
    this.aqi_data = result1
    this.aqi = result1.now.aqi

  }

  build() {
    Column(){

      Text("空气质量")
        .textAlign(TextAlign.Start)
        .fontSize(15)
        .fontColor(Color.White)
        .opacity(0.5)
        .width("100%")
        .margin({top:20,left:30})

      Row(){

        AqiCircleComponent()
          .layoutWeight(3)

        Column({space:5}){
          Text("当前AQI指数为"+this.aqi)
            .fontSize(15)
            .fontColor(Color.White)

            Text("测试文本")
              .fontSize(13)
              .fontColor(Color.White)
              .opacity(0.5)
        }
        .layoutWeight(7)
        .justifyContent(FlexAlign.Start)
        .alignItems(HorizontalAlign.Start)
        .width("100%")
        .margin({left:20})

      }
      .margin({left:20,top:20})

    }
    .width("95%")
    .height("23%")
    .backgroundColor('rgba(255, 255, 255, 0.1)')
    .borderRadius(20)
    .margin({top:20})
  }

}