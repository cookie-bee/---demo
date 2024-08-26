import {daily} from './daily'

export class DailyWeather {
  code: string = ''
  updateTime: string = ''
  fxLink: string = ''
  daily: Array<daily> = []
}