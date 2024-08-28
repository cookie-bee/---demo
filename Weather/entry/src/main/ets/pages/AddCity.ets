import { router } from '@kit.ArkUI'
import getweatherUtil from '../Util/getWeatherUtil'
import {CitySearch} from '../bean/CitySearch/CitySearch'

@Entry
@Component
struct AddCity {

  @State locationIdList: string[] = (router.getParams() as Record<string,string[]>)['locationId']

  @State cityNameList: string[] = (router.getParams() as Record<string,string[]>)['cityName']

  @State AllLocationId: Array<string> = ['101010100','101110101','101100101','101020100','101190101','101280601','101101001']

  @State AllCityNameList: Array<string> = ['北京','西安','太原','上海','南京','深圳','忻州']


  onPageShow(): void
  {
    console.log("使用了")

    this.initDate
  }

  async initDate(){

    console.log("使用了2")
    let result2: Array<CitySearch> = await getweatherUtil.getCityMessage_id_2(this.AllLocationId)
    for (let i = 0; i < result2.length; i++) {

      this.AllCityNameList[i] = result2[i].location[0].name
      console.log("测试3"+this.AllCityNameList[i])

    }
  }

  build() {
    Column(){
      Row(){

        Text("添加城市列表")
          .fontSize(35)
          .fontColor(Color.White)

        Blank()

        Button("完成")
          .fontSize(26)
          .backgroundColor("")
          .onClick(()=>{
            router.back({
              url:"pages/Index2",
              params:{
                locationId: this.locationIdList,
                cityName: this.cityNameList
              }
            })
          })

        Button("测试")
          .onClick(()=>{
            console.log("使用了2")
            getweatherUtil.getCityMessage_id_2(this.AllLocationId)


          })



      }.height("10%")
      .width("95%")

      Column(){
        List(){
          ForEach(this.AllCityNameList, (name:string)=>{
            ListItem(){
              if(this.cityNameList.includes(name)){
                Column(){
                  Row(){
                    Text(name)
                      .fontSize(35)
                      .fontColor(Color.White)
                      .width("60%")
                      .margin({top:20,left:30})
                    Blank()
                    Text("已添加")
                      .backgroundColor("")
                      .fontSize(18)
                      .margin({top:5})
                      .opacity(0.8)
                  }.width("80%")
                  Blank()
                  Divider().strokeWidth(5)
                }.height("90")
                .width("100^")
                .margin({top:20})
              }
              else{
                Column(){
                  Row(){
                    Text(name)
                      .fontSize(35)
                      .fontColor(Color.White)
                      .width("60%")
                      .margin({top:20,left:30})
                    Blank()
                    Button("添加")
                      .backgroundColor("")
                      .fontSize(10)
                      .onClick(()=>{
                        //根据name 来获取所在索引
                        let index = this.AllCityNameList.findIndex(obj=>obj===name)
                        //根据获得的索引，来获取城市的对应代码
                        let locationId : string = this.AllLocationId[index]
                        //将编码加入列表
                        this.locationIdList.push(locationId)
                        this.cityNameList.push(name)
                      })
                  }.width("80%")
                  Blank()
                  Divider().strokeWidth(5)
                }.height("90")
                .width("100^")
                .margin({top:20})
              }

            }
          })
        }

      }.width("100%")
      .height("90%")

    }.width("100%")
    .height("100%")
    .backgroundColor("#8aacef")
  }


}
