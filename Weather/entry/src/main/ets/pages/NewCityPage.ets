import { router } from '@kit.ArkUI'
import getweatherUtil from '../Util/getWeatherUtil'
import {CitySearch} from '../bean/CitySearch/CitySearch'
import { ExpectExtend } from '@ohos/hypium'
import {location} from '../bean/CitySearch/location'
import { AllComponent } from '../Components/AllComponent'

@Entry
@Component
struct NewCityPage {

  @State locationIdList: string[] = (router.getParams() as Record<string,string[]>)['locationId']

  @State cityNameList: string[] = (router.getParams() as Record<string,string[]>)['cityName']

  @State addLocationId: string = (router.getParams() as Record<string,string>)['addLocationId']

  @State addLocationName: string = (router.getParams() as Record<string,string>)['addLocationName']

  @State AllLocationId: Array<string> = ['101010100','101110101','101100101','101020100','101190101','101280601','101101001']

  @State AllCityNameList: Array<string> = ['北京','西安','太原','上海','南京','深圳','忻州']

  @State SearchText: string = ''

  @State CityMessage: Array<location> = []


  build() {

    Column(){

      Row(){
        Image($r("app.media.fanhui"))
          .width(30)
          .onClick(()=>{
            router.back()
          })
          .margin({top:10,bottom:10,left: 20})
      }
      .width("100%")
      .alignItems(VerticalAlign.Top)
      .justifyContent(FlexAlign.Start)
      .backgroundColor("#65aef3")

      Stack({alignContent: Alignment.Bottom}){

        Column(){
          AllComponent({locationId:this.addLocationId})
        }
        .height("100%")

        Column(){
          Row(){
            Text("添加城市")
              .fontColor(Color.White)
              .fontSize(30)
              .textAlign(TextAlign.Center)
          }
          .borderRadius(50)
          .backgroundColor("rgba(255,255,255,0.3)")
          .onClick(()=>{
            this.locationIdList.push(this.addLocationId)
            this.cityNameList.push(this.addLocationName)
            router.pushUrl({
              url: 'pages/Index2',
              params:{
                locationId: this.locationIdList,
                cityName: this.cityNameList,
              }
            })

          })
          .margin({bottom: 40,top: 20})
          .width("50%")
          .height("8%")
          .justifyContent(FlexAlign.Center)
          .alignItems(VerticalAlign.Center)
        }
        .width("100%")
        .backgroundColor("#65aef3")

      }
    }

  }

}