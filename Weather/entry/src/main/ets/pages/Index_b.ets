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


@Component
export struct Index {

  private locationId: string = '101010100'

  @State message: string = 'Hello World';
  @State cityTimelyWeather: TimelyWeather = new TimelyWeather()
  @State citytemp: string = ''
  @State cityName: string = ''
  @State cityMessage: CitySearch = new CitySearch()
  @State locationIdList: string[] = []

  aboutToAppear(): void {
    this.initDate()
  }

  //初始化方法
  async initDate() {

    let result1: TimelyWeather = await getweatherUtil.getTimelyWeather_1(this.locationId)
    let result2: CitySearch = await getweatherUtil.getCityMessage_id_1(this.locationId)
    this.cityName = result2.location[0].name
    this.cityTimelyWeather = result1
    this.citytemp = result1.now.temp
    if(this.citytemp!== '')
    {
      console.log("测试"+this.citytemp)
    }
    else
      console.log("失败")

    if(this.cityName!== '')
    {
      console.log("测试"+this.cityName)
    }
    else
      console.log("失败")


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
                    url:'pages/AddCity',
                    params:{
                      locationId: this.locationIdList
                    }
                  })
                }
              }
            ])
            .width("40%")
            .backgroundImagePosition(Alignment.End)
            .position({ x: '180.00vp', y: '10vp' })


        }
        .height("6%")
        .width("100")

        CityName({locationId: this.locationId})

        TimelyWeatherComponent({locationId: this.locationId})
          .margin({bottom:60})

        HourlyWeatherComponent({locationId: this.locationId})

        FutureDailyWeather({locationId: this.locationId})

        AqiComponent({locationId: this.locationId})

        LifePointComponent({locationId: this.locationId})


        }


      }
    .scrollable(ScrollDirection.Vertical)
    .scrollBarColor("rgba(0,0,0,0.5)")
    .scrollBar(BarState.Auto)
      .backgroundColor("#8aacef")
    .height("100%")
    }
  }
