# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


tag = document.createElement('script')

tag.src = "https://www.youtube.com/iframe_api"
firstScriptTag = document.getElementsByTagName('script')[0]
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag)


setupVideos = ->
  $('.video-float-box').each (idx, el) ->
    $el = $(el)
    player = new YT.Player(el, {
      height: 195,
      width: 320,
      videoId: $el.data('embedId'),
      playerVars: {
        autohide: 1,
        autoplay: 1,
        modestbranding: 1,
        controls: 1,
        loop: 1,
        playlist: $el.data('embedId')
      },
      events: {
        'onReady': onPlayerReady,
        'onStateChange': onPlayerStateChange
      }
    })

    onPlayerReady = (event) ->
      event.target.playVideo()

    onPlayerStateChange = (event) ->
      
      
window.onYouTubeIframeAPIReady = ->
  setupVideos()
  setupRows()

setupRows = ->
  row1 = document.createElement('div')
  row2 = document.createElement('div')
  row3 = document.createElement('div')
  row1.id = "video-row-1"
  row2.id = "video-row-2"
  row3.id = "video-row-3"

  $(row1).hover((e) ->
    $(row1).css('-webkit-animation-play-state', 'paused')
  , (e) ->
    $(row1).css('-webkit-animation-play-state', 'running'))

  $(row2).hover((e) ->
    $(row2).css('-webkit-animation-play-state', 'paused')
  , (e) ->
    $(row2).css('-webkit-animation-play-state', 'running'))

  $(row3).hover((e) ->
    $(row3).css('-webkit-animation-play-state', 'paused')
  , (e) ->
    $(row3).css('-webkit-animation-play-state', 'running'))

  $('#video-container').append(row1)
  $('#video-container').append(row2)
  $('#video-container').append(row3)
  
  $('.video-float-box').each (idx, el) ->
    switch idx % 3
      when 0 then $(el).appendTo($('#video-row-1'))
      when 1 then $(el).appendTo($('#video-row-2'))
      when 2 then $(el).appendTo($('#video-row-3'))

    setupRow(1, $('#video-row-1').children().length)
    setupRow(2, $('#video-row-2').children().length)
    setupRow(3, $('#video-row-3').children().length)

ELEMENT_SIZE = 320
RING_RADIUS = 300
setupRow = (rowIdx, elementCount) ->
  rowId = "#video-row-#{rowIdx}"
  angleChange = 360/elementCount
  $(rowId).children().each (idx, el) ->
    transform = "rotateY(#{idx * angleChange}deg) translateZ(#{RING_RADIUS}px)"
    $(el).css('-webkit-transform', transform)

$('.video-stream').click((e) ->
  e.target.requestFullScreen())
