import  getweatherUtil from '../Util/getWeatherUtil'
import {WeatherModel} from  '../bean/WeatherModel'
import { cityView } from '../view/cityView'
import { casts } from '../bean/casts'
import {lives} from '../bean/lives'
import { TimelyWeatherModel } from '../bean/TimelyWeatherModel'

@Entry
@Component
struct Index {
  //城市代码集合
  @State cityCodeList: number[] = [110000,120000]
  //城市名字集合
  @State cityNameList: string[] = []
  //城市信息集合
  @State cityTimelytWeatherList: Array<TimelyWeatherModel> = []

  @State cityWeatherList: Array<WeatherModel> = []
  //当前城市索引
  @State cityIndex: number = 0

  tabController: TabsController = new TabsController()

  //按钮样式
  @Builder tabBuild(index:number){
    Circle({width:10,height:10})
      .fill(this.cityIndex === index? Color.White:Color.Gray)
      .opacity(0.4)
  }

  //获取数据
  aboutToAppear(): void {
    this.initDate()
  }
  //初始化方法
  async  initDate(){
    let result: Array<WeatherModel> = await getweatherUtil.getWeathers(this.cityCodeList)
    //调用异步方法，所以需要await来接收
    for (let i = 0; i < result.length; i++) {

      let ACityWeather = new WeatherModel()
      ACityWeather = result[i]
      this.cityWeatherList.push(ACityWeather)

      let cityName = result[i].forecasts[0].city
      this.cityNameList.push(cityName)
    }
      //获取实时天气
      let result2: Array<TimelyWeatherModel> = await getweatherUtil.getTimelyWeathers(this.cityCodeList)
      //调用异步方法，所以需要await来接收
      for (let i = 0; i < result2.length; i++) {

        let ATimelyCityWeather = new TimelyWeatherModel()
        ATimelyCityWeather = result2[i]
        this.cityTimelytWeatherList.push(ATimelyCityWeather)

    }
  }

  //数据展示
  build() {
    Column(){
      Row(){
        Image($r('app.media.menu'))
          .width("40%")
          .backgroundImagePosition(Alignment.End)
          .position({ x: '180.00vp', y: '10vp' })


      }
      .height("6%")
      .width("100")
      Row(){

        Button("添加")
          .fontSize(25)
          .fontColor(Color.Gray)
          .opacity(0.7)
          .backgroundColor("#87CEEB")
          .margin({bottom:15})

        Text(this.cityNameList[this.cityIndex])
          .fontSize(40)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)

        Button("删除")
          .fontSize(25)
          .fontColor(Color.Gray)
          .opacity(0.7)
          .backgroundColor("#87CEEB")
          .margin({bottom:15})

      }.width("100%")
      .height("10%")
      .justifyContent(FlexAlign.SpaceBetween)

      Tabs({barPosition: BarPosition.Start,controller: this.tabController}){

        ForEach(this.cityWeatherList,(cityWeather:WeatherModel)=>{
          TabContent(){
            //将遍历数据全部导入组件中
            cityView({casts:cityWeather.forecasts[0].casts})
          }.tabBar(this.tabBuild(this.cityWeatherList.findIndex(obj=>obj===cityWeather)))
          //对当前cityWeatherList进行遍历，当某个元素与cityweather相等，就会返回cityweather相对于cityWeatherList的索引
        })
      }.barWidth(20)
      .barHeight(40)
      .onChange((index:number)=>{
        this.cityIndex = index
      })
      //使用onchange方法后，标题和页面一起变

    }.width("100%")
    .height("100%")
    .backgroundColor("#87CEEB")
  }

}