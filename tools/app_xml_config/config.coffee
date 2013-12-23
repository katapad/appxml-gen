_ = require 'lodash'

{common, dev, rel} = require './base.config.coffee'

android = require './android.config.coffee'
ios = require './ios.config.coffee'



_override = (target, over)->
  _.merge target, over


_addExtensions = (list, addList)->
  return list.concat addList


_getManifesst = (id)->
  return _replaceId android.base.manifest, id

_replaceId = (src, id)->
  return src.replace /__id__/gm, id

_escapeLB = (str)->
  return str.replace /\r\n/gm, '\\r\\n'


getData = (base, envConfig) ->
  result = _.cloneDeep base

  _override result, common
  _override result, envConfig

  return result


getAndroidData = (base, envConfig, isSim = false) ->
  result = _.cloneDeep common

  _override result, envConfig
  _override result, android.base
  _override result, base
  if not isSim
    result.extensions = _addExtensions result.extensions, android.device.addExtensions

  result.manifest = _getManifesst(result.id)

  return result

getIOSData = (base, envConfig, isSim = false) ->
  result = _.cloneDeep common

  _override result, envConfig
  _override result, ios.base
  _override result, base
  if not isSim
    result.extensions = _addExtensions result.extensions, ios.device.addExtensions

  result.InfoAdditions = _escapeLB(result.InfoAdditions)
  result.Entitlements = _replaceId(result.Entitlements, result.id)

  return result


module.exports = exports =
  appXmlConfig:
    android: android
    ios: ios
    dev: dev
    rel: rel

    getAndroidData: getAndroidData
    getIOSData: getIOSData


