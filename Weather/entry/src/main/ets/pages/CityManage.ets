import {router} from '@kit.ArkUI'
import {CityBlock} from '../Components/CityManageComponent/CityBlock'
import {CitySearch} from '../bean/CitySearch/CitySearch'
import getweatherUtil from '../Util/getWeatherUtil'
import PreferencesUtil from '../Util/PreferenceUtil'

@Entry
@Component
struct CityManage {

  @State locationIdList: string[] = (router.getParams() as Record<string,string[]>)['locationId']

  @State cityNameList: string[] = (router.getParams() as Record<string,string[]>)['cityName']

  async CityNameMessage(locationId: string){
    let result2: CitySearch = await getweatherUtil.getCityMessage_id_1(locationId)
    let cityName: string = result2.location[0].name
    return cityName
  }


  build() {
    Column(){
      Row(){

        Image($r("app.media.fanhui"))
          .width(30)
          .onClick(() => {
            router.back({
              url:"pages/Index2",
              params:{
                locationId: this.locationIdList,
                cityName: this.cityNameList
              }
            })
          })


        Text(" 管理城市")
          .fontSize(25)
          .fontColor(Color.Black)
          .fontWeight(FontWeight.Regular)
      }
      .justifyContent(FlexAlign.Start)
      .width("90%")
      .margin({top:20,bottom:20})

      List({space:10}){
        ForEach(this.locationIdList,(id:string)=>{
          ListItem(){
            Row(){
              CityBlock({locationId: id})

              Image($r("app.media.lajitong"))
                .width(35)
                .onClick(()=>{

                  let index = this.locationIdList.findIndex(obj=>obj===id)
                  let name : string = this.cityNameList[index]

                  AlertDialog.show({
                    title: "删除",
                    message: `你确定要删除${name}的天气信息吗`,
                    confirm: {
                       value: "确定",
                      action: ()=>{
                         this.cityNameList = this.cityNameList.filter(item => item !== this.cityNameList[index])

                        this.locationIdList = this.locationIdList.filter(item => item !== this.locationIdList[index])

                        PreferencesUtil.saveMessage(this.cityNameList,this.locationIdList)

                      }
                    }
                  })

                })

            }



          }
        })

      }
      .alignListItem(ListItemAlign.Center)
    }





  }


}