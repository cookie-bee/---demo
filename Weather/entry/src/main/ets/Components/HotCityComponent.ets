import {HotCity} from '../bean/HotCity/HotCity'
import getweatherUtil from '../Util/getWeatherUtil'
import {topCityList} from '../bean/HotCity/topCityList'

@Component
export struct HotCityComponent {

  private locationId: string = '101010100'

  @State hotCityMessage: HotCity = new HotCity()

  @State hotCityList: Array<topCityList> = []


  aboutToAppear(): void
  {
    this.initDate()
  }

  async initDate(){

    let result1: HotCity = await getweatherUtil.getHotCityMessage_1(this.locationId)
    this.hotCityMessage = result1
    this.hotCityList = result1.topCityList
  }

  build() {

    Column(){

      Text("热门城市")
        .fontColor(Color.White)
        .fontSize(25)
        .textAlign(TextAlign.Start)
        .margin({top:20,left:30,bottom:20})
        .width("100%")

      List({ space:5 }){
        ForEach(this.hotCityList,(city: topCityList)=>{
          ListItem(){
            Column(){
              Text(city.name)
                .fontColor(Color.White)
                .fontSize(18)

            }
            .width("90%")
            .height(40)
            .borderRadius(20)
            .backgroundColor("rgba(255,255,255,0.2)")
            .justifyContent(FlexAlign.Center)
          }
          .width("95%")
          .height(40)
        })
      }
      .margin({left:13})
      .lanes(3)
    }
    .width("95%")
    .height("45%")
    .backgroundColor("rgba(255,255,255,0.1)")
    .borderRadius(20)
  }
}