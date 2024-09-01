import { http } from '@kit.NetworkKit'
import {DailyWeather} from '../bean/DailyWeather/DailyWeather'
import {TimelyWeather} from '../bean/TimelyWeather/TimelyWeather'
import {TimelyAir} from  '../bean/TimelyAir/TimelyAir'
import {HourlyWeather} from  '../bean/HourlyWeather/HourlyWeather'
import {WeatherPoint} from '../bean/WeatherPoint/WeatherPoint'
import {CitySearch} from '../bean/CitySearch/CitySearch'
import {SunRiseSet} from '../bean/SunRiseSet/SunRiseSet'

export class getWeatherUtil{

  //获取实时天气
  getTimelyWeather(locationId: string)
  {
    return new Promise<TimelyWeather>((resolve, reject) => {

      let request = http.createHttp()

      request.request(`https://devapi.qweather.com/v7/weather/now?location=${locationId}&key=16d8d9c11a9848d1be949b4f440c3611&gzip=n`,
        {
          method: http.RequestMethod.GET
        }
      )
        .then(res => {
          if (res.responseCode === 200) {
            console.log('testTag1', res.result)
            resolve(JSON.parse(res.result.toString()))
          } else {
            console.log('查询失败1,', JSON.stringify(res.result))
            reject('失败1')
          }
        })
        .catch((err: Error) => {
          console.log('查询失败2,', JSON.stringify(err))
          reject('失败2')
        })
    })
  }

  //获取单个城市实时天气
  async getTimelyWeather_1(locationId: string): Promise<TimelyWeather>{

    const weatherModel = await this.getTimelyWeather(locationId)
    console.log(weatherModel.code)
    return weatherModel

  }

  //获取未来七天天气
  getDailyWeather(locationId: string )
  {
    return new Promise<DailyWeather>((resolve, reject) => {

      let request = http.createHttp()

      request.request(`https://devapi.qweather.com/v7/weather/7d?location=${locationId}&key=16d8d9c11a9848d1be949b4f440c3611&gzip=n`,
        {
          method: http.RequestMethod.GET
        }
      )
        .then(res => {
          if (res.responseCode === 200) {
            console.log('testTag1', res.result)
            resolve(JSON.parse(res.result.toString()))
          } else {
            console.log('查询失败1,', JSON.stringify(res.result))
            reject('失败1')
          }
        })
        .catch((err: Error) => {
          console.log('查询失败2,', JSON.stringify(err))
          reject('失败2')
        })
    })
  }

  //获取单个城市未来七天天气
  async getDailyWeather_1(locationId:string): Promise<DailyWeather>{

    const weatherModel = await this.getDailyWeather(locationId)
    console.log(weatherModel.code)
    return weatherModel

  }

  //获取实时空气质量
  getTimelyAir(locationId: string)
  {
    return new Promise<TimelyAir>((resolve, reject) => {

      let request = http.createHttp()

      request.request(`https://devapi.qweather.com/v7/air/now?location=${locationId}&key=16d8d9c11a9848d1be949b4f440c3611&gzip=n`,
        {
          method: http.RequestMethod.GET
        }
      )
        .then(res => {
          if (res.responseCode === 200) {
            console.log('testTag1', res.result)
            resolve(JSON.parse(res.result.toString()))
          } else {
            console.log('查询失败1,', JSON.stringify(res.result))
            reject('失败1')
          }
        })
        .catch((err: Error) => {
          console.log('查询失败2,', JSON.stringify(err))
          reject('失败2')
        })
    })
  }

  //获取单个城市实时空气质量
  async getTimelyAir_1(locationId: string): Promise<TimelyAir>{

    const weatherModel = await this.getTimelyAir(locationId)
    console.log(weatherModel.code)
    return weatherModel

  }

  //获取未来24小时天气
  getHourlyWeather(locationId: string )
  {
    return new Promise<HourlyWeather>((resolve, reject) => {

      let request = http.createHttp()

      request.request(`https://devapi.qweather.com/v7/weather/24h?location=${locationId}&key=16d8d9c11a9848d1be949b4f440c3611&gzip=n`,
        {
          method: http.RequestMethod.GET
        }
      )
        .then(res => {
          if (res.responseCode === 200) {
            console.log('testTag1', res.result)
            resolve(JSON.parse(res.result.toString()))
          } else {
            console.log('查询失败1,', JSON.stringify(res.result))
            reject('失败1')
          }
        })
        .catch((err: Error) => {
          console.log('查询失败2,', JSON.stringify(err))
          reject('失败2')
        })
    })
  }

