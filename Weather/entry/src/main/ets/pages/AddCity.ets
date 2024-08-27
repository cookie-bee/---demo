import { router } from '@kit.ArkUI'

@Entry
@Component
struct AddCity {

  @State locationIdList: string[] = (router.getParams() as Record<string,string[]>)['locationId']


  build() {
  }


}
