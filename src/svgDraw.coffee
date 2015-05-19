# Converted from https://gist.github.com/alojzije/11127839#file-demo-png
module.exports = {
  signum: (x) ->
    if x < 0 then -1 else 1

  absolute: (x) ->
    if x < 0 then -x else x

  drawPath: (svg, path, startX, startY, endX, endY) ->
    # get the path's stroke width (if one wanted to be  really precize, one could use half the stroke size)
    stroke = parseFloat(path.attr('stroke-width'))
    # check if the svg is big enough to draw the path, if not, set heigh/width
    if svg.attr('height') < endY
      svg.attr 'height', endY
    if svg.attr('width') < startX + stroke
      svg.attr 'width', startX + stroke
    if svg.attr('width') < endX + stroke
      svg.attr 'width', endX + stroke + 20
    deltaX = (endX - startX) * 0.15
    deltaY = (endY - startY) * 0.15
    # for further calculations which ever is the shortest distance
    delta = if deltaY < @absolute(deltaX) then deltaY else @absolute(deltaX)
    # set sweep-flag (counter/clock-wise)
    # if start element is closer to the left edge,
    # draw the first arc counter-clockwise, and the second one clock-wise
    arc1 = 0
    arc2 = 1
    if startX > endX
      arc1 = 1
      arc2 = 0
    # draw tha pipe-like path
    # 1. move a bit down, 2. arch,  3. move a bit to the right, 4.arch, 5. move down to the end
    path.attr 'd', "M#{startX} #{startY} V#{startY + delta} A#{delta} #{delta} 0 0 #{arc1} #{startX + delta * @signum(deltaX)} #{startY + 2 * delta} H#{endX - (delta * @signum(deltaX))} A#{delta} #{delta} 0 0 #{arc2} #{endX} #{startY + 3 * delta} V#{endY}"
    return

  connectElements: (svg, path, startElem, endElem) ->
    svgContainer = $('#svgContainer')
    # if first element is lower than the second, swap!
    if startElem.offset().top > endElem.offset().top
      temp = startElem
      startElem = endElem
      endElem = temp
    # get (top, left) corner coordinates of the svg container
    svgTop = svgContainer.offset().top
    svgLeft = svgContainer.offset().left
    # get (top, left) coordinates for the two elements
    startCoord = startElem.offset()
    endCoord = endElem.offset()
    # calculate path's start (x,y)  coords
    # we want the x coordinate to visually result in the element's mid point
    startX = startCoord.left + 0.5 * startElem.outerWidth() - svgLeft
    # x = left offset + 0.5*width - svg's left offset
    startY = startCoord.top + startElem.outerHeight() - svgTop
    # y = top offset + height - svg's top offset
    # calculate path's end (x,y) coords
    endX = endCoord.left + 0.5 * endElem.outerWidth() - svgLeft
    endY = endCoord.top - svgTop
    # call function for drawing the path
    @drawPath svg, path, startX, startY, endX, endY
    return
}
