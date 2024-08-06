import {lives} from "./lives"

export class TimelyWeatherModel {
  status: number = 0
  count: number = 0
  info: string = ''
  infocode: number = 0
  lives: Array<lives> = []
}