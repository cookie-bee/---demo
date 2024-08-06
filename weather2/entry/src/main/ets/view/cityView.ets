import {casts} from '../bean/casts'
import {TimelyWeatherModel} from '../bean/TimelyWeatherModel'

@Preview
@Component
export struct cityView{
  //获取数据

  //城市天气数据
  casts: Array<casts> = []

  TimeWeather: Array<TimelyWeatherModel> = []

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


  //展示数据
  build() {
    Column(){

      ForEach(this.TimeWeather,(weather:TimelyWeatherModel)=>{
        Text(weather.lives[0].temperature)
          .fontSize(60)
      })
      //当天天气数据
      ForEach(this.casts,(cast:casts)=>{
        if(this.casts[0] === cast)   //当前天气集合中第一个元素等于cast
        {
          //图片渲染
          Row() {
            if (cast.dayweather === '晴') {
              Image($r("app.media.tianqi_qing"))
                .width(260)
            }

            if (cast.dayweather === '阴') {
              Image($r("app.media.tianqi_yintian"))
                .width(260)
            }

            if (cast.dayweather === '多云') {
              Image($r("app.media.tianqi_duoyun"))
                .width(260)
            }

            if (cast.dayweather.includes("雨")) {
              Image($r("app.media.tianqi_zhongyu"))
                .width(260)


            }
          }
            .height("30%")
          Column(){
            //温度天气
            Row(){
              Text(cast.dayweather)
                .fontSize(30)
                .fontColor(Color.White)
                .fontWeight(FontWeight.Bold)

              Text(" " + cast.daytemp+ " ° ~" + cast.nighttemp + "°")
                .fontSize(30)
                .fontColor(Color.White)
                .fontWeight(FontWeight.Bold)
            }
            Row(){
              Text(cast.daywind + "风")
                .fontSize(30)
                .fontColor(Color.White)
                .fontWeight(FontWeight.Bold)
              Text(cast.daypower + "级")
                .fontSize(30)
                .fontColor(Color.White)
                .fontWeight(FontWeight.Bold)
            }
          }.margin({top:10})

        }
      })
      //近期天气数据
      Column(){
        Text("近期天气查询")
          .fontSize(26)
          .margin({top:30})
        //天气列表
        Row(){
          ForEach(this.casts,(cast:casts)=>{
            Column(){
              Text(cast.date.substring(5))
              this.weatherImage(cast.dayweather)
              Text(cast.daytemp.toString())
              Line()
                .width(20).height(80).startPoint([10,0])
                .endPoint([10,70]).stroke(Color.Black)
                .strokeWidth(3).strokeDashArray([10,3])
              Text(cast.nighttemp.toString())
              this.weatherImage(cast.nightweather)

            }
          })

        }.width("80%")
        .height("60%")
        .backgroundColor("#ffbab8b8")
        .justifyContent(FlexAlign.SpaceAround)



      }.width("100%")
      .height("45%")
    }
    .width("100%")
    .height("100%")
  }

}