  //获取单个城市未来24小时天气
  async getHourlyWeather_1(locationId: string): Promise<HourlyWeather>{

    const weatherModel = await this.getHourlyWeather(locationId)
    console.log(weatherModel.code)
    return weatherModel

  }


//获取全部天气指数
getWeatherPoint(locationId: string)
{
  return new Promise<WeatherPoint>((resolve, reject) => {

    let request = http.createHttp()

    request.request(`https://devapi.qweather.com/v7/indices/1d?type=0&location=${locationId}&key=16d8d9c11a9848d1be949b4f440c3611&gzip=n`,
      {
        method: http.RequestMethod.GET
      }
    )
      .then(res => {
        if (res.responseCode === 200) {
          console.log('testTag1', res.result)
          resolve(JSON.parse(res.result.toString()))
        } else {
          console.log('查询失败1,', JSON.stringify(res.result))
          reject('失败1')
        }
      })
      .catch((err: Error) => {
        console.log('查询失败2,', JSON.stringify(err))
        reject('失败2')
      })
  })
}

//获取单个城市未来24小时天气
async getWeatherPoint_1(locationId: string ): Promise<WeatherPoint>{

  const weatherModel = await this.getWeatherPoint(locationId)
  console.log(weatherModel.code)
  return weatherModel

}

//根据城市IF获取城市信息
getCityMessage_id(locationId: string)
  {
    return new Promise<CitySearch>((resolve, reject) => {

      let request = http.createHttp()

      request.request(`https://geoapi.qweather.com/v2/city/lookup?location=${locationId}&key=16d8d9c11a9848d1be949b4f440c3611&gzip=n`,
        {
          method: http.RequestMethod.GET
        }
      )
        .then(res => {
          if (res.responseCode === 200) {
            console.log('testCity', res.result)
            resolve(JSON.parse(res.result.toString()))
          } else {
            console.log('查询失败5,', JSON.stringify(res.result))
            reject('失败5')
          }
        })
        .catch((err: Error) => {
          console.log('查询失败6,', JSON.stringify(err))
          reject('失败6')
        })
    })
  }

//获取单个id所指定的城市数据
async getCityMessage_id_1(locationId: string ): Promise<CitySearch>
{

    const weatherModel = await this.getCityMessage_id(locationId)
    console.log(weatherModel.code)
    return weatherModel

  }

//发送多个url来获取多个城市数据
async getCityMessage_id_2(locationIdList: Array<string>){
  let promises :Array<Promise<CitySearch>> = []
  let CityMessageList :Array<CitySearch> = []
  for(let i = 0;i < locationIdList.length; i++)
  {
    promises.push(this.getCityMessage_id(locationIdList[i]))
  }

  await Promise.all(promises).then(result=>{
    for(const element of result) {
      console.log(element.location[0].name)
    }
    CityMessageList = result
  })
  return CityMessageList
}

//获取当天时间
getTodayDate() {
  let date = new Date()
  let year = date.getFullYear();
  let month = (date.getMonth() + 1).toString().padStart(2, '0');
  let day = date.getDate().toString().padStart(2, '0');

  let formattedDate = `${year}${month}${day}`
  return formattedDate
}

getSunMessage(locationId: string) {
    return new Promise<SunRiseSet>((resolve, reject) => {

      let request = http.createHttp()

      let Date = this.getTodayDate

      request.request(`https://devapi.qweather.com/v7/astronomy/sun?location=${locationId}}&date=${Date}&key=16d8d9c11a9848d1be949b4f440c3611&gzip=n`,
        {
          method: http.RequestMethod.GET
        }
      )
        .then(res => {
          if (res.responseCode === 200) {
            console.log('testCity', res.result)
            resolve(JSON.parse(res.result.toString()))
          } else {
            console.log('查询失败5,', JSON.stringify(res.result))
            reject('失败5')
          }
        })
        .catch((err: Error) => {
          console.log('查询失败6,', JSON.stringify(err))
          reject('失败6')
        })
    })
}

//获取单个城市日升日落信息
async getSunMessage_1(locationId: string ): Promise<SunRiseSet>
{

    const weatherModel = await this.getSunMessage(locationId)
    console.log(weatherModel.code)
    return weatherModel

}

}


let getweatherUtil = new getWeatherUtil()
export default getweatherUtil as getWeatherUtil
