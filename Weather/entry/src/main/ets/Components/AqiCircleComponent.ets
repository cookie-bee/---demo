import {TimelyAir} from  '../bean/TimelyAir/TimelyAir'
import getweatherUtil from '../Util/getWeatherUtil'

@Component
export struct AqiCircleComponent {

  private locationId: string = '101010100'

  @State timelyAir: TimelyAir = new TimelyAir()

  @State aqi: number = Number(this.timelyAir.now.aqi)

  aboutToAppear(): void {
    this.initDate()
  }

  //初始化方法
  async initDate() {

    let result1: TimelyAir = await getweatherUtil.getTimelyAir_1(this.locationId)
    this.timelyAir = result1
    this.aqi = Number(this.timelyAir.now.aqi)
    console.log("aqi_test"+ this.aqi);

  }

  build() {

    Column(){
      Stack({alignContent:Alignment.Center}){
        Gauge({value:this.aqi,min:0,max:500})
          .startAngle(210)
          .endAngle(150)
          .colors([[0X00FF00, 0.1],[0xFFFF00,0.1],[0xFF6100,0.1],[0xFF0000,0.1],[0xA020F0,0.2],[0x8B0000,0.4]])
          .strokeWidth(5)

        Column(){
          Text(this.timelyAir.now.category)
            .fontSize(25)
            .fontColor(Color.White)


          Text(this.timelyAir.now.aqi)
            .fontSize(15)
            .fontColor(Color.White)
        }



      }
    }

  }
}

