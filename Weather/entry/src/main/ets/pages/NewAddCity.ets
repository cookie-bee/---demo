import { router } from '@kit.ArkUI'
import getweatherUtil from '../Util/getWeatherUtil'
import {CitySearch} from '../bean/CitySearch/CitySearch'
import { ExpectExtend } from '@ohos/hypium'
import {location} from '../bean/CitySearch/location'
import {HotCityComponent} from '../Components/HotCityComponent'

@Entry
@Component
struct NewAddCity {

  @State locationIdList: string[] = (router.getParams() as Record<string,string[]>)['locationId']

  @State cityNameList: string[] = (router.getParams() as Record<string,string[]>)['cityName']

  @State AllLocationId: Array<string> = ['101010100','101110101','101100101','101020100','101190101','101280601','101101001']

  @State AllCityNameList: Array<string> = ['北京','西安','太原','上海','南京','深圳','忻州']

  @State SearchText: string = ''

  @State CityMessage: Array<location> = []


  onPageShow(): void
  {
    console.log("使用了")

    this.initDate
  }

  async initDate(){

    console.log("使用了2")
    let result2: Array<CitySearch> = await getweatherUtil.getCityMessage_id_2(this.AllLocationId)
    this.CityMessage[0].name = ''

  }

  build() {
    Column(){

      Stack({alignContent:Alignment.Top}){
        Column(){
          HotCityComponent()
            .margin({top:100})
        }

        Column() {
          Row() {
            Image($r("app.media.fanhui"))
              .onClick(() => {
                router.back()
              })
              .width(10)
            TextInput({ placeholder: "搜索城市（中文/拼音）" })
              .onChange(async (value) => {
                this.SearchText = value

                let result: CitySearch = await getweatherUtil.getCityMessage_id_1(value);
                this.CityMessage = result.location; // 更新城市信息

              })
              .backgroundColor("rgba(255,255,255,0.5)")
          }.margin({top:20})

          List({ space: 5 }) {
            ForEach(this.CityMessage, (city: location) => {
              ListItem() {
                Column() {
                  Text(city.name)
                    .fontSize(30)
                    .fontColor(Color.White)
                    .textAlign(TextAlign.Start)
                  Blank()
                  Divider()
                }.width("90%")
                .alignItems(HorizontalAlign.Start)
                .margin({ top: 10, bottom: 10 })

              }
              .width("100%")

            })

          }.width("100%")
          .backgroundColor("rgba(255,255,255,0.5)")
        }

      }
      }
    .backgroundColor("#65aef3")
    .height("100%")
    .width("100%")




  }

}