/* eslint-disable */
/* This file is generated by protoc-gen-ts-msw-handlers */
/* Do not edit this file manually */
import { http, HttpResponse } from 'msw'
const ApiV1AssetsPostHandler = http.post('/api/v1/assets',() => {
  return new HttpResponse.json({
    id:'3f9bcb11-5078-4490-a10b-d277f454adcb',
  })
})
const ApiV1AssetsIdDeleteHandler = http.delete('/api/v1/assets/{id}',() => {
  return new HttpResponse.json({
    status:'ok',
  })
})
export const assetsServiceHandlers = [
  ApiV1AssetsPostHandler,
  ApiV1AssetsIdDeleteHandler,
]
