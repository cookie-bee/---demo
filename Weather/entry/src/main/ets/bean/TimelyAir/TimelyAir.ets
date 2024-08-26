import {now} from  './now'
import  {station} from  './station'

export class TimelyAir {

  code: string = ''
  updateTime: string = ''
  fxLink: string = ''
  now: now = new now()
  station: Array<station> = []
}