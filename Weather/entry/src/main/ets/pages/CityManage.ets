import {router} from '@kit.ArkUI'

@Entry
@Component
struct CityManage {

  @State locationIdList: string[] = (router.getParams() as Record<string,string[]>)['locationId']

  @State cityNameList: string[] = (router.getParams() as Record<string,string[]>)['cityName']




}