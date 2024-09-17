import {preferences} from  '@kit.ArkData'
import { Context } from '@kit.AbilityKit'
import { location } from '../bean/CitySearch/location'
import Pref from '@ohos.data.preferences'

const PREFERENCES_NAME = 'mypreferences'
const KEY_NAME = 'keyName'
const KEY_ID = 'keyLocationId'

export class PreferencesUtil {
  CreatePreferences(context:Context)
  {
    globalThis.Preferences  = (()=>{
      let pref = Pref.getPreferences(context, PREFERENCES_NAME)
      return pref
    })
  }

  saveMessage(cityName: string[],locationId: string[] )
  {
    globalThis.Preferences().then((preferences:ESObject)=>{
      preferences.put(KEY_NAME,cityName)
      preferences.put(KEY_ID,locationId)
      preferences.flush()
    }).catch((err: string) => {
      console.error('保存失败，err:' + err)
    })
  }

  async getCityName() {
    let cityname: string [] = ['北京']
    const preferences:ESObject = await globalThis.Preferences()
    cityname = await preferences.get(KEY_NAME,cityname)
    return cityname

  }

  async getLocationId() {
    let locationid: string[] = ['101010100']
    const preferences:ESObject = await globalThis.Preferences()
    locationid = await preferences.get(KEY_ID,locationid)
    return locationid

  }
}

export default new PreferencesUtil()