import {router} from '@kit.ArkUI'
import {CityBlock} from '../Components/CityManageComponent/CityBlock'

@Entry
@Component
struct CityManage {

  @State locationIdList: string[] = (router.getParams() as Record<string,string[]>)['locationId']

  @State cityNameList: string[] = (router.getParams() as Record<string,string[]>)['cityName']


  build() {
    Navigation(){
      List({space:10}){
        ForEach(this.locationIdList,(id:string)=>{
          ListItem(){

            CityBlock({locationId: id})

          }
        })

      }
      .alignListItem(ListItemAlign.Center)
    }
    .title('管理城市')
    .titleMode(NavigationTitleMode.Mini)

  }


}