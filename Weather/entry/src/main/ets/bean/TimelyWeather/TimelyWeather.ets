import {now} from "./now"
import {refer} from './refer'

export class TimelyWeather {
  code: string = ''
  updateTime: string = ''
  fxLink: string = ''
  now: now = new now()
  refer:refer = new refer()
}