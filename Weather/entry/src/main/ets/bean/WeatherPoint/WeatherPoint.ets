import {daily} from './daily'

export class WeatherPoint {

  code: string = ''
  updateTime: string = ''
  fxLInk: string = ''
  daily: Array<daily> = []
}