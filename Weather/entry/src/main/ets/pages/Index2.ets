import {TimelyWeatherComponent} from '../Components/TimelyWeatherComponent'
import {TimelyWeather} from '../bean/TimelyWeather/TimelyWeather'
import getweatherUtil from '../Util/getWeatherUtil'
import {HourlyWeatherComponent} from '../Components/HourlyWeatherComponent'
import {FutureDailyWeather} from '../Components/FutureDailyWeather'
import {AqiCircleComponent} from '../Components/AqiCircleComponent'
import {AqiComponent} from '../Components/AqiComponent'
import {LifePointComponent} from '../Components/LifePointComponent'
import {MainTemComponent} from '../Components/MainTemComponent'
import {CitySearch} from '../bean/CitySearch/CitySearch'
import {CityName} from '../Components/CityName'
import { router } from '@kit.ArkUI'
import {AllComponent} from '../Components/AllComponent'
import PreferencesUtil from '../Util/PreferenceUtil'


@Entry
@Component
struct Index2 {

  @State message: string = 'Hello World';
  @State cityTimelyWeather: TimelyWeather = new TimelyWeather()
  @State citytemp: string = ''
  @State cityName: string = ''
  @State locationId: string = '101010100'
  @State cityMessage: CitySearch = new CitySearch()
  @State locationIdList: string[] = ['101010100','101010200']
  @State cityNameList: string[] = ['北京','海淀']

  onPageShow(): void {

    PreferencesUtil.getCityName().then((value)=>{
      this.cityNameList = value
      console.log("测试首选项")
    })

    PreferencesUtil.getLocationId().then((value)=>{
      this.locationIdList = value
    })


  }




  aboutToAppear(): void {
    this.initDate()
    PreferencesUtil.getCityName().then((value)=>{
      this.cityNameList = value
      console.log("测试首选项")
    })

    PreferencesUtil.getLocationId().then((value)=>{
      this.locationIdList = value
    })

  }

  //初始化方法
  async initDate() {

    PreferencesUtil.getCityName().then((value)=>{
      this.cityNameList = value
      console.log("测试首选项")
    })

    PreferencesUtil.getLocationId().then((value)=>{
      this.locationIdList = value
    })


  }

  async saveCityInfo(cityname: string, locationId: string) {


  }

  build() {
    Scroll() {
      Column() {

        Row() {
          Image($r('app.media.menu'))
            .bindMenu([
              {
                value:"添加城市",
                action: () => {
                  router.pushUrl({
                    url:'pages/NewAddCity',
                    params:{
                      locationId: this.locationIdList,
                      cityName: this.cityNameList
                    }
                  })
                }
              },
              {
                value:"管理城市",
                action: () => {
                  router.pushUrl({
                    url:'pages/CityManage',
                    params:{
                      locationId: this.locationIdList,
                      cityName: this.cityNameList
                    }
                  })

                }
              },
              {
                value: "测试工具",
                action: () => {
                  getweatherUtil.getCityMessage_id_2(this.locationIdList)
                }
              }
            ])
            .width("40%")
            .backgroundImagePosition(Alignment.End)
            .position({ x: '180.00vp', y: '10vp' })


        }
        .height("6%")
        .width("100")

        Tabs(){
          ForEach(this.locationIdList,(locationid: string)=>{
            TabContent(){
              AllComponent({locationId:locationid})
            }

          })
        }

        }


      }
    .scrollable(ScrollDirection.Vertical)
    .scrollBarColor("rgba(0,0,0,0.5)")
    .scrollBar(BarState.Auto)
      .backgroundColor("#65aef3")
    .height("100%")
    }
  }